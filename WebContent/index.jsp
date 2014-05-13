<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>NMI Comment</title>
<%
String nmi_number = "";
if(request.getParameter("NMI") != null) 
	nmi_number = request.getParameter("NMI");
%>
<script type="text/javascript">
 
    function onLoadFunction() {
    	window.resizeTo(520, 340);
        comment.focus();
	}
    
    function validateInput() {
    	if(document.getElementById("NMINumber").value == null || 
    			document.getElementById("NMINumber").value == ""){
   	     	document.getElementById("errorMsg").innerHTML="NMI number cannot be empty.";
	   	}else if(document.getElementById("comment").value == null ||
	   			document.getElementById("comment").value==""){
	   		document.getElementById("errorMsg").innerHTML="Comment cannot be empty.";
	   	}else{
	   		document.getElementById("addComment").submit();
	   	}
    }
</script>
<style type="text/css">
  html, body {
    height: 100%;
  }
  html {
    display: table;
    margin: auto;
  }
  body {
  	display: table-cell;
    vertical-align: middle;
    align:center;
    background-color: #f1f1f1; 
  }
  textarea {
     display: block;
     width: 400px;
     height: 100px;
     padding: 8px;
     border: 1px solid #cccccc;
     line-height: 130%;
     font-size: 13px;
  } 
  .button-s {
	height: 21px;
	width: 65px;
	background-color: #0080FF; 
	color : #FFFFFF;
	font-size: 13px;
  }
  .button-c {
	height: 21px;
	width: 65px;
	background-color: #848484; 
	color: #FFFFFF;
	font-size: 13px;
	text-align: center;
  }
  .comment-area{
    padding: 20px 24px 20px;
  	background-color: #ffffff; 
  	width: 400px; 
  	height: 140px; 
  	left: 0px; 
  	top: 0px;
  	display:table-cell;
  	vertical-align:middle;
  	font-weight: 400;
	overflow: hidden;
  	webkit-box-shadow: 0 1px 3px rgba(0,0,0,.13);
	box-shadow: 0 1px 3px rgba(0,0,0,.13);
	position: relative;
  }
  .number-label{
  	height: 19px;
	width: 65px;
	font-size: 13px;
  	font-weight: normal;
	font-style: inherit;
  }
  .text-font{
  	font: 1em/1.6em Verdana,sans-serif;
	font-family: Verdana, sans-serif;
	font-size: 1em;
	font-style: normal;
	font-variant: normal;
	font-weight: normal;
	line-height: 1.6em;
	color: #454545;
  }
  .error-font{
  	font: 0.8em/1.2em Verdana,sans-serif;
	font-family: Verdana, sans-serif;
	font-size: 0.7em;
	font-style: normal;
	font-variant: normal;
	font-weight: normal;
	line-height: 1.6em;
	color: #FF0000;
  }
</style>
</head>
<body onLoad="onLoadFunction();">
<div id="comment-area" class="comment-area" align="center">
<form id="addComment" action="SaveCommentServlet" method="POST">
<table>
<tr>
<td align="left" colspan="2">
<label id="nmi-text" class="text-font"><%=nmi_number%></label>
<input id="NMINumber" name="NMINumber" type="hidden" value="<%=nmi_number%>"/>
</td>
</tr>
<tr>
<td colspan="2"><textarea name="comment" id="comment" rows="3" cols="15" placeholder="Type Comments"></textarea></td>
</tr>
<tr height="30">
<td align="left">
<label id="errorMsg" class="error-font"></label>
</td>
<td align="right">
<button type="button" class="button-c" value="Cancel" onclick="self.close()">Cancel</button>
<input class="button-s" type="button" value="OK" onclick="validateInput();" />
</td>
</tr>
</table>
</form>
</div>
</body>
</html>