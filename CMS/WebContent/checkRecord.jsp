<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>无标题文档</title>
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/jquery.js"></script>
     <script type="text/javascript" src="js/validate-ex.js"></script>
      <script type="text/javascript" src="js/upload.js"></script>
          <script type="text/javascript">
  	window.onload=function(){
		$.ajax({
            url:"queryCRID_Name.do",
            // 数据发送方式
            type:"get",
            // 接受数据格式
            dataType:"json",
            // 要传递的数据
            success: succFunction //成功执行方法 
    	});/*data:param,  */
	};
    	function succFunction(result){
        	var resultList = eval(result);
        		
        	$.each(resultList, function (index, item) {
        		 var ID = resultList[index].id;

        		 //添加到id选择框
        		 var idSelect = document.getElementById("idSelect");
        		 var idOption = document.createElement("OPTION"); 
        		 idOption.value = ID;
        		 idOption.text = ID;
        		 idSelect.options.add(idOption); 
           });
      };
      </script>
</head>
<body>
    <div class="place">
		    <span>位置：</span>
		    <ul class="placeul">
		    	<li><a href="#">搜查笔录填写</a></li>
		    </ul>
	    </div>
 <div class="head">	
        </div>
        <div id="container">
          <div class="demo">
                <form id="myform" action="AddCheckRecord.do" method="get">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mytable">
                     <tr>
                            <td width="22%" align="right">案件登记表表id：</td>
                            <td><select id="idSelect" name="idSelect"></select>
                            <font size="2px" color="#C0C0C0">请选择对应的刑事案件登记表</font>
                            </td>
                        </tr>
                        <tr>
                            <td width="22%" align="right">内容：</td>
                            <td><textarea style="height: 150px;width: 490px;" type="text" name="content" id="content" class="input required"  onkeydown="checkMaxInput(this,1000)"  
            onkeyup="checkMaxInput(this,1000)" onfocus="checkMaxInput(this,1000)" onblur="checkMaxInput(this,1000);resetMaxmsg()"></textarea>
                              <br /> <font size="2px" color="#C0C0C0" >填写检查笔录内容</font>
                            </td>
                        </tr>
                        <tr>
                            <td height="42">&nbsp;</td>
                            <td><input type="submit" class="btn" value="提 交" /> &nbsp;</td>
                        </tr>
                    </table>
                </form>

            </div>
    </div>
<script type="text/javascript">
function checkMaxInput(obj, maxLen) {  
    if (obj == null || obj == undefined || obj == "") {  
        return;  
    }  
    if (maxLen == null || maxLen == undefined || maxLen == "") {  
        maxLen = 1000;  
    }  

    var strResult;  
    var $obj = $(obj);  
    var newid = $obj.attr("id") + 'msg';  

    if (obj.value.length > maxLen) { //如果输入的字数超过了限制  
        obj.value = obj.value.substring(0, maxLen); //就去掉多余的字  
        strResult = '<span id="' + newid + '" class=\'Max_msg\' ><br/>剩(' + (maxLen - obj.value.length) + ')字</span>'; //计算并显示剩余字数  
    }  
    else {  
        strResult = '<span id="' + newid + '" class=\'Max_msg\' ><br/>剩(' + (maxLen - obj.value.length) + ')字</span>'; //计算并显示剩余字数  
    }  

    var $msg = $("#" + newid);  
    if ($msg.length == 0) {  
        $obj.after(strResult);  
    }  
    else {  
        $msg.html(strResult);  
    }  
}  

//清空剩除字数提醒信息  
function resetMaxmsg() {  
    $("span.Max_msg").remove();  
}  

</script>
</body>

</html>
