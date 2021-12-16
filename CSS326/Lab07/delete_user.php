<?php
// Connect to the database
$mysqli = new mysqli("localhost", "root", null, "css326_lab6");

if ($mysqli->connect_errno) {
  echo $mysqli->connect_error;
}

if (isset($_GET["email"])){

  $email = $_GET["email"];
  $query = "DELETE FROM user WHERE email = '$email'";
  $result = $mysqli->query($query);

  if (!$result){
      echo "Delete failed!<br/>";
      echo $mysqli->error;
  } else {
    header( "location: user.php" );
  }
}

?>