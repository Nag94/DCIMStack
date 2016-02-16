<?php
$sql = "SELECT * FROM `settings` WHERE `setting`='aftership_api_key'";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    // output data of each row
    while ($row = $result->fetch_assoc()) {
        $aftership_api_key = $row["value"];
    }
} else {
    //echo "0 results";
}
$sql = "SELECT * FROM `settings` WHERE `setting`='librenms_api_key'";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    // output data of each row
    while ($row = $result->fetch_assoc()) {
        $librenms_api_key = $row["value"];
    }
} else {
    //echo "0 results";
}
$sql = "SELECT * FROM `settings` WHERE `setting`='librenms_api_endpoint'";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    // output data of each row
    while ($row = $result->fetch_assoc()) {
        $librenms_api_endpoint = $row["value"];
    }
} else {
    //echo "0 results";
}
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>DCIMStack</title>
    <?php
    include 'libraries/css.php';
    $token = md5(uniqid(rand(), TRUE));
    $_SESSION['token'] = $token;
    ?>
  </head>

  <body>

    <?php include 'libraries/header.php'; ?>

    <div class="container">
          <h1 class="page-header">DCIMStack Settings</h1>
          <?php include 'libraries/alerts.php'; ?>
          <div class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title"><img src='assets/img/lorry.png'> AfterShip API Key</h3>
            </div>
            <div class="panel-body">
              <p>The AfterShip API is used in the "Shipping" feature of DCIMStack for listing tracking status of your shipments to your datacenter.</p>
              <p>Current AfterShip API Key: <?php echo $aftership_api_key; ?></p>
              <form action="settings_db.php" id="aftership_api_key" method="post">
                <input type="hidden" name="token" value="<?php echo $token; ?>">
                <input type="hidden" name="setting" value="aftership_api_key">
                <input type="text" name="value" placeholder="AfterShip API Key" class="form-control" required>
            </div>
            <div class="panel-footer">
              <center><input type="submit" form="aftership_api_key" value="Update" class="btn btn-primary"></center>
            </div>
            </form>
          </div>
        <div class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title"><img src='assets/img/lorry.png'> LibreNMS API Key</h3>
            </div>
            <div class="panel-body">
              <p>Current LibreNMS API Key: <?php echo $librenms_api_key; ?></p>
              <form action="settings_db.php" id="librenms_api_key" method="post">
                <input type="hidden" name="token" value="<?php echo $token; ?>">
                <input type="hidden" name="setting" value="librenms_api_key">
                <input type="text" name="value" placeholder="LibreNMS API Key" class="form-control" required>
            </div>
            <div class="panel-footer">
              <center><input type="submit" form="librenms_api_key" value="Update" class="btn btn-primary"></center>
            </div>
            </form>
          </div>
        <div class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title"><img src='assets/img/lorry.png'> LibreNMS API Endpoint</h3>
            </div>
            <div class="panel-body">
              <p>Example: http://librenms.domain.com/api/v0/devices/</p>
              <p>Current LibreNMS API Endpoint: <?php echo $librenms_api_endpoint; ?></p>
              <form action="settings_db.php" id="librenms_api_endpoint" method="post">
                <input type="hidden" name="token" value="<?php echo $token; ?>">
                <input type="hidden" name="setting" value="librenms_api_endpoint">
                <input type="text" name="value" placeholder="LibreNMS API Endpoint" class="form-control" required>
            </div>
            <div class="panel-footer">
              <center><input type="submit" form="librenms_api_endpoint" value="Update" class="btn btn-primary"></center>
            </div>
            </form>
          </div>
        </div>
      </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <?php include 'libraries/js.php'; ?>
  </body>
</html>
