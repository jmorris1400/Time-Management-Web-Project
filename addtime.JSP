<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>
		
	</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css">
	
	<h2><div class="header">
	
		<u>Disaster Recovery Application : Timecard Submission</u>
</h2>
<style type="text/css">
	*{
		margin:0;
		padding:0;
	}
	.header{

		float:left;
	}
</style>
<body bgcolor = "lightgray" text="darkblue">
	
<!--&emsp; -->
<div class="header45">
		<h3>Example name</h3>
		<br>
	</div> 


	<style type="text/css">
	.header45{
		float:right;
		padding-bottom: 15px;
		padding-right: 30px;
	}

</style>

	<div class="wholepage">
<div style="margin-top:100px;"></div>
<style type="text/css">
	.header1{
		float:right;
		padding-bottom: 15px;
		padding-right: 30px;
	}
</style>

	<div class="header"> <!-- for the css -->
		<h3 id="Job">
			<a href="http://localhost:8080/user/1.html"target="_blank">
				<p><strong>Timecard Submission</strong></p>
				</a></h3>



<style type="text/css">
	.clr{
		clear:both;
	}

	.header2{
		float:left;
	}
</style>

	</div> 
	<h1 class="header3">&emsp;&emsp;Timecard Submission</h1>

	<style type="text/css">
	.header3{
		float:left;
	}
</style>
<div style="margin-top:150px;"></div>
</head>
<body> 

<br><br><br>

<label><div class="word1">
	Site Code:</label>
    <input type="text"name="site"> </div>

<style type="text/css">
	.word1{
		float:left;
	
		padding-left:5px;
	}
</style>
<label><div class="word1">
	Contractor Name:</label>
    <input type="text"name="site"> </div>

<label><div class="word1">
	Date:</label>
    <input type="text"name="site"> </div>
<!-- the labor entry -->


<!-- the labor entry -->



<div style="margin-top:100px;"></div>
<div style="margin-bottom:100px;"></div>
<!------------------>

<div class="word1">
<h2>
	<p> Labor Entry </p>
</h2>
<!------------------>
<label>Labor Code: </label>
<select name="labor"><br>
          <option value="code">text</option>    
    <input type="text"name="lastName"> <br><br>
      
<!------------------>
 <label>Labor Code: </label>
<select name="labor"><br>
          <option value="code">text</option>    
    <input type="text"name="lastName"> <br><br>
      
<!------------------>
<label>Labor Code: </label>
<select name="labor"><br>
          <option value="code">text</option>    
    <input type="text"name="lastName"> <br><br>
   
<!------------------>
  </div><div class="word1">
<!------------------>
<label><div class="hrs"><br>
	Hrs.worked:</label>
    <input type="text"name="work"> </div>
    <label><div class="hrs"><br>
	Hrs.worked:</label>
    <input type="text"name="work"> </div>
<label><div class="hrs">	<br>
	Hrs.worked:</label>
    <input type="text"name="work"> </div>
	<br>
	  </div>
<!------------------><div class="total">
<label>	<br>
	Total:</label>
    <input type="text"name="work"> </div>
<label><div class="total">	<br>
	Total:</label>

    <input type="text"name="work"> </div>
<label><div class="total">
	<br>
	Total:</label>
    <input type="text"name="work"> 

  <h4>Add more</h4></div>

  <br>

 <div class="up">
<input type="submit" name="submit"value="clear2">
 <input type="submit" name=""value="submit2">
 <a href="edit.html?id=${job.jobId}">more</a>
<a href="delete.html?id=${job.jobId}">submit</a>
</div>
</div>
<div style="margin-top:20px;">


<style type="text/css">
	.up{
		float:left;
		padding-left: 570px;
		padding-right: 200px;

	}
</style>
<br>
<br>
<!-- machine entry --><div class="over">
<h2>
	<p> Machine Entry </p>
</h2>
<style type="text/css">
	.word12{
		float:left;
		padding-top: 20px;
	
	
	}
</style> 
<!------------------>
<div class="word12">
<label>Machine Code: </label>
<select name="labor"><br>
          <option value="code">text</option>    
    <input type="text"name="lastName"> <br><br>
      
<!------------------>
 <label>Machine Code: </label>
<select name="labor"><br>
          <option value="code">text</option>    
    <input type="text"name="lastName"> <br><br>
      
<!------------------>
<label>Machine Code: </label>
<select name="labor"><br>
          <option value="code">text</option>    
    <input type="text"name="lastName">
    </div>
<!------------------>
<div class="smoke">
<label><div class="hrs"><br>
	Hrs.used:</label>
    <input type="text"name="work"> </div>
    <label><div class="hrs"><br>
	Hrs.used:</label>
    <input type="text"name="work"> </div>
<label><div class="hrs">	<br>
	Hrs.used:</label>
    <input type="text"name="work"> </div>

</div>
<style type="text/css">
	.smoke{
		padding-bottom: 100px;
		float: left;
	}
</style>
<!------------------>
<label>	<br>
	Total:</label>
    <input type="text"name="work"> 
<label><div class="total">	<br>
	Total:</label>

    <input type="text"name="work"> 
<label><div class="total">
	<br>
	Total:</label>
    <input type="text"name="work"> 

  <h4>Add more</h4>



<div style="margin-top:20px;">


 <input type="submit" name="submit"value="clear2">
 <input type="submit" name=""value="submit2">
 <a href="edit.html?id=${job.jobId}">more</a>
<a href="delete.html?id=${job.jobId}">submit</a>
</div><!--div for whole page--></body>
<style type="text/css">
	.wholepage{
		padding-left: 200px;
	}
	.over{
		padding-left: 200px;
	}
</style>
</html>