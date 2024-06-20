<?php
if(isset($_POST['submit'])) {
    $vipub_db_host = $_POST['db_host'];
    $vipub_db_user = $_POST['db_user'];
    $vipub_db_pass = $_POST['db_pass'];
    $vipub_db_name = $_POST['db_name'];
    $filename = 'core/dbconnect.phtml';
    $content = '<?php' . PHP_EOL;
    $content .= '$vipub_db_host = \'' . $vipub_db_host . '\';' . PHP_EOL;
    $content .= '$vipub_db_user = \'' . $vipub_db_user . '\';' . PHP_EOL;
    $content .= '$vipub_db_pass = \'' . $vipub_db_pass . '\';' . PHP_EOL;
    $content .= '$vipub_db_name = \'' . $vipub_db_name . '\';' . PHP_EOL;
  
    try {
      if(file_put_contents($filename, $content)) {
        $url = '/welcome/login';
        $delay = 10;
        header("Refresh: $delay; url=$url");
      } else {
        throw new Exception('The file could not be created.');
      }
    } catch(Exception $e) {
      echo 'Hata: ' . $e->getMessage();
    }
    $sql_file = 'vipub-sm.sql';
    $command = "mysql -u {$vipub_db_user} -p{$vipub_db_pass} -h {$vipub_db_host} {$vipub_db_name} < $sql_file";
  
    $mysql = new mysqli($vipub_db_host, $vipub_db_user, $vipub_db_pass, $vipub_db_name);
  
    if ($mysql->connect_errno) {
      echo "Bağlantı hatası: " . $mysql->connect_error;
      exit();
    }
  
    if ($mysql->multi_query(file_get_contents($sql_file))) {
      do {
        if ($result = $mysql->store_result()) {
          $result->free();
        }
        if (!$mysql->more_results()) {
          break;
        }
      } while ($mysql->next_result());
      echo '<div class="alert alert-success text-center">
      Vipub has been successfully installed!<br><br> You will be redirected to the homepage in 10 seconds. <br><br> To log in as an administrator: use "admin" - "admin" and dont forget to delete the "install.php" file in the main directory.
      </div>';
      $url = '/welcome/login';
      $delay = 3;
      header("Refresh: $delay; url=$url");
    } else {
      echo 'Hata: ' . $mysql->error;
    }
    $mysql->close();
  }
?>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.3/css/bootstrap.min.css" integrity="sha512-SbiR/eusphKoMVVXysTKG/7VseWii+Y3FdHrt0EpKgpToZeemhqHeZeLWLhJutz/2ut2Vw1uQEj2MbRF+TVBUA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="icon" type="image/png" href="/themes/default/statics/images/favicon.png">
    <title>Automatic Installation | Vipub - PHP Twitter Social Networking Platform</title>
  </head>
  <body>

  <div class="row">
  <div class="col-md-6">
    <div class="vipub-install justify-content-center align-items-center">
        <div class="install-div text-center">
            <img src="themes/default/statics/images/favicon.png">
            <h5 style="font-weight: 700;">Vipub - PHP Twitter Social Networking Platform</h5>
            <small>With automatic installation, you will be able to install your Vipub script in seconds!</small>
        </div>
        <div class="install-form-group">
            <form method="post">
                <div class="form-floating">
                    <input type="text" name="db_host" class="form-control" id="db_host" placeholder="Database host" value="localhost" required>
                    <label for="db_host">Database host
                </div>
    
                <div class="form-floating">
                    <input type="text" name="db_user" class="form-control" id="db_user" placeholder="Database user" required>
                    <label for="db_user">Database user
                </div>
    
                <div class="form-floating">
                    <input type="text" name="db_pass" class="form-control" id="db_pass" placeholder="Database password" required>
                    <label for="db_pass">Database password
                </div>
    
                <div class="form-floating">
                    <input type="text" name="db_name" class="form-control" id="db_name" placeholder="Database name" required>
                    <label for="db_name">Database name
                </div>
    
                <button type="submit" name="submit" class="btn btn-success">Install Vipub</button>
            </form>
        </div>
    
        <div class="install-div footer text-center">
            <small>This script was created by Robert Dayzen. Marketing and selling is prohibited.<br>
            <a href="https://codecanyon.net/user/robertdayzen" target="_blank">Vipub - Advanced PHP Twitter Social Media Platform</a>
            </small>
        </div>
    </div>
</div>
<div class="col-md-6">
  <div class="php-vipub-modules" style="padding: 30px; background: #1da1f2; min-height: 100vh; color: #fff;">
    <div class="container mt-5">
      <div class="row justify-content-center">
        <div class="col-md-6">
          <?php
            $required_modules = array(
              'Core' => 'PHP 8.1',
              'gd' => 'GD Library',
              'curl' => 'cURL',
              'mysqli' => 'MySQLi',
              'mbstring' => 'MBstring',
              'zip' => 'PHP Zip Module'
            );
            $loaded_modules = get_loaded_extensions();
            $php_version = phpversion();
          ?>
        <div class="modules-descpr" style="position: relative; margin-bottom: 40px;">
          <h5 style=
          "
          font-size: 20px;
          font-weight: 800;
          line-height: 25px;
          "
          >Please make sure your server fulfills the requirements to run Vipub.</h5>
        </div>
        <p class="lead mb-4" style="font-size: 15px; font-weight: 700; padding: 10px 25px; border-radius: 50px; color: #fff; background: #0f1419; text-align: center; user-select: none;">Current PHP version: <?php echo $php_version; ?></p>
          <!-- Tablo -->
          <table class="table" style="font-size: 15px; color: #0f1419; background: #F5F8FD; border-radius: 5px;">
            <thead>
              <tr>
                <th>Module Name</th>
                <th>Status</th>
              </tr>
            </thead>
            <tbody>
            <?php foreach ($required_modules as $module => $description): ?>
                <?php
                  $status = 'Not installed on server';
                  if ($description === 'PHP 8.1') {
                    $status = version_compare($php_version, '8.1.0', '>=') ? 'installed on server' : 'Not installed on server';
                  } elseif (in_array($module, $loaded_modules)) {
                    $status = 'installed on server';
                  }
                ?>
              <tr>
                <td><?= $description ?></td>
                <?php if($status=="installed on server"): ?>
                <td style="color: green; font-weight: 500;">installed on server</td>
                <?php elseif($status=="Not installed on server"): ?>
                <td style="color: red; font-weight: 500;">Not installed on server</td>
                <?php endif; ?>
              </tr>
              <?php endforeach; ?>
            </tbody>
          </table>
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
        .vipub-install{
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
            position: relative;
            bottom: 0;
            margin-top: 50px;
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