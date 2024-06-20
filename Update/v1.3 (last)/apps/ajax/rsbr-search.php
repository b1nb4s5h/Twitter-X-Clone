<?php
require_once("../../core/vipub_web_core.phtml");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $search = trim($_POST['search']);

  if (!empty($search)) {
      $search = mysqli_real_escape_string($conn, $search);
      $user_id = mysqli_real_escape_string($conn, $_SESSION["user_id"]);

      $sql_users = "SELECT * FROM vipub_users WHERE account_status = 0 AND (fullname LIKE ? OR username LIKE ?) AND id <> ?";
      $stmt_users = $conn->prepare($sql_users);
      $param = "%$search%";
      $stmt_users->bind_param("ssi", $param, $param, $user_id);
      $stmt_users->execute();
      $result_users = $stmt_users->get_result();

      $sql_hashtags = "SELECT * FROM vipub_hashtag WHERE htag LIKE ?";
      $stmt_hashtags = $conn->prepare($sql_hashtags);
      $param = "%$search%";
      $stmt_hashtags->bind_param("s", $param);
      $stmt_hashtags->execute();
      $result_hashtags = $stmt_hashtags->get_result();

      if ($result_users->num_rows > 0 || $result_hashtags->num_rows > 0) {
        echo '<div class="in-live-search-container">';
        while ($row = $result_users->fetch_assoc()) {
         
          echo '<div class="right-sidebar-live-search-container" data-vipub-url="' . vipub_link("@" . $row["username"]) . '">';
          echo '<div class="livesearch-user-info">';
          echo '<a href="' . vipub_link("@" . $row["username"]) . '">';
          echo '<img src="' . vipub_link($row["avatar"]) . '">';
          echo '</a>';
          echo '<h5>' . $row["username"];
          
          if ($row["verified"] == "1") {
              echo vipub_userBlue();
          }
          
          echo '</h5>';
          echo '<p>';
          echo '<span>' . $row["fullname"] . ' • </span>';
          echo '<small>' . $row["followers"] . ' ' . vipub_translate("my_followers") . '</small>';
          echo '</p>';
          echo '</div>';
          echo '</div>';
        }

          while ($row = $result_hashtags->fetch_assoc()) {
              echo '<div class="livesearch-userbox" data-vipub-url="' . vipub_link("explore?q=" . $row["htag"]) . '">';
              echo '<a href="/explore?q=' . htmlspecialchars($row["htag"]) . '">
                      <i class="bi bi-hash"></i>
                        <small>#'.htmlspecialchars($row["htag"]).'
                        
                        <span>'.htmlspecialchars($row["total_post"]).' tweet</span>
                        </small>
                    </a>
                    
                    ';
                    
              echo "</div>";
          }
      } else {
          echo '<div class="livesearch-error">';
          echo '<h6>' . vipub_translate("rsbr_search_text_3") . '</h6>';
          echo "</div>";
      }
      echo '</div">';

      $stmt_users->close();
      $stmt_hashtags->close();
      mysqli_close($conn);
  }
}






