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
                <?php if(isset($_POST["submit"])){?>
                 <tr>
                    <td><?php echo $_POST["title"];?></td> 
                    <td><?php echo $_POST["firstname"]." ".$_POST["lastname"];?></td>
                    <td><?php echo $_POST["email"];?></td>
                    <td><?php echo $_POST["usergroup"];?></td>
                    <td><input type="checkbox" name="disabled"
                    <?php if(isset($_POST["disabled"])){echo "checked";}?>></td>
                    <td><img src="images/Modify.png" width="24" height="24" alt="edit icon"></td>
                    <td><img src="images/Delete.png" width="24" height="24" alt="delete icon"></td>
                </tr>
                <? }else{ ?>
                    <tr style="text-align: center; background-color:darksalmon;">
                        <td colspan="7">No user data submitted!</td>
                    </tr>
                <? } ?> 
            </table>
		</div> <!-- end div_content -->
		
	</div> <!-- end div_main -->
	
	<div id="div_footer">  
		
	</div>

</div>
</body>
</html>

