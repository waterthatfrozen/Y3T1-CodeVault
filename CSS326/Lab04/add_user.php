<!DOCTYPE html>
<html>
<head>
<title>CSS326 Sample</title>
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
			
			<form action="user.php" method="post">
					<h2>User Profile</h2>
					<!-- use a drop down list to select 'title' from Mr./Mrs./Ms. : label it too-->
					<label>Title</label>
					<select name="title">
						<option value="Mr.">Mr.</option>
						<option value="Mrs.">Mrs.</option>
						<option value="Ms.">Ms.</option>
					</select>

					<label>First name</label>
					<input type="text" name="firstname">
						
					<label>Last name</label>
					<input type="text" name="lastname">

					<!-- use a radio button to select 'gender' from Male and Female. : label it too-->
					<div>
					<label>Gender</label>
					<input type="radio" name="gender" value="male" checked>Male
					<input type="radio" name="gender" value="female">Female
					</div>

					<label>Email</label>
					<input type="email" name="email">
					
					<h2> Account Profile</h2>
					<label>Username</label>
					<input type="text" name="username">
					
					<label>Password</label>
					<input type="password" name="passwd">
					
					<label>Confirmed password</label>
					<input type="password" name="cpasswd">
					
					<!-- select the 'usergroup' from Instructor, students and TA. : label it too-->
					<label>User Group</label>
					<select name="usergroup">
						<option value="Instructor">Instructor</option>
						<option value="Student">Student</option>
						<option value="TA">TA</option>
					</select>
					
					<!-- use a checkbox to get the input 'Yes' for 'Disabled' field  : label it too-->
					<label>Disabled</label>
					<input type="checkbox" name="disabled" value="Yes">

					<!-- center the submit button-->
					<div style="text-align: center;">
						<input type="submit" name="submit" value="Submit">			
					</div>
				</form>
		</div> <!-- end div_content -->
		
	</div> <!-- end div_main -->
	
	<div id="div_footer">  
		
	</div>

</div>
</body>
</html>


