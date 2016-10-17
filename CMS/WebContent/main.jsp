 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!doctype html>
 <html lang="zh-CN">
 <head>
   <meta charset="UTF-8">
   <link rel="stylesheet" href="css/common.css">
   <link rel="stylesheet" href="css/pagination.css" />
   <link rel="stylesheet" href="css/main.css">
   <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/jquery.validate.min.js" ></script>
   <script type="text/javascript" src="js/colResizable-1.3.min.js"></script>
   <script type="text/javascript" src="js/jquery.staffpagination.js"></script>
   <script type="text/javascript" src="js/common.js"></script>
   	<script type="text/javascript" src="js/loginCheck.js" ></script>
       <script language="JavaScript" src="js/jquery.base64.js"></script><!-- md5加密 -->
    <script language="JavaScript" src="js/tableExport.js"></script>
     <script type="text/ecmascript" src="js/md5.js"></script><!--md5加密  -->
   <script type="text/javascript">
      $(function(){  
        $(".list_table").colResizable({
          liveDrag:true,
          gripInnerHtml:"<div class='grip'></div>", 
          draggingClass:"dragging", 
          minWidth:30
        }); 
        
      }); 
    
       
   </script>
   <title>管理员界面</title>
 </head>
 <body>
  <div class="container">
    <div id="button" class="mt10">
       <input type="button" name="button" id="add" class="btn btn82 btn_add"  value="新增"> 
       <input type="button" name="button" class="btn btn82 btn_del" onclick="deleteSelect()" value="删除"> 
       <input type="button" name="button" class="btn btn82 btn_checked" onclick="checkAll(this)" value="全选"> 
       <input type="button" name="button" class="btn btn82 btn_nochecked" onclick="DischeckAll(this)" value="取消"> 
     </div>
    <div id="search_bar" class="mt10">
       <div class="box">
          <div class="box_border">
            <div class="box_top"><b class="pl15">搜索</b></div>
            <div class="box_center pt10 pb10">
              <table class="form_table" border="0" cellpadding="0" cellspacing="0">
               <tr>
               <td>
                	<select id="queryStaff">
                      	    	<option value="1">根据员工id查找</option>
                      	    	<option value="2">根据员工姓名查找</option>
                      	    	<option value="3">根据身份证号查找</option>
                      	    	<option value="4">系统登录名查找</option>
                      </select>
                 </td>
                  <td>员工id</td>
                  	 <td><input type="text" name="staffID" id="staffID" class="input-text lh25" size="10"></td>
                  <td>员工姓名</td>
                 	 <td><input type="text" name="name" id="name" class="input-text lh25" size="10"></td>
                  <td>身份证号</td>
                  <td><input type="text" name="idcard" id="idcard" class="input-text lh25"></td>
                  <td>系统登录名</td>
                    <td><input type="text" name="loginname" id="loginname" class="input-text lh25" size="10"></td>
                </tr>
              </table>
            </div>
          <div class="box_bottom pb5 pt5 pr10" style="border-top:1px solid #dadada;">
              <div class="search_bar_btn" style="text-align:right;">
                 <input type="submit" value="确定" class="ext_btn ext_btn_submit" onclick="queryStaff()"/>
                <!--  <input type="button" value="返回" onclick="location.href='javascript:history.go(-1)'" class="ext_btn">
                 <input type="button" class="ext_btn ext_btn_success" value="成功">
                 <input type="button" class="ext_btn ext_btn_error" value="错误">
                 <a href="" class="ext_btn"><span class="add"></span>添加</a> -->
              </div>
            </div>
          </div>
        </div>
    </div>
  <div id="table" class="mt10">
        <div class="box span10 oh">
              <table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table" id="list_table">
                <thead>
	   				 <tr>
	   				 	<th></th>
					    <th style="width: 118px">员工编号</th>
					    <th style="width: 150px">员工身份证号</th>
					    <th style="width: 120px">员工姓名</th>
					    <th style="width: 120px">登录名</th>
					    <th style="width: 255px">登录密码</th>
					    <th>身份</th>
					    <th>操作</th>
	    			</tr>
	   			 </thead>
                
              
              </table>
              <div class="page mt10">
                <div class="pages">
			        <div id="Pagination"></div>
			        <div class="searchPage">
			        <!--   <span class="page-go">跳转<input type="text"/>页 <a href="javascript:;" class="page-btn">GO</a></span> -->
			         
			        </div>
			    </div>

              </div>
              
                 <div id="forms" class="mt10">
        <div class="box1">
          <div class="box_border">
            <div class="box_top"><b class="pl15">新增人员</b></div>
            <div class="box_center">
              <form action="AddStaff.do" id="register_form" class="jqtransform" >
               <table class="form_table pt15 pb15" width="100%" border="0" cellpadding="0" cellspacing="0">
                 <tr>
                  <td class="td_right">真实姓名：</td>
                  <td class=""> 
                    <input type="text" name="Tusername" id="Tusername" class="input-text lh30 input required" size="40">
                  </td>
                  <td class="td_right">登录名：</td>
                  <td>
                  	<input type="text" name="Rusername" id="Rusername" class="input-text lh30 input required" onchange="javascript:judgeName()" size="40">
                  </td>
                </tr>
                <tr>
                  <td class="td_right">登录密码：</td>
                  <td>
                  	<input type="password" name="Rpassword"  id="Rpassword" class="input-text lh30 required" onchange="javascript:md()" size="18">
                  	<input class="form-control" type="hidden" name="password1"  id="password1"/>
                  </td>
                  <td class="td_right">重复登录密码：</td>
                  <td>
					 <input type="password" class="input-text lh30 required" id="rpassword" placeholder="Re-type Your Password" name="rpassword"/>
				  </td>
                </tr>
                <tr >
                 <td class="td_right">身份证号：</td>
                  <td>
                  	<input type="text" name="IDCard" id="IDCard" class="input-text lh30" size="18" onchange="javascript:scCard()">
                  </td>
                  
                  <td class="td_right">身份：</td>
                  <td class="">
 
                    <span class="fl">
                      <div class="select_border"> 
                        <div class="select_containers "> 
	                        <select name="rememberRadio" class="select"> 
		                        <option value="0">民警</option> 
		                        <option value="2">管理员</option> 
		                        <option value="1">上级</option> 
	                        </select> 
                        </div> 
                      </div> 
                    </span>
                  </td>
                 </tr>
                 <tr>
                   <td class="td_right">&nbsp;</td>
                   <td class="">
                     <input type="submit" name="button" id="sub" class="btn btn82 btn_save2" value="保存"> 
                   </td>
                 </tr>
               </table>
               </form>
            </div>
          </div>
        </div>
     </div>
   </div>  
        </div>
     </div>
     <script type="text/javascript">
     function md(){
 		 var pw = document.getElementById("Rpassword").value;
 		 var pw1 = md5(pw);
 		 document.getElementById("password1").value = pw1;
 	 }
     </script>
 </body>
 </html>
 <!--  -->