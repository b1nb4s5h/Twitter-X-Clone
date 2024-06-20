<?php
# @*************************************************************************@
# @ Software author: Robert Dayzen (robertdayzen)                           @
# @ Author_url 2: http://codecanyon.net/user/robertdayzen                   @
# @ Author E-mail: robertdayzen@gmail.com                                   @
# @*************************************************************************@
# @ Xclone - The Ultimate Modern PHP Social Media Sharing Platform           @
# @ Copyright (c) 2022 - 2023 Xclone. All rights reserved.                   @
# @*************************************************************************@
require_once("core/xclone_web_core.phtml");

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    if (isset($_GET['usermedia']) && !empty(trim($_GET['usermedia']))) {
        $username = trim($_GET['usermedia']);
        require("apps/api/profile/user-media.phtml");
    } else {
        http_response_code(400);
        echo json_encode(array("status" => "error", "message" => "You submitted a missing or incorrect username parameter."));
    }
} else {
    http_response_code(405);
    echo json_encode(array("status" => "error", "message" => "You have made an invalid request."));
}