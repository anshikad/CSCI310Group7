<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% 
String topicName = (String) session.getAttribute("buildAnotherCollage");

%>
	<head>
		<link rel="stylesheet" href="SecondPageCSS.css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<script>
		function changeTopic() {
			var title = "Collage for topic ";
			newTopic = document.getElementById("topicBox").value.trim();
			if (newTopic == '') {
				// do nothing
			}
			else {
				// put old collage in previous collages
				
				// change the collage
				
				title += newTopic;
				document.getElementById("p1").textContent = title;
				document.getElementById("topicBox").value = '';
			}
		}
	</script>
	<body>
		<p id="p1">Collage for topic <%= topicName %></p>
	</body>
	
	<div id = "collage">
		<img src=>
	</div>
	<body class = buildCollegeAttributes>
		<div style="text-align:center">
			<form>
	  			<input type="text" id = "topicBox" name="buildAnotherCollage" placeholder = "Enter Topic" style = "border:3px solid grey" required>
	  			<input type = "button" value = "Build Another Collage" onclick = "changeTopic();" style = "background-color:grey; color: white " >
	  			<input type = "button" value = "Export Collage" style = "background-color:grey; color: white">	
			</form>
		</div>
	</body>
	</br>
	</br>
	<div class="scrollmenu">
	  <a href="#home">Home</a>
	  <a href="#news">News</a>
	  <a href="#contact">Contact</a>
	  <a href="#about">About</a>
	  <a href="#support">Support</a>
	  <a href="#blog">Blog</a>
	  <a href="#tools">Tools</a>  
	  <a href="#base">Base</a>
	  <a href="#custom">Custom</a>
	  <a href="#more">More</a>
	  <a href="#logo">Logo</a>
	  <a href="#friends">Friends</a>
	  <a href="#partners">Partners</a>
	  <a href="#people">People</a>
	  <a href="#work">Work</a>
	</div>
</html>