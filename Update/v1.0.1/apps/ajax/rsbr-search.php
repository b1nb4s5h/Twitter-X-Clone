<?php
require_once("../../core/xclone_web_core.phtml");

$search = mysqli_real_escape_string($conn, $_POST['search']);

$sql_users = "SELECT * FROM xclone_users WHERE account_status = 0 AND (fullname LIKE '%" . $search . "%' OR username LIKE '%" . $search . "%') AND id <> " . mysqli_real_escape_string($conn, $_SESSION["user_id"]);
$result_users = mysqli_query($conn, $sql_users);

$sql_hashtags = "SELECT * FROM xclone_hashtag WHERE htag LIKE '%" . $search . "%'";
$result_hashtags = mysqli_query($conn, $sql_hashtags);

if (mysqli_num_rows($result_users) > 0 || mysqli_num_rows($result_hashtags) > 0) {
  echo "<div class='xclone-livesearch-box'>";
  
  while($row = mysqli_fetch_assoc($result_users)) {
    echo '<div class="livesearch-userbox">';
        echo '<div class="checksearch-livebox">';
            echo "<a href='/@".htmlspecialchars($row["username"])."'><img src='/".htmlspecialchars($row["avatar"])."'></a>";
            echo "<h5>".htmlspecialchars($row["fullname"])."</h5>";
            echo "<span>@".htmlspecialchars($row["username"])."</span>";
        echo '</div>';
    echo '</div>';
  }
  
  while($row = mysqli_fetch_assoc($result_hashtags)) {
    echo '<div class="livesearch-userbox">';
    echo '<a href="/search?p='.htmlspecialchars($row["htag"]).'"><h3>
    <svg viewBox="0 0 24 24" aria-hidden="true"><g><path d="M10.25 3.75c-3.59 0-6.5 2.91-6.5 6.5s2.91 6.5 6.5 6.5c1.795 0 3.419-.726 4.596-1.904 1.178-1.177 1.904-2.801 1.904-4.596 0-3.59-2.91-6.5-6.5-6.5zm-8.5 6.5c0-4.694 3.806-8.5 8.5-8.5s8.5 3.806 8.5 8.5c0 1.986-.682 3.815-1.824 5.262l4.781 4.781-1.414 1.414-4.781-4.781c-1.447 1.142-3.276 1.824-5.262 1.824-4.694 0-8.5-3.806-8.5-8.5z"></path></g></svg>
    #'.htmlspecialchars($row["htag"]).'</h3></a>';
    echo "</div>";
  }

} else {
    echo '<div class="livesearch-error">';
    echo '<h6>'.xclone_translate("rsbr_search_text_3").'</h6>';
    echo "</div>";
}

mysqli_close($conn);






