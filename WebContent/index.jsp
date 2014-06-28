<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="org.apache.log4j.Logger" %>
    <%@ page import="com.vrsailor.triatinit.NMIComment" %>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="defaultstyle.css">
<title>Writeback</title>
<% 
String nmi_number = "";
if(request.getParameter("key") != null)  {
	nmi_number = request.getParameter("key");
}

Connection conn = (Connection) getServletContext().getAttribute("DBConnection");
List<NMIComment> commentList = new ArrayList<NMIComment>();

try {
	String query="select * from NMIComment where Column0001 = '" + nmi_number + "' order by Column0003 desc";
	Statement stmt=conn.createStatement();
	ResultSet rs=stmt.executeQuery(query);
	
	while(rs.next()){
		NMIComment comment = new NMIComment();
		comment.setId(rs.getString("id"));
		comment.setKey(rs.getString("Column0001"));
		comment.setComment(rs.getString("Column0002"));
		comment.setCommentTime(rs.getTimestamp("Column0003"));
		commentList.add(comment);
	}
	rs.close();
	stmt.close();
} catch (SQLException e) {
	e.printStackTrace();
}

%>
<script type="text/javascript">
 
    function onLoadFunction() {
    	window.resizeTo(950, 700);
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
</head>
<body onLoad="onLoadFunction();">
<div id="comment-area" class="comment-area" align="center">
<label id="nmi-text" class="text-font">Key: <%=nmi_number%></label>
<br>
<br>
<form id="addComment" action="SaveComment" method="POST">
<div  class="listTalbeContainer">
<table class="listTableHead">
	<tr>
		<td width = "110px" align="center">Key Value</td>
		<td align="center">Comment</td>
		<td width = "150" align="center">Comment Time</td>
	</tr>
</table>
<div  class="listTable">
<table>
<% for(NMIComment comment : commentList){ %>
	<tr>
		<td width = "100px" align="center"><%=comment.getKey()%></td>
		<td align="left"><%=comment.getComment()%></td>
		<td width = "150px" align="left"><%=comment.getCommentTime().toString().substring(0, 19)%></td>
	</tr>
<%} %>

</table>
</div>
</div> 
<br>
<table>
	<tr>
		<td align="left" colspan="2">
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