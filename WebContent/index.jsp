<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>NMI Comment</title>
<script type="text/javascript">
 
    function onLoadFunction() {
    	window.resizeTo(520, 340);
        comment.focus();
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
</style>
</head>
<body onLoad="onLoadFunction();">
<div id="comment-area" class="comment-area" align="center">
<form action="SaveCommentServlet" method="POST">
<table>
<tr>
<td align="left"><label id="nmi-number" class="number-label">3434</label></td>
</tr>
<tr>
<td><textarea name="comment" id="comment" rows="3" cols="15" placeholder="Type Comments"></textarea></td>
</tr>
<tr height="30">
<td align="right">
<button type="button" class="button-c" value="Cancel" onclick="self.close()">Cancel</button>
<input class="button-s" id="submit" type="submit" value="OK" />
<!-- button type="button" class="button-s" value="Submit">OK</button> -->
</td>
</tr>
</table>
</form>
</div>
</body>
</html>