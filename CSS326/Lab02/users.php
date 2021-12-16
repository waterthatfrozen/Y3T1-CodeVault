<!-- 
	Paphana Yiwsiw 
	6222780379
	CSS326 Lab02		
-->

<!DOCTYPE HTML>
<html>
<?php error_reporting(~E_NOTICE); ?>

<head>
	<title>Users</title>
	<!-- link to the style sheet "default1.css"-->
	<link rel="stylesheet" href="default1.css">
	<!-- Add the given image "back.jpg" as illustrated (no repeat and cover the page) -->
	<style>
		body {
			background-image: url("back.jpg");
			background-repeat: no-repeat;
			background-size: cover;
		}
	</style>
</head>

<body>
	<!-- Add php content to restrict only the user with password to enter -->
	<!-- php file begin-->
	<?php
	//Assign the variables for username and password (user name: Admin and Password: 1234) 
	$username = "Admin";
	$pass = "1234";
	$pass1 = "1234";
	if($username == $_POST['username'] && $pass == $_POST['passwd']  && $pass1 == $_POST['cpasswd'])
		{
			$_SESSION["username"] = $username;
		}
	else
		{
			echo "<h1>", "You do not have access to this page!" ,"</h1>";
			//----print a text saying that you will have __ seconds to get the redirect button (30 times, using a for loop)---
			for($i=30;$i>=0;$i--){
				echo "You will be given the redirecting button after {$i} seconds <br/>";
			}
			?>
			<!-- really 30 seconds countdown
			<p id="timer-out"></p>
			<script>
				var seconds=30;
				var timer = setInterval(timerIntv,1000);
				function timerIntv(){
					current_text = document.getElementById("timer-out").innerHTML;
					seconds_text = "You will be given the redirecting button after "+seconds+" seconds.<br/>";
					seconds -= 1;
					document.getElementById("timer-out").innerHTML = current_text + seconds_text;
					if(seconds == -1){
						clearInterval(timer);
						backBT = "<br/><button type='button' onclick='window.location.href='add_user.html''>Back</button>";
						document.getElementById("timer-out").innerHTML += backBT;
					}
				}
			</script>
			-->
			<?
			//-- use the button to move to previous page---
			?><button type="button" onclick="history.back()">Back</button><?
			exit;
		} //-->
	//<!--php file end-->
	?>
	<!-- the heading is given as " Welcome Mr./Mrs./Ms. User Name", change the font to Arial, size of font to 200%, make the text appear in center-->
	<h1 style="font-family: Arial; font-size:200%; text-align:center;"> Welcome <?php echo $_POST["title"], " ", $_POST["firstname"], " ", $_POST["lastname"], "!!!"; ?><br/> </h1>
	<!-- add the image "avatar.png", height to 240 pixels-->
	<img src="avatar.png" alt="avatar" height="240">
	<!-- change the font to Arial,size of font to 170%-->
	<h3 style="font-family: Arial; font-size:170%;"> This is your profile </h3>

	<!-- change the font to Arial-->
	<p style="font-family: Arial;">
		<?php
		echo "Name:", " ", $_POST["title"], " ", $_POST["firstname"], " ", $_POST["lastname"], "<br/>";
		//--add "User Group: usergroup"-- 
		echo "User Group: ",$_POST["usergroup"],"<br/>";
		//-- add "Email address: Email"-- 
		echo "Email address: ",$_POST["email"],"<br/>";
		//-- Find the gender and output "Gender: gender"-- 
		if ($_POST["title"] === "Mr."){
			$gender = "Male";
		}else{
			$gender = "Female";
		}
		echo "Gender: ",$gender,"<br/>";
		//-- Find the age and output as "Age in years: age"--
		// $bday = $_POST["birth"]; // Your date of birth
		//-- set default time zone--
		date_default_timezone_set("Asia/Bangkok");
		$bday = explode("-",$_POST["DOB"]);
		$today = explode("-",date("Y-m-d"));
		$age_year = $today[0] - $bday[0];
		echo "Age in years: ",$age_year,"<br/>";
		//-- print the login type as " Login time (local): time on date"-- 
		echo "Login time (local): ",date("h:i:s A")," on ",date("Y/m/d"),"<br/>";
		?>
	</p>

	<!-- change font to Arial, bold and font size to 150%-->
	<p style="font: bold 150% Arial;"> Welcome to the CSS 326 system <br/></p>
	<p style="font-family: Arial">
		Whether you are an experienced programmer or not, this website is intended for everyone who wishes to learn
		Database programming.
		There is no need to download anything - just click on the chapter you wish to begin from, and follow the
		instructions. <br/> </p>

	<!-- Remeber how you formatted the links in previous lab-->
	<ul id="menu">
		<li><a href="https://www.learn-php.org/en/Hello%2C_World%21" target="_blank">Hello World!</a></li>
		<li><a href="https://www.learn-php.org/en/Variables_and_Types" target="_blank"> Variables</a></li>
		<li><a href="https://www.learn-php.org/en/For_loops" target="_blank"> For Loops</a></li>
		<li><a href="https://www.learn-php.org/en/Functions" target="_blank"> Functions</a></li>
		<li><a href="https://www.learn-php.org/en/While_loops" target="_blank"> While loops</a></li>
	</ul>

	<!-- Change to bold, font to Arial and text size to 120% and Center the text-->
	<p style="font-weight: bold; font-family: Arial; font-size: 120%; text-align: center;"> Good Luck!</p>
	<button onclick="history.go(-1);">Back</button>
</body>

</html>