<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="FirstPageCSS.css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>GRAMA: Initial Page</title>
	</head>
	<body style = "background-color: #D3D3D3">
		<div class = "form" style = "background-color: #D3D3D3">
			<form name = "Form1" action="driver" method="GET">
	  			<input type="text" id = "inputBox" name="buildCollage" placeholder = "Enter topic" style = "font-size: 18px; background-color:white; border:3px solid grey" required>
	  			<input type = "submit" id = "buildCollageButton" value = "Build Collage" style = "font-size: 18px; padding: 4px 2px; border: none;  background-color:grey; color: white">
			</form>
		</div>
	</body>
</html>
