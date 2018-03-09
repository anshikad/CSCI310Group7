<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>

<%@page import ="java.awt.image.BufferedImage" %>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.*"%>
<!DOCTYPE html>
<html>
<% 
String topicName = (String) session.getAttribute("topic");
String error = (String) session.getAttribute("errorMessage");
BufferedImage collage = (BufferedImage)session.getAttribute("currentCollage");
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
     
		function move(i){
			var previousCollageImg = document.getElementById(i);
			var temp = previousCollageImg.src;
			previousCollageImg.src = "data:image/jpg;base64," + "<%=b64%>";
			var c = document.getElementById("exportCollage");
			c.src = temp;
			var newTopic = "<%=topicName%>";
			
			
		}
	</script>
	<body>
		<p id="p1">Collage for topic <%= topicName %></p>
		<div id = "collageImage">
			<%
				if(error != null){
					%>
						<center><%=error%></center>
					<%
				}
				else{
					%>
					<center><img src="data:image/jpg;base64, <%=b64%>" align = "center" id = "exportCollage" width="500" height="250" style="margin: 0px 20px"/></center>
				<%
				}
			%>
		</div>
	</body>
	
	<div id = "collage">
		<img src=>
	</div>
	<body class = buildCollegeAttributes>
		<div style="text-align:center">
			<form action="driver" method="GET">
	  			<input type="text" id = "topicBox" name="buildCollage" placeholder = "Enter topic" style = "border:3px solid grey" required>
	  			<input type = "submit" id = "buildCollageBtn" value = "Build Another Collage" style = "background-color:grey; color: white " >
	  			<input type = "button" id = "exportCollageButton" value = "Export Collage" style = "background-color:grey; color: white" >	
			</form>
		</div>
	</body>
 	<div id = "gallery" class="scrollmenu">
	<%
		for(int i = 0; i < previousCollagesB64.size(); i++){
		%>
		  <img id = "<%=i%>" src="data:image/jpg;base64, <%=previousCollagesB64.get(i)%>" onclick="move(<%=i%>);" width="100" height="100" style="margin: 0px 20px"/>
		  
		<%	
		}
	%>
	</div>
</html>
