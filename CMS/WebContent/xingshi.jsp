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
       <!-- <script type="text/javascript" src="js/upload.js"></script> -->
</head>
	
<body>
     <div class="place">
		    <span>位置：</span>
		    <ul class="placeul">
		    	<li><a href="#">刑事案件登记表填写</a></li>
		    </ul>
	    </div>
 <div class="head">	
        </div>
        <div id="container">
   
          <div class="demo">
                <form id="myform" action="addCaseRegister.do" method="get">
                    <table  width="100%" border="0" cellspacing="0" cellpadding="0" class="mytable">
                     	<tr>
                            <td width="22%" align="right">身份证号：</td>
                            <td><input type="text" name="IDCard" id="IDCard" onchange="javascript:scCard()" />
                            <font size="2px" color="#C0C0C0">输入18位有效身份证号</font>
                            </td>
                        </tr>
                        <tr>
                            <td width="22%" align="right">报案人：</td>
                            <td><input type="text" name="user" id="user" />
                            <font size="2px" color="#C0C0C0"> 2-16个字符，可以为数字、字母、下划线以及中文</font>
                               </td>
                        </tr>
                       <tr>
                            <td align="right">出生日期：</td>
                            <td><input type="text" name="birthday" id="birthday" />
                               <font size="2px" color="#C0C0C0">格式如：1990-10-01</font></td>
                        </tr>
                        <tr>
                            <td align="right">案发时间：</td>
                            <td><input  type="text" name="day" id = "day"   />
                                <font size="2px" color="#C0C0C0">格式如：1990-10-01</font></td>
                        </tr>
                        <tr>
                            <td align="right">出生地点：</td>
                            <td><input type="text" name="birthPalce" id = "birthPalce"   /></td>
                        </tr>
                        <tr>
                            <td align="right">案发地点：</td>
                            <td><input type="text" name="workPalce" id = "workPalce" /></td>
                        </tr>
                        <tr>
                            <td align="right">民族：</td>
                            <td><input type="text" name="nation" id = "nation"  /></td>
                        </tr>
                        <tr>
                            <td align="right">学历：</td>
                            <td><select name="degree_education" class="required">
                                    <option value="">请选择</option>
                                    <option value="1">博士</option>
                                    <option value="2">硕士</option>
                                    <option value="3">本科</option>
                                    <option value="4">其他</option>
                                </select></td>
                        </tr>
                        <tr>
                            <td align="right">性别：</td>
                            <td><input type="radio" name="sex" value="1" checked="checked"/> 男 <input type="radio" name="sex" value="0"  /> 女</td>
                        </tr>
                        <tr>
                            <td align="right">政治面貌：</td>
                            <td><input type="text" name="politics_status"  /></td>
                        </tr>
                        <tr>
                            <td align="right">是否有前科：</td>
                            <td>
                          		<input type="radio" name="is_CriminalRecord" value="0"  />惯犯
								<input type="radio" name="is_CriminalRecord" value="1" checked="checked"/>初犯
                            </td>
                        </tr>
                         <tr>
                            <td align="right">涉嫌罪名：</td>
                            <td><input type="text" name="charge"  /></td>
                        </tr>
                        <tr>
                            <td align="right">主要罪犯：</td>
                            <td><input type="text" name="charge_main"  /></td>
                        </tr>
                        <tr>
                            <td align="right">从犯：</td>
                            <td><input type="text" name="charge_next"/></td>
                        </tr>
                         <tr>
                            <td align="right">被害人姓名：</td>
                            <td><input type="text" name="victim_name"/></td>
                        </tr>
                  		 <tr>
                            <td align="right">起诉人姓名：</td>
                            <td><input type="text" name="Sue_name"/></td>
                        </tr>
                        <tr>
                            <td align="right">籍贯：</td>
                            <td><input type="text" name="native_palace"/></td>
                        </tr>
                        <tr>
                            <td align="right">控告人联系电话：</td>
                            <td><input type="text" name="Sue_phone" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
                             <font size="2px" color="#C0C0C0">输入11位手机号码</font></td>
                        </tr>
                         <tr>
                            <td align="right">罪犯家人姓名：</td>
                            <td><input type="text" name="charge_familyName" class="input required" /></td>
                        </tr>
                        <tr>
                            <td align="right">罪犯家人联系电话：</td>
                            <td><input type="text" name="charge_familyPhone" class="input required" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
                        	<font size="2px" color="#C0C0C0">输入11位手机号码</font>
                            </td>
                        </tr>
                      
                <!--         <tr>
                            <td align="right">上传头像：</td>
                            <td><input type="file" name="photo" class="required" />
                                <p>头像为jpg,gif或者png格式的图片</p></td>
                        </tr> -->
                       <!--  <tr>
                            <td align="right">验证码：</td>
                            <td><input type="text" name="captcha" class="input required" style="width:80px;" />
                                <img src="getcode.php" id="getcode"  alt="看不清，点击换一张" align="absmiddle" style="cursor:pointer" />
                            </td>
                        </tr> -->
                        <tr>
                            <td height="42">&nbsp;</td>
                            <td><input type="submit" class="btn" value="提 交" /> &nbsp;</td>
                        </tr>
                    </table>
                </form>

            </div>
    </div>

</body>

</html>
