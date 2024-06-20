<?php
require_once("../../core/vipub_web_core.phtml");

if (isset($_SESSION["user_id"])) {
    $sql = "SELECT *
        FROM vipub_users 
        WHERE id NOT IN (SELECT user_id FROM vipub_follow WHERE follower_id = ?)
        AND id != ?
        AND account_status = 0 
        ORDER BY RAND() DESC LIMIT 10";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, "ii", $_SESSION["user_id"], $_SESSION["user_id"]);
} else {
    $sql = "SELECT * FROM vipub_users 
        WHERE account_status = 0 
        ORDER BY RAND() 
        LIMIT 10";
    $stmt = mysqli_prepare($conn, $sql);
}

if (mysqli_stmt_execute($stmt)) {
    $result = mysqli_stmt_get_result($stmt);

    if (mysqli_num_rows($result) > 0) {
        $i = 1;
        while ($row = mysqli_fetch_assoc($result)) {
            require("../../themes/default/apps/main/sidebar/sidebar-system/follow.phtml");
            $i++;
        }
    } else {
        require("../../themes/default/apps/main/sidebar/sidebar-system/no-rsbr-value.phtml");
    }
} else {
    die("Hata: " . mysqli_error($conn));
}
mysqli_stmt_close($stmt);
mysqli_close($conn);
