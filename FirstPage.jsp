<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel="stylesheet" href="FirstPageCSS.css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>GRAMA: Initial Page</title>
	</head>
	<body style = "background-color: #D3D3D3">
		<div class = "form" style = "background-color: #D3D3D3">
			<form name = "Form1" action="/ManageButtonPress.jsp" method="GET">
	  			<input type="text" name="buildCollage" placeholder = "Enter topic" style = "font-size: 24px; border:3px solid grey" required>
	  			<input type = "submit" value = "Build Collage" style = "font-size: 24px; padding: 4px 2px; border: none;  background-color:grey; color: white">
			</form>
		</div>
	</body>
</html>