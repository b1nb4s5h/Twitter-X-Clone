<?php
require_once("../../core/xclone_web_core.phtml");
$settings = xclone_site_settings();

$q = '';
if (isset($_GET['q'])) {
    $q = mysqli_real_escape_string($conn, htmlspecialchars($_GET['q']));
}
if($settings["hashtag_display"]=="daily"){
    $sql = "SELECT htag, SUM(total_post) AS total_post
    FROM xclone_hashtag
    WHERE add_date >= NOW() - INTERVAL 24 HOUR
    GROUP BY htag
    ORDER BY total_post DESC
    LIMIT 10;";
} else if($settings["hashtag_display"]=="weekly"){
    $sql = "SELECT htag, SUM(total_post) AS total_post
    FROM xclone_hashtag
    WHERE add_date >= NOW() - INTERVAL 1 WEEK
    GROUP BY htag
    ORDER BY total_post DESC
    LIMIT 10;";
} else if($settings["hashtag_display"]=="monthly"){
    $sql = "SELECT htag, SUM(total_post) AS total_post
    FROM xclone_hashtag
    WHERE add_date >= NOW() - INTERVAL 1 MONTH
    GROUP BY htag
    ORDER BY total_post DESC
    LIMIT 10;";
} else if($settings["hashtag_display"]=="all"){
    $sql = "SELECT * FROM xclone_hashtag ORDER BY total_post DESC LIMIT 10";
}
$result = mysqli_query($conn, $sql);

if ($result) {
    $i = 1;
    while ($row = mysqli_fetch_assoc($result)) {
?>
        <?php require("../../themes/default/apps/main/sidebar/sidebar-system/htags.phtml"); ?>
        <?php
        $i++;
    }
    if($i == 1){
        require("../../themes/default/apps/main/sidebar/sidebar-system/no-rsbr-value.phtml");
    }
} else {
    require("../../themes/default/apps/main/sidebar/sidebar-system/no-rsbr-value.phtml");
}
mysqli_close($conn);
