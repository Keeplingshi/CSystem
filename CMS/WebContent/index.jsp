<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎</title>
<script type="text/javascript">
	function GetQueryString(name)
	 {
		var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
		var r = window.location.search.substr(1).match(reg);
		if(r!=null)return  decodeURI(r[2]); return null;
	}
	window.onload=function(){
		var ip = GetQueryString("ip");
		var localIP = GetQueryString("localIP");
		var staffDomain = GetQueryString("staffDomain");
		document.getElementById("topFrame").src="top.jsp?ip="+ip+"&localIP="+localIP+"&staffDomain="+staffDomain;
		document.getElementById("rightFrame").src="index2.jsp?ip="+ip+"&localIP="+localIP+"&staffDomain="+staffDomain;
	}	;	
</script>
</head>
<frameset rows="88,*" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="top.jsp" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" title="topFrame" />
  <frameset cols="187,*" frameborder="no" border="0" framespacing="0">
    <frame src="left.jsp" name="leftFrame" scrolling="no" noresize="noresize" id="leftFrame" title="leftFrame" />
    <frame src="" name="rightFrame" id="rightFrame" title="rightFrame"  />
  </frameset>
</frameset>
<noframes><body>
</body></noframes>
</html>
 
