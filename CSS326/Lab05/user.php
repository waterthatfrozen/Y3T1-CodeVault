<?php
// Connect to the database
$mysqli = new mysqli("localhost", "root", null, "css326_week5");

if ($mysqli->connect_errno) {
  echo $mysqli->connect_error;
}

if (isset($_POST["submit"])){
    $title = $_POST['title']; 
    
    // Exercise 3
    // 1. Get first_name from $_POST
    $firstname = $_POST["firstname"];
    // 2. Get last_name from $_POST
    $lastname = $_POST["lastname"];
    // 3. Get email from $_POST
    $email = $_POST["email"];
    $usergroup = $_POST['usergroup'];
    if (isset($_POST['disabled'])){
        $is_disabled = 1;
    } else {
        $is_disabled = 0;
    }

    // 4. Add first_name, last_name, email to INSERT command
    $insert_sql = "INSERT INTO user(title,first_name,last_name,email,usergroup,disabled)
    VALUES ('$title','$firstname','$lastname','$email','$usergroup', '$is_disabled')";
  
    // 5. Uncommand the line below to excute insert
    $result = $mysqli->query($insert_sql);

    if (!$result){
        echo "Insert failed!<br/>";
        echo $mysqli->error;
    }
}
?>
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
		<div id="div_content" class="usergroup">
			<!--%%%%% Main block %%%%-->
			
			<h2>User Profile</h2>
			<table>
                <col width="15%">
                <col width="30%">
                <col width="30%">
                <col width="20%">
                <col width="5%">

                <tr>
                    <th>Title</th> 
                    <th>Name</th>
                    <th>Email</th>
                    <th>User Group</th>
                    <th>Disabled</th>
                    <th>Edit</th>
                    <th>Del</th>
                </tr>
                <?php
                
                // Exercise 2
                
                // 1. Change $query to get all fields
                $query = "SELECT * FROM user";

                $result = $mysqli->query($query);

                if ($result){
                  while($row=$result->fetch_array()){
                    echo "<tr>";
                    echo "<td>".$row["title"]."</td>";
                    echo "<td>".$row["first_name"]." ".$row["last_name"]."</td>"; //2. Change to get first_name with last_name
                    echo "<td>".$row["email"]."</td>"; //3. Change to get email
                    echo "<td>".$row["usergroup"]."</td>"; //4. Change to get user group
                    if ($row["disabled"]) {
                        echo '<td><input type="checkbox" id="d1" name="d1" checked disabled></td>';
                    } else {
                        echo '<td><input type="checkbox" id="d1" name="d1" disabled></td>';
                    }
                    echo '<td><img src="images/Modify.png" width="24" height="24"></td>';
                    echo '<td><img src="images/Delete.png" width="24" height="24"></td>';
                    echo "</tr>";
                  }
                } else {
                  echo "Error:" . $mysqli->error;
                }
                ?>  
            </table>
		</div> <!-- end div_content -->
		
	</div> <!-- end div_main -->
	
	<div id="div_footer">  
		
	</div>

</div>
</body>
</html>

