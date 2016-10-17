 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!doctype html>
 <html lang="zh-CN">
 <head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
   <link rel="stylesheet" href="css/common.css">
   <link rel="stylesheet" href="css/main.css">
   <script type="text/javascript" src="js/jquery.js"></script>
 	<script type="text/javascript" src="js/jquery.validate.min.js" ></script>
      <script type="text/javascript" src="js/xingshi.js"></script>
   <title>Document</title>
   <script language="javascript">
   	function custom_close(){
	   if(confirm("您确定要关闭本页吗？")){
		   window.opener=null;
		   window.open('','_self');
		   window.close();
	   }
   	}
   </script>
 </head>
 <body>
  <div class="container">

     <div id="button" class="mt10">
       <input type="button" name="button" class="btn btn82 btn_export" value="导出">
     </div>
     
       <div class="box_bottom pb5 pt5 pr10" style="border-top:1px solid #dadada;">
              <div class="search_bar_btn" style="text-align:right;">
               
                 <input type="button" value="返回" onclick="custom_close()" class="ext_btn">
              </div>
            </div>
     <div id="forms" class="mt10">
        <div class="box">
          <div class="box_border">
            <div class="box_top"><b class="pl15">刑事案件登记表修改</b></div>
           <form id="myform" action="geteditCR.do" method="get" > 
               <table class="form_table pt15 pb15" width="100%" >
                 <tr>
                 <td class="td_right" width="20%">案件编号：</td>
                  <td id="id" width="10%">
                  	<input type="text" name="CRid" class="input-text lh30" id="CRid"  value="${id}" readonly="readonly"/>
                  </td>
                  
                  <td class="td_right"width="20%">身份证号：</td>
                  <td  width="10%">
                  	<input type="text" name="IDCard" id="IDCard" class="input-text lh30"  value="${idcard}" onchange="javascript:scCard()" />
                  </td>
                  
                  <td class="td_right"width="20%">报案人姓名：</td>
                  <td id="name"width="20%">
                	  <input type="text" name="user" id="user" class="input-text lh30" value="${name}" />
                  </td>
                </tr>
                <tr >
                
                  <td class="td_right">嫌疑人出生日期：</td>
                  <td ><input type="text" name="birthday" id="birthday" class="input-text lh30"  value="${birthday}" /></td>
                  
                  <td class="td_right">犯案时间：</td>
                  <td><input type="text" name="day" id = "day" class="input-text lh30 input required" value="${day}"  /></td>
                  
                  <td class="td_right">犯案地点：</td>
                  <td ><input type="text" name="workPalce" id = "workPalce" class="input-text lh30 input required" value="${workPlace}" /></td>
                  
                 </tr>
                 <tr>
                  <td class="td_right">嫌疑人出生地点：</td>
                  <td ><input type="text" name="birthPalce" id = "birthPalce"  class="input-text lh30 input required" value="${birthPalce}"/></td>
                  
                   <td class="td_right">嫌疑人学历：</td>
                  <td >${degree_education}
                  				<select name="degree_education" class="input-text lh30 required">
                                    <option value="">请选择</option>
                                    <option value="1">博士</option>
                                    <option value="2">硕士</option>
                                    <option value="3">本科</option>
                                    <option value="4">其他</option>
                                </select></td>
                  
                   <td class="td_right">民族：</td>
                  <td><input type="text" name="nation" id = "nation" class="input-text lh30 input required" value="${nation}"/></td>
                 </tr>
                 <tr>
                   <td class="td_right">嫌疑人性别：</td>
                  <td class="input-text lh30 input required" >
                  	${sex}<input type="radio" name="sex" value="1" checked="checked"/> 男 <input type="radio" name="sex" value="0" /> 女
                  </td>
                  
                   <td class="td_right">政治面貌：</td>
                  <td >
                  	<input type="text" name="politics_status" class="input-text lh30 input required" value="${politics_status}"/>
                  </td>
                  
                   <td class="td_right">是否是惯犯：</td>
                  <td class="input-text lh30 input required">
                 	 ${is_CriminalRecord}
                          		<input type="radio" name="is_CriminalRecord" value="惯犯"  />惯犯
								<input type="radio" name="is_CriminalRecord" value="初犯" checked="checked"/>初犯
                  </td>
                 </tr>
                 <tr>
                    <td class="td_right">涉嫌罪名：</td>
                  <td >
                  	<input type="text" name="charge" class="input-text lh30  input required" value="${charge}"/>
                  </td>
                  
                   <td class="td_right">主犯：</td>
                  <td ><input type="text" name="charge_main" class="input-text lh30 input required" value="${charge_main}"/></td>
                  
                   <td class="td_right">从犯：</td>
                  <td ><input type="text" name="charge_next" class="input-text lh30 input required" value="${charge_next}"/></td>
                </tr>
                <tr>
   				  <td class="td_right">籍贯：</td>
                  <td ><input type="text" name="native_palace" class="input-text lh30 input required" value="${native_palace}"/></td>
                  
                   <td class="td_right">控诉人联系方式：</td>
                  <td >
                  <input type="text" name="Sue_phone" class="input-text lh30 input required" value="${Sue_phone}"/>
                                <p>格式如：0731-12345678</p>
                  </td>
                  
                   <td  class="td_right">犯罪嫌疑人家庭联系方式：</td>
                  <td ><input type="text" name="charge_familyPhone" class="input-text lh30 input required" value="${charge_familyPhone}"/></td>
                 </tr>
                 
                 <tr>
                   <td class="td_right">起诉人姓名：</td>
                  <td >
                 <input type="text" name="Sue_name" class="input-text lh30 input required" value="${Sue_name}"/>
                  </td>
                  
                 <td class="td_right">被害人姓名：</td>
                  <td >
                 <input type="text" name="victim_name" class="input-text lh30 input required" value="${victim_name}"/>
                  </td>
                  
                   <td class="td_right">犯罪嫌疑人家人姓名：</td>
                  <td ><input type="text" name="charge_familyName" class="input-text lh30 input required" value="${charge_familyPhone}"/></td>
                 </tr>
                 <tr>
	                 <td>
	                   <input type="submit" value="确定" class="ext_btn ext_btn_submit">
	                 </td>
                 </tr>
               </table>
               </form> 
            </div> 
          </div>
        </div>
     </div>
   <script type="text/javascript">
   </script> 
 </body>
 </html>
  
