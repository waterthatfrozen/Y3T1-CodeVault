<?php
// Connect to the database
$mysqli = new mysqli("localhost", "root", null, "css326_lab6");

if ($mysqli->connect_errno) {
  echo $mysqli->connect_error;
}

if (isset($_POST["submit"]) && isset($_GET["email"])){
  $email = $_GET["email"];
  $title = $_POST['title']; 
  $first_name = $_POST['firstname'];
  $last_name = $_POST['lastname'];
  $email = $_POST['email'];
  $usergroup = $_POST['usergroup'];
  if (isset($_POST['disabled'])){
      $is_disabled = 1;
  } else {
      $is_disabled = 0;
  }

	// Excerise 1: (a) Change SQL to UPDATE row according to the given email
  $update_sql = "UPDATE user SET title = '$title', first_name = '$first_name', last_name = '$last_name', 
  usergroup = '$usergroup', disabled = '$is_disabled' WHERE email='$email'";

  $result = $mysqli->query($update_sql);

  if (!$result){
      echo "Update failed!<br/>";
      echo $mysqli->error;
  }else{
	?>
	<script>
		alert("Update Successfully");
		window.location="user.php";
	</script>
	<?
}
}

if (isset($_GET["email"])){

  $email = $_GET["email"];
  $query = "SELECT * FROM user WHERE email = '$email'";
  $result = $mysqli->query($query);

  if (!$result){
      echo "Select failed!<br/>";
      echo $mysqli->error;
  } else {
    $user = $result->fetch_array();
  }
}

?>
<!DOCTYPE html>
<html>
<head>
<title>CSS326 Edit</title>
<link rel="stylesheet" href="default.css">
</head>

<body>

<div id="wrapper"> 
	<div id="div_header">
		CSS326 System 
	</div>
	<div id="div_subhead">
		<ul id="menu">
			<li><a href="user.php">User Profile</a></li>
			<li><a href="add_user.php">Add User</a></li>
			<li><a href="#">User Group</a></li>
			<li><a href="#">Add User Group</a></li>
		</ul>		
	</div>
	<div id="div_main">
		<div id="div_left">
				
		</div>
		<div id="div_content" class="form">
			<!--%%%%% Main block %%%%-->
			<!--Form -->
			
			<form action="edit_user.php?email=<?php echo "$email" ?>" method="post">
					<h2>User Profile</h2>
					<label>Title</label>

					<!-- Excerise 1: (b) make sure title is selected(hint: check usergroup) -->
					<select name="title">
						<option value="Mr."  <?php if($user["title"]=="Mr."){echo "selected";}?>>Mr.</option>
						<option value="Mrs." <?php if($user["title"]=="Mrs."){echo "selected";}?>>Mrs.</option>
						<option value="Ms."  <?php if($user["title"]=="Ms."){echo "selected";}?>>Ms.</option>
					</select>
					
					<label>First name</label>
					<input type="text" name="firstname" value="<?php echo $user["first_name"]?>">
						
					<!-- Excerise 1: (c) Display lastname -->
					<label>Last name</label>
					<input type="text" name="lastname" value="<?php echo $user["last_name"]?>">

					<label>Gender</label>
					<input type="radio" name="gender" value="male" checked>Male
					<input type="radio" name="gender" value="female">Female
					<div></div>
					
					<label>Email</label>
					<input type="text" name="email" value="<?php echo $user["email"]?>" readonly>
					<!-- Excerise 1: (d) Display email -->
										
					<h2> Account Profile</h2>
					<label>Username</label>
					<input type="text" name="username">
					
					<label>Password</label>
					<input type="password" name="passwd">
					
					<label>Confirmed password</label>
					<input type="password" name="cpasswd">
					
					<label>User group</label>
					<select name="usergroup">
						<option value="Instructor" <?php if($user["usergroup"] == "Instructor"){echo "selected";}?>>Instructor</option>
						<option value="Student" <?php if($user["usergroup"] == "Student"){echo "selected";} ?>>Student</option>
						<option value="TA" <?php if($user["usergroup"] == "TA"){echo "selected";} ?>>TA</option>
					</select>
					
					<label>Disabled</label>
					<input type="checkbox" name="disabled" value="Yes">
					
					<div class="center">
						<input type="submit" value="Submit" name="submit" >			
					</div>
				</form>
		</div> <!-- end div_content -->
		
	</div> <!-- end div_main -->
	
	<div id="div_footer">  
		
	</div>

</div>
</body>
</html>


