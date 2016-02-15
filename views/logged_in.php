<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>DCIMStack</title>
    <?php
      include      'libraries/css.php';
      include_once 'libraries/general.php';
      include_once 'libraries/events.php';
    ?>
  </head>

  <body>
    <?php include 'libraries/header.php'; ?>
    <div class="container">
      <h1 class="page-header">Dashboard</h1>
      <?php include 'libraries/alerts.php'; ?>
      <div class="row placeholders">
        <div class="col-xs-6 col-sm-3 placeholder">
          <h3><?php echo rackspace_available(); ?>U</h3>
          <h4>Rackspace available</h4>
          <span class="text-muted">Individual U's of rackspace available</span>
        </div>
        <div class="col-xs-6 col-sm-3 placeholder">
          <h3><?php echo rackspace_used(); ?>U</h3>
          <h4>Rackspace used</h4>
          <span class="text-muted">Individual U's of rackspace used</span>
        </div>
        <div class="col-xs-6 col-sm-3 placeholder">
          <h3><?php echo hardware_used(); ?></h3>
          <h4>Total Hardware</h4>
          <span class="text-muted">Individual hardware in DCIMStack</span>
        </div>
        <div class="col-xs-6 col-sm-3 placeholder">
          <h3><?php echo shipments_inbound(); ?></h3>
          <h4>Shipments inbound</h4>
          <span class="text-muted">Individual shipments inbound</span>
        </div>
      </div>
    	<?php
		if (file_exists("install.php")) {
			echo "<div class='alert alert-danger' role='alert'>";
		    echo "<strong>Warning!</strong>";
		    echo " The DCIMStack installer (install.php) still exists! Anyone can overwrite your install by accessing this file! Delete this file right away!";
		    echo "</div>";
		}
		?>
      <h2 class="sub-header">Events</h2>
      <?php list_events_table(20); //from libraries/events.php ?>
      <?php include 'libraries/footer.php'; ?>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <?php include 'libraries/js.php'; ?>
  </body>
</html>
