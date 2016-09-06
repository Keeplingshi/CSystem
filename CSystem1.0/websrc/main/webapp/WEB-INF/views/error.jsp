<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>404</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/error.css" />

<style>
body {
    background: url("${pageContext.request.contextPath}/resources/images/error/error_bg.jpg") repeat-x scroll 0 0 #67ACE4;
}
</style>

</head>
<body>


<div id="container">
	<img class="png" src="${pageContext.request.contextPath}/resources/images/error/404.png" />
	<img class="png msg" src="${pageContext.request.contextPath}/resources/images/error/404_msg.png" />
	<p><a href="${pageContext.request.contextPath}/main" target="_blank"><img class="png" src="${pageContext.request.contextPath}/resources/images/error/404_to_index.png" /></a> </p>
</div>

<div id="cloud" class="png"></div>

</body>
</html>