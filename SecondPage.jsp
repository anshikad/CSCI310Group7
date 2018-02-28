<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>

<%@page import ="java.awt.image.BufferedImage" %>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% 
String topicName = (String) session.getAttribute("topic");
BufferedImage collage = (BufferedImage)session.getAttribute("currentCollage");
//BufferedImage collage = ImageIO.read(new File("/Users/anshikadubey/Desktop/310Test.jpg"));
ByteArrayOutputStream baos = new ByteArrayOutputStream();
ImageIO.write(collage, "jpg", baos);
baos.flush();
byte[] imageInByteArray = baos.toByteArray();
baos.close();
String b64 = javax.xml.bind.DatatypeConverter.printBase64Binary(imageInByteArray);
List<BufferedImage> previousCollages = (List<BufferedImage>)session.getAttribute("previousCollages");
List<String> previousCollagesB64 = new ArrayList<String>();
for(BufferedImage image : previousCollages){
	ByteArrayOutputStream baos2 = new ByteArrayOutputStream();
	ImageIO.write(image, "jpg", baos2);
	baos.flush();
	byte[] imageInByteArray2 = baos2.toByteArray();
	baos2.close();
	String prevB64 = javax.xml.bind.DatatypeConverter.printBase64Binary(imageInByteArray2);
	previousCollagesB64.add(prevB64);
}
%>
	<head>
		<link rel="stylesheet" href="SecondPageCSS.css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<script type="text/javascript">
     	window.onload = function () {
        var img = document.getElementById('exportCollage');
        var button = document.getElementById('exportCollageButton');
        var value = "<%=b64%>";
        img.src = "data:image/jpg;base64," + value;
        button.onclick = function () {
          window.location.href = img.src.replace('image/jpg', 'image/octet-stream');
         };
     };
	</script>
	<script>
		function move(){
			
		}
	</script>
	<body>
		<p id="p1">Collage for topic <%= topicName %></p>
		<div id = "collageImage">
			<center><img src="data:image/jpg;base64, <%=b64%>" id = "exportCollage" width="500" height="250" style="margin: 0px 20px"/></center>
		</div>
	</body>
	
	<div id = "collage">
		<img src=>
	</div>
	<body class = buildCollegeAttributes>
		<div style="text-align:center">
			<form action="driver" method="GET">
	  			<input type="text" id = "topicBox" name="buildCollage" placeholder = "Enter Topic" style = "border:3px solid grey" required>
	  			<input type = "submit" value = "Build Another Collage" style = "background-color:grey; color: white " >
	  			<input type = "button" id = "exportCollageButton" value = "Export Collage" style = "background-color:grey; color: white" >	
			</form>
		</div>
	</body>
 	<div class="scrollmenu">
	<%
		for(String previousb64: previousCollagesB64){
		%>
		  <img src="data:image/jpg;base64, <%=previousb64%>" onclick="move();" width="100" height="100" style="margin: 0px 20px"/>
		<%	
		}
	%>
	</div>
</html>
