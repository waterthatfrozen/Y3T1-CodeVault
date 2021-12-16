<!DOCTYPE html>
<html>
<head>
<title>Triangle Square</title>
<link rel="stylesheet" type="text/css" href="tri_sq.css">
</head>

<body>
	<form action="tri_sq.php" method="GET">
		<strong>Parameter</strong>: <input type="number" name="param" id="param" size="30" > <br><br>
		<input type="submit" value="submit" name="submit" >
	</form>
	<hr>
	<!-- Put Display Content here -->
	<div class="post">
        <?php
            if(isset($_GET["submit"])){
                $size = $_GET["param"];
                for($i=1;$i<=$size;$i++){
                    for($j=1;$j<=$i;$j++){
                        echo "<img src=\"tri_sq.png\" width=\"20\" height=\"20\">&ensp;";
                    }
                    echo "<br/>";
                }
                for($i=$size;$i>0;$i--){
                    for($j=1;$j<$i;$j++){
                        echo "<img src=\"tri_sq.png\" width=\"20\" height=\"20\">&ensp;";
                    }
                    echo "<br/>";
                }
            }
        ?>
	</div>
</body>

</html>