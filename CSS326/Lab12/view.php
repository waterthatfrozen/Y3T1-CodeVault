<!-- Exercise 1d -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account View</title>
    <style type="text/css">
        body{
            font-family: sans-serif;
            padding: 5rem;
        }
        input{
            margin-bottom: 10px;
        }
        label{
            margin-bottom: 5px;
            display: block;
        }
        table,th,tr,td{
            border: 1px black solid;
            border-collapse: collapse;
            padding: 0.5rem;
            margin: 1rem;
        }
    </style>
</head>
<body>
    <?php
        $username = $_POST["username"];
        $password = $_POST["password"];
        $mysqli = new mysqli("localhost",$username,$password,"bank");
        if($mysqli -> connect_errno){
            echo "<br/>Login Failed!<br/>";
            echo "<a href='index.html'>Go back</a>";
            exit(1);
        }
    ?>
    <h1>View account</h1>
    <a href='index.html'>Go back</a>
    <br/>
    <div>
        <table id="account" style="width: 50%;">
            <thead>
                <th>Account Number</th>
                <th>Name</th>
                <th>Balance</th>
            </thead>
            <tbody>
            <?php
                $query = "SELECT * FROM view_namebal;";
                $result = $mysqli -> query($query);
                while($row = $result -> fetch_array()){
            ?>
                <tr>
                    <td><?php echo $row["No."];?></td>
                    <td><?php echo $row["Name"];?></td>
                    <td><?php echo $row["bal"];?></td>
                </tr>
            <?php } ?>
            </tbody>
        </table>
    </div>
    <?php $mysqli->close(); ?>
</body>
</html>