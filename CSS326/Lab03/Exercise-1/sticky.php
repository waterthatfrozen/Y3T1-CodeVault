<!DOCTYPE html>
<html>
<head>
<title>Sticky Note</title>
<link rel="stylesheet" type="text/css" href="sticky.css">
</head>

<body>
	<form action="sticky.php" method="POST">
		<strong>Title</strong>: <input type="text" name="title" id="title" size="30" required> <br><br>
		<strong>Note</strong>: <textarea name="note" cols="30" rows="5" required></textarea> <br>
		<input type="submit" value="Post!" name="submit" >
	</form>
	<hr>
	<!-- Put Display Content here -->
	<?php
		//write the note after press submit
		//append the submitted text to the sticky_note.txt file
		//write the title as the second-to-last line in the file
		//write the note as the last line in the file
		if(isset($_POST["submit"])){
			$note_file = fopen("sticky_note.txt","a") or die("Unable to open the file!");
			$title = $_POST["title"]."\n";
			fwrite($note_file,$title);
			$note = str_replace(array("\n","\r")," ",$_POST["note"]);
			fwrite($note_file,$note."\n");
			fclose($note_file);
		}
		//The POST request has been made
		if(isset($_POST["submit"])){ 
		//read the file name sticky_note.txt
		$note_file = fopen("sticky_note.txt","r") or die("Unable to open the file!");
		//do the line count
		$line_count = 0;
		while(!feof($note_file)){
			$current_line = fgets($note_file)."<br/>";
			$line_count++;
		}
		$note_count = floor($line_count / 2);
		//close the file
		fclose($note_file);
	?>
	<div class="post">
		<div class="title">
		<?php
			//print the title line
			echo $_POST["title"];
		?>
		</div>
		<div class="note">
		<?php
			//print the note line
			echo $_POST["note"];
		?>
		</div>
		<div class="notefoot">
		<?php
			// count how many notes, output: "__ notes have been made"
			echo "{$note_count} notes have been made.";
		?>
		</div>
	</div>
	<? } ?>
</body>

</html>