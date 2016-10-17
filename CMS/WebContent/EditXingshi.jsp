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
 <script language="javascript">
// 这个脚本是 ie6和ie7 通用的脚本
function custom_close(){
if 
(confirm("您确定要关闭本页吗？")){
window.opener=null;
window.open('','_self');
window.close();
}
else{}
}
</script>  
   <title>Document</title>
 </head>
 <body>
  <div class="container">
       <div class="box_bottom pb5 pt5 pr10" style="border-top:1px solid #dadada;">
              <div class="search_bar_btn" style="text-align:right;">
                 <input type="button" value="返回" onclick="custom_close()" class="ext_btn"/>
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
                  <td >
                  				<select id="degree_education" name="degree_education" class="input-text lh30 required">
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
                  	<input type="radio" id="sex" name="sex" value="男" /> 男 <input type="radio" name="sex" value="女" /> 女
                  </td>
                  
                   <td class="td_right">政治面貌：</td>
                  <td >
                  	<input type="text" name="politics_status" class="input-text lh30 input required" value="${politics_status}"/>
                  </td>
                  
                   <td class="td_right">是否是惯犯：</td>
                  <td class="input-text lh30 input required">
                          		<input type="radio" name="is_CriminalRecord" value="有前科"  />惯犯
								<input type="radio" name="is_CriminalRecord" value="没有前科" />初犯
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
                  <td class="td_right">审核状态：</td>
                  <td ><input type="text" name="state" class="input-text lh30 input required" value="${state}" readonly="readonly"/></td>
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
 
   $("#degree_education  option[value='${temp_degree_education}'] ").attr("selected",true);
   $("input[name='is_CriminalRecord'][value='${is_CriminalRecord}']").attr("checked",true);
   $("input[name='sex'][value='${sex}']").attr("checked",true);
   </script> 
 </body>
 </html>