<%-- 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>无标题文档</title>
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/jquery.js"></script>
 	<script type="text/javascript" src="js/jquery.validate.min.js" ></script>
      <script type="text/javascript" src="js/xingshi.js"></script>
</head>
<body>
 <div class="head">	
        </div>
        <div id="container">
          <div class="demo">
                <form id="myform" action="geteditCR.do" method="get">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mytable">
                        <tr>
                    	    <td width="22%" align="right">编号：</td>
                    	    <td ><input type="text" name="CRid" id="CRid"  value="${id}" readonly="readonly"/></td>
                    	</tr>
                     	<tr>
                            <td width="22%" align="right">身份证号：</td>
                            <td><input type="text" name="IDCard" id="IDCard"  value="${idcard}" onchange="javascript:scCard()" />
                                <p>请输入18位身份证号</p></td>
                        </tr>
                        <tr>
                            <td width="22%" align="right">用户名：</td>
                            <td><input type="text" name="user" id="user" value="${name}" />
                                <p>用户名为3-16个字符，可以为数字、字母、下划线以及中文</p></td>
                        </tr>
                       <tr>
                            <td align="right">出生日期：</td>
                            <td><input type="text" name="birthday" id="birthday"  value="${birthday}" />
                                <p>格式如：1990-10-01</p></td>
                        </tr>
                        <tr>
                            <td align="right">案发时间：</td>
                            <td><input type="text" name="day" id = "day" class="input required" value="${day}"  />
                                <p>格式如：1990-10-01</p></td>
                        </tr>
                        <tr>
                            <td align="right">出生地点：</td>
                            <td><input type="text" name="birthPalce" id = "birthPalce"  class="input required" value="${birthPalce}"/></td>
                        </tr>
                        <tr>
                            <td align="right">案发地点：</td>
                            <td><input type="text" name="workPalce" id = "workPalce" class="input required" value="${workPlace}" /></td>
                        </tr>
                        <tr>
                            <td align="right">民族：</td>
                            <td><input type="text" name="nation" id = "nation" class="input required" value="${nation}"/></td>
                        </tr>
                        <tr>
                            <td align="right">学历：</td>
                            <td>${degree_education}<select name="degree_education" class="required">
                                    <option value="">请选择</option>
                                    <option value="1">博士</option>
                                    <option value="2">硕士</option>
                                    <option value="3">本科</option>
                                    <option value="4">其他</option>
                                </select></td>
                        </tr>
                        <tr>
                            <td align="right">性别：</td>
                            <td>${sex}<input type="radio" name="sex" value="1" /> 男 <input type="radio" name="sex" value="0" /> 女</td>
                        </tr>
                        <tr>
                            <td align="right">政治面貌：</td>
                            <td><input type="text" name="politics_status" class="input required" value="${politics_status}"/></td>
                        </tr>
                        <tr>
                            <td align="right">是否有前科：</td>
                            <td>${is_CriminalRecord}
                          		<input type="radio" name="is_CriminalRecord" value="惯犯"  />惯犯
								<input type="radio" name="is_CriminalRecord" value="初犯" checked="checked"/>初犯
                            </td>
                        </tr>
                         <tr>
                            <td align="right">涉嫌罪名：</td>
                            <td><input type="text" name="charge" class="input required" value="${charge}"/></td>
                        </tr>
                        <tr>
                            <td align="right">主要罪犯：</td>
                            <td><input type="text" name="charge_main" class="input required" value="${charge_main}"/></td>
                        </tr>
                        <tr>
                            <td align="right">从犯：</td>
                            <td><input type="text" name="charge_next" class="input required" value="${charge_next}"/></td>
                        </tr>
                         <tr>
                            <td align="right">被害人姓名：</td>
                            <td><input type="text" name="victim_name" class="input required" value="${victim_name}"/></td>
                        </tr>
                  		 <tr>
                            <td align="right">起诉人姓名：</td>
                            <td><input type="text" name="Sue_name" class="input required" value="${Sue_name}"/></td>
                        </tr>
                        <tr>
                            <td align="right">籍贯：</td>
                            <td><input type="text" name="native_palace" class="input required" value="${native_palace}"/></td>
                        </tr>
                        <tr>
                            <td align="right">控告人联系电话：</td>
                            <td><input type="text" name="Sue_phone" class="input required" value="${Sue_phone}"/>
                                <p>格式如：0731-12345678</p></td>
                        </tr>
                         <tr>
                            <td align="right">罪犯家人姓名：</td>
                            <td><input type="text" name="charge_familyName" class="input required" value="${charge_familyName}"/></td>
                        </tr>
                        <tr>
                            <td align="right">罪犯家人联系电话：</td>
                            <td><input type="text" name="charge_familyPhone" class="input required" value="${charge_familyPhone}"/></td>
                        </tr>
                      
                <!--         <tr>
                            <td align="right">上传头像：</td>
                            <td><input type="file" name="photo" class="required" />
                                <p>头像为jpg,gif或者png格式的图片</p></td>
                        </tr> -->
                        <!-- <tr>
                            <td align="right">验证码：</td>
                            <td><input type="text" name="captcha" class="input required" style="width:80px;" />
                                <img src="getcode.php" id="getcode"  alt="看不清，点击换一张" align="absmiddle" style="cursor:pointer" />
                            </td>
                        </tr> -->
                        <tr>
                            <td height="42">&nbsp;</td>
                            <td><input type="submit" class="btn" value="提 交" /> &nbsp; <input type="reset" class="btn" value="重 置" /></td>
                        </tr>
                    </table>
                </form>

            </div>
    </div>

</body>

</html>
                             --%>