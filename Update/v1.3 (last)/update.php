
<?php
require_once("core/xclone_web_core.phtml");

if (isset($_POST['xcloneUpdate'])) {
    $sql_array = array(
        "ALTER TABLE xclone_users
            ADD premium_account INT(11) NOT NULL DEFAULT '0',
            ADD verified_category INT(11) NOT NULL DEFAULT '0',
            ADD oauth VARCHAR(255) DEFAULT NULL;",

        "CREATE TABLE IF NOT EXISTS xclone_repost (
            r_id INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
            repost_user_id INT(11) NOT NULL,
            repost_post_id INT(11) NOT NULL,
            reposted_at DATETIME DEFAULT CURRENT_TIMESTAMP
        );",

        "CREATE TABLE IF NOT EXISTS xclone_bookmarks (
            b_id INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
            user_id VARCHAR(255) NOT NULL,
            post_id INT(11) NOT NULL,
            post_bookmarks DATETIME DEFAULT CURRENT_TIMESTAMP
        );",

        "CREATE TABLE IF NOT EXISTS xclone_session (
            id INT AUTO_INCREMENT PRIMARY KEY,
            session_user_id INT(11) NOT NULL,
            last_seen TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
        );",

        "CREATE TABLE IF NOT EXISTS xclone_add_balance (
            b_id INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
            user_id INT(11) NOT NULL,
            added_balance VARCHAR(255) NOT NULL,
            type VARCHAR(255) NOT NULL,
            receipt_image VARCHAR(255) NOT NULL,
            status INT(11) NOT NULL,
            added_date DATETIME DEFAULT CURRENT_TIMESTAMP
        );",

        "CREATE TABLE IF NOT EXISTS xclone_premium_package (
            pack_id INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
            package_price VARCHAR(255) NOT NULL,
            package_name VARCHAR(255) NOT NULL DEFAULT 'Individual'
        );",

        "INSERT INTO xclone_premium_package (package_price, package_name) VALUES
        ('25', 'Individual'),
        ('75', 'Establishment');",

        "CREATE TABLE IF NOT EXISTS xclone_premium_active_users (
            au_id INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
            user_id INT(11) NOT NULL,
            package_id INT(11) NOT NULL,
            subs_status VARCHAR(25) DEFAULT '1',
            starting_date DATETIME DEFAULT CURRENT_TIMESTAMP,
            end_date DATETIME DEFAULT CURRENT_TIMESTAMP
        );",

        "CREATE TABLE IF NOT EXISTS xclone_oauth_settings (
            oa_id INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
            twitter_api_key VARCHAR(255) DEFAULT NULL,
            twitter_api_key_secret VARCHAR(255) DEFAULT NULL,
            twitter_callback_url VARCHAR(255) DEFAULT NULL,
            twitter_login_status VARCHAR(255) DEFAULT '0',
            oauth_name VARCHAR(255) NOT NULL DEFAULT ''
        );",

        "INSERT INTO xclone_oauth_settings (twitter_callback_url) VALUES ('YourTwitterCallbackURL');",

        "ALTER TABLE xclone_posts
            ADD content_gif VARCHAR(255) DEFAULT NULL,
            ADD bookmarks VARCHAR(255) DEFAULT '0',
            ADD reply_status INT(11) NOT NULL DEFAULT '1',
            ADD post_lang VARCHAR(50) DEFAULT 'en',
            ADD language_match VARCHAR(50) DEFAULT NULL;",

        "ALTER TABLE xclone_settings
            ADD premium_verified INT(11) NOT NULL DEFAULT '0';"
    );

    foreach ($sql_array as $sql) {
        if ($conn->query($sql) === TRUE) {
            echo '<div class="alert alert-success text-center" style="background: #1da1f1; color: #fff; font-size: 25px; font-weight: 500;">
            Xclone Script update completed successfully. <br> You will be redirected to the main page in 3 seconds and please dont forget to delete the (Update.php) file.
            </div>';
            $url = '/home';
            $delay = 3;
            header("Refresh: $delay; url=$url");
        } else {
            echo "Error: " . $conn->error;
        }
    }
}

$conn->close();
?>
<!doctype html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.3/css/bootstrap.min.css" integrity="sha512-SbiR/eusphKoMVVXysTKG/7VseWii+Y3FdHrt0EpKgpToZeemhqHeZeLWLhJutz/2ut2Vw1uQEj2MbRF+TVBUA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="icon" type="image/png" href="/themes/default/statics/images/favicon.png">
    <title>Automatic Update | Xclone - PHP Twitter Social Networking Platform</title>
  </head>
  <body>

  <div class="row mt-lg-4">
    <div class="col-md-12">
      <div class="xclone-install justify-content-center align-items-center">
          <div class="install-div text-center mt-5">
              <img src="themes/default/statics/images/favicon.png">
              <h5 style="font-weight: 700;">Xclone - PHP Twitter Social Networking Platform</h5>
              <small>With automatic update, you will be able to updated your Xclone script in seconds!</small>
          </div>

          <div class="install-form-group" style="font-size: 13px; margin-bottom: 30px;">
              Click the "Update Xclone" button below to update your Xclone script.
              <br><br>
              To see which features have been added and fixed in the Scenario, you can view the entire Changelog by visiting the "Changelog" address on your admin panel.
          </div>

          <div class="install-form-group">
              <form method="post">
                  <button type="submit" name="xcloneUpdate" class="btn btn-success">Update Xclone</button>
              </form>
          </div>
      
          <div class="install-div footer text-center">
              <small>This script was created by Robert Dayzen. Marketing and selling is prohibited.<br>
              <a href="https://codecanyon.net/user/robertdayzen" target="_blank">Xclone - Advanced PHP Twitter Social Media Platform</a>
              </small>
          </div>
    </div>
</div>  



    <style>
        body{
            font-family: Arial, Helvetica, sans-serif;
            font-size: 15px;
            font-weight: 400;
            line-height: 20px;
            overflow-x: none;
            min-height: 100vh !important;
        }
        .xclone-install{
            position: relative;
            display: flex;
            flex-direction: column;
            align-items:center;
            justify-items:center;
            justify-content:center;
            margin-top: 80px;
        }
        .install-div{
            position: relative;
            margin-bottom: 40px;
        }
        .install-div img{
            width: 50px;
            height: 50px;
            position: relative;
            top: -30px;
            margin-bottom: -10px;
        }
        .install-form-group{
            position:relative;
            width: 340px;
        }
        .install-form-group button{
            width: 340px;
            margin-top: 10px;
            border-radius: 50px;
            font-size: 14px;
            font-weight: 700;
        }
        .form-floating{
            margin-bottom: 12px
        }
        .footer{
            position: fixed;
            bottom: 0;
        }
        .footer small a{
            color: #535353;
            font-weight: 700;
            text-decoration: none;
        }
        .footer small a:hover{
            text-decoration: underline;
        }
    </style>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.3/js/bootstrap.min.js" integrity="sha512-1/RvZTcCDEUjY/CypiMz+iqqtaoQfAITmNSJY17Myp4Ms5mdxPS5UV7iOfdZoxcGhzFbOm6sntTKJppjvuhg4g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  </body>
</html>