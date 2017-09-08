<?php
 ob_start();
 session_start();
 require_once 'dbconnect.php';
 
 // if session is not set this will redirect to login page
 if( !isset($_SESSION['user']) ) {
  header("Location: index.php");
  exit;
 }
 // select logged-in users detail
 $res=mysqli_query($conn, "SELECT * FROM users WHERE userId=".$_SESSION['user']);
 $userRow=mysqli_fetch_array($res, MYSQLI_ASSOC);






?>
<!DOCTYPE html>
<html>
<head>



<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Welcome - <?php echo $userRow['userEmail']; ?></title>
<style type="text/css">
	body{
		background-color: #FFFFFF;
	}
</style>



</head>
<body>






	<div style="float: right">
            <?php echo $userRow['userName']; ?>

            
			
			

             
            <a style="margin-left: 50px;" href="logout.php?logout">Sign Out</a>
   </div>






<div class="container-fluid">

<?php

$book_id= $_GET["id"];
echo "<h1>".$book_id."</h1>";


	$res=mysqli_query($conn, "SELECT * FROM books WHERE bookId=" . $book_id);
 $userRow=mysqli_fetch_array($res, MYSQLI_ASSOC);




 echo "<div class='row'>" . "<div class='col-lg-2'>" . "Book Cover: "."</div>" ."<div class='col-lg-9'>" . "<img style='width:200px; height:200px' src='" . $userRow['bookImage']. "'>" ."</div>" . "</div>"."<br>".


 "<div class='row'>" . "<div class='col-lg-2'>" . "Book Title: " . "</div>"."<div class='col-lg-9'>" . $userRow['bookTitle']  . "</div>" . "</div>" ."<br>".


  "<div class='row'>" . "<div class='col-lg-2'>" . "Author: "."</div>" ."<div class='col-lg-9'>". $userRow['bookAuthor'] ."</div>"."</div>"."<br>".


  "<div class='row'>" . "<div class='col-lg-2'>" . "ISBN: "."</div>" . "<div class='col-lg-9'>".$userRow['bookISBN'] . "</div>". "</div>" ."<br>".


  "<div class='row'>" . "<div class='col-lg-2'>" . "Description: "."</div>" ."<div class='col-lg-9'>". $userRow['bookShortDescription'] . "</div>"."</div>"."<br>".


 "<div class='row'>" . "<div class='col-lg-2'>" . "Available or Reserved: " . "</div>"."<div class='col-lg-9'>". $userRow['bookStatus']."</div>"."</div>"."<br>" ;

 


 ?> 

 </div>
            
   
</body>
</html>
<?php ob_end_flush(); ?>