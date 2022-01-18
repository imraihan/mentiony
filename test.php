<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Page Description">
    <meta name="author" content="nguyenluat">
    <title>Page Title</title>
    <link rel="stylesheet" href="css/jquery.mentiony.css">
    <link rel="stylesheet" href="css/jquery.jscrollpane.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.mousewheel.js"></script>
    <script type="text/javascript" src="js/jquery.mentiony.js"></script>
    <script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>

</head>
<body>

<?php
//insert into db

$result = mysqli_connect("localhost","root","", "babynames");

if($result === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}

$sql = "INSERT INTO `listnames` (`mention`) VALUES ('$_POST[mention]')";
if(mysqli_query($result, $sql)){
    echo "Records inserted successfully.";
} else{
    echo "ERROR: Could not able to execute $sql. " . mysqli_error($result);
}
?>

//fetch result from db
<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "babynames";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT id, mention FROM listnames";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo "id: " . $row["id"]. " - Text: " . $row["mention"]."<br>";
    }
} else {
    echo "0 results";
}
$conn->close();
?>






<script type="text/javascript">


    var stringCheck = '<span class="mention-area"><span class="highlight"><a href="http://rankmylist.com/pk/4321" class="mentiony-link"><span class="triggertype">@</span>james<button type="button" class="xMen"></button></a></span></span><span class="normal-text"></span>';

    function removeHtml() {
        var profilekey = stringCheck.split('<span class="mention-area"><span class="highlight"><a href="http://rankmylist.com/pk/')[1].split('" class="mentiony-link"><span class="triggertype">')[0];
//        console.log(profilekey);
        var username = stringCheck.split('class="mentiony-link"><span class="triggertype">@</span>')[1].split('<button type="button" class="xMen"></button></a></span></span><span class="normal-text"></span>')[0];
//        console.log(username);
        console.log('@pk:'+profilekey+':'+username);
   }            
  removeHtml();







</script>
</body>


