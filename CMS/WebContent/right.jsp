<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>æ æ é¢ææ¡£</title>
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
		  $(".click").click(function(){
		 	 $(".tip").fadeIn(200);
		  });
		  
		  $(".tiptop a").click(function(){
		 	 $(".tip").fadeOut(200);
		  });
		
		  $(".sure").click(function(){
		 	 $(".tip").fadeOut(100);
		  });
		
		  $(".cancel").click(function(){
		 	 $(".tip").fadeOut(100);
		  });
		});
	</script>
</head>
<body>
	<div class="place">
	    <span>ä½ç½®ï¼</span>
	    <ul class="placeul">
		    <li><a href="#">é¦é¡µ</a></li>
		    <li><a href="#">åäºåè¯·æ³å¾æä¹¦</a></li>
	    </ul>
    </div>
    <div class="rightinfo">
	    <div class="tools">
	    	 <form id="myform" action="AddlegalInstrument.do" method="post">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mytable">
                     	<tr>
                            <td width="22%" align="right">å¯¹åºåäºæ¡ä»¶ç»è®°è¡¨ï¼</td>
                            <td><input type="text" name="case_registerID" id="case_registerID" class="input required" value="111111111111111111"/>
                                <p>åäºæ¡ä»¶ç»è®°è¡¨çid</p></td>
                        </tr>
                        <tr>
                            <td width="22%" align="right">åå®¹ï¼</td>
                            <td><input type="text" name="content" id="content" class="input required" value="11111"/>
                                <p>èªå·±çåè¯·åå®¹ï¼æè§ï¼åå ç­</p></td>
                        </tr>
                       <tr>
                            <td align="right">è´è´£äººï¼</td>
                            <td><input type="text" name="staffName" id="staffName" class="input required" value="1111-11-11"/>
                                <p>è´è´£äººå§å</p></td>
                        </tr>
                        <tr>
                            <td height="42">&nbsp;</td>
                            <td><input type="submit" class="btn" value="æ äº¤" /> &nbsp; <input type="reset" class="btn" value="é ç½®" /></td>
                        </tr>
                    </table>
                </form>
	    </div>
    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>

</body>

</html>
