<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
  textarea {
     display: block;
     width: 400px;
     height: 120px;
     padding: 8px;
     border: 1px solid #cccccc;
     line-height: 130%;
     font-size: 13px;
  } 
</style>
</head>
<body>

<div id="comment-area">
<div id="UMINumber">
<label>3434</label>
</div>
<div id="comment">
<label class="prompt" for="content" id="content-prompt-text">Type Comments</label>
<textarea name="comment" id="comment" class="mceEditor" rows="3" cols="15" style="overflow-x: hidden; height: 33px; overflow-y: auto;"></textarea>
</div>
<p class="submit">
<input type="submit" name="save" id="save-post" class="button button-primary" value="OK">
</p>

</div>

</body>
</html>