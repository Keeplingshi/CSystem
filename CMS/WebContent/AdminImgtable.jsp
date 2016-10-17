<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/pagination.css" />
<script type="text/javascript" src="js/AdminImgtable.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.adminPagination.js"></script>
<!-- <script type="text/javascript">
$(document).ready(function() {
	$("#Pagination").paginationAdmin("15");
});
</script> -->
<script language="javascript">
	$(function(){	
		//导航切换
		$(".imglist li").click(function(){
			$(".imglist li.selected").removeClass("selected");
			$(this).addClass("selected");
		});
	});
	 function LoadFunction() {  
		 /* alert("加载中");   */
  }  
  function erryFunction(XMLHttpRequest, result, errorThrown,res) {  
	  alert(XMLHttpRequest.status);   // 200    
	  alert(res);
	  alert(errorThrown); 
  }  
	function queryadmin(){
		 var num = document.getElementById("querySelect").value;
		 var checkContent = document.getElementById("postid").value;
		 if   (checkContent==""){
		     alert("内容不能为空");
		     return;//直接返回，不进行搜索
		     };  
		 switch(num){
		 case "1":
			 var n = Number(checkContent);
			 if(isNaN(n)){
				 alert("请输入数字");
			     document.getElementById("postid").value = "";
			     return;//直接返回，不进行搜索
			 }
			 break;
		 case "2":
			 var   reg   =   /^(\d{4})-(\d{2})-(\d{2})$/;      
		     var   arr   =   reg.exec(checkContent);      
		     if   (!reg.test(checkContent)&&RegExp.$2<=12&&RegExp.$3<=31){           
		    	 alert("日期格式不正确，请输入YYYY-mm-dd");  
		    	 document.getElementById("postid").value = "";
		    	 return;//直接返回，不进行搜索
		      }      
			 break;
		 case "3":
			 break;
		 case "4":
			 if(checkContent != "未通过"&&checkContent !="已通过"){
				 alert("只能输入已通过/未通过");  
		    	 document.getElementById("postid").value = "";
		    	 return;//直接返回，不进行搜索
			 }
			 break;
		 }
		 
		var info = document.getElementById("querySelect").value;
		var a=document.getElementById("postid").value;
		
		var url =null;
		if(info == "1"){
			url = "query.do?flag="+"search&info=id&id="+a;
		}else if(info == "2"){
			url = "query.do?flag="+"search&info=day&day="+a;
		}else if(info == "3"){
			url = "query.do?flag="+"search&info=name&name="+a;
		}else if(info == "4"){
			url = "query.do?flag="+"search&info=state&state="+a;
		}
		$.ajax({
	        url:url,
	        // 数据发送方式
	        type:"post",
	        // 接受数据格式
	        dataType:"json",
	        // 要传递的数据
	        beforeSend: LoadFunction, //加载执行方法
	        error: erryFunction,  //错误执行方法  
	        success: succFunction //成功执行方法 
		});
	}
	// 回调函数，接受服务器端返回给客户端的值，即result值
	function succFunction(result){
		 var table = document.getElementById("table_1");//获取表格
			if(table==null ||table==""){
				 alert("获取表格为空"); 
			}else{
				var rows = table.rows.length ;//获取表格的行数
				for(var i=rows-1;i>0;i--){
					table.deleteRow(i);
				}
			}

		var result_list = eval(result);
         $.each(result_list, function (index, item) {  

             //循环获取数据    
        	  var ID = result_list[index].id;  
              var idcard = result_list[index].idcard;  
              var name = result_list[index].name; 
              var birthday = result_list[index].birthday;  
              var day = result_list[index].day;  

              var workPlace = result_list[index].workPalce;
              var  birthPalce= result_list[index].birthPalce;
    
              var degree_education = result_list[index].degreeEducation;
       
              if(result_list[index].degreeEducation=="1"){
    	  			degree_education = "博士";
              }else if(result_list[index].degreeEducation=="2"){
            	  degree_education = "硕士";
    	      }else if(result_list[index].degreeEducation=="3"){
    	  			degree_education = "本科";  
    		  }else if(result_list[index].degreeEducation=="4"){
    				degree_education = "其他";
    			}
              
              var nation = result_list[index].nation;
              var sex = null;
   
              if(result_list[index].sex == "true"){
            	  sex = "女";  
              }else{
            	  sex = "男";  
              }
             /* var sex = result_list[index].sex;*/
              var politics_status = result_list[index].politicsStatus;
              var is_CriminalRecord = null;
              if(result_list[index].isCriminalRecord == "true"){
            	  is_CriminalRecord = "有前科";
              }else{
            	  is_CriminalRecord = "没有前科";
              }
     
              var charge = result_list[index].charge;
              var charge_main = result_list[index].chargeMain;
              var charge_next = result_list[index].chargeNext;
              var victim_name = result_list[index].victimName;
              var Sue_name = result_list[index].sueName;
              var native_palace = result_list[index].nativePalace;
              var Sue_phone = result_list[index].suePhone;
              var charge_familyName = result_list[index].chargeFamilyName;
              var charge_familyPhone = result_list[index].chargeFamilyPhone;
              var state = null;  
              if(result_list[index].state == "true"){
            	  state = "通过";
              }else{
            	  state = "未通过";
              }
              
              var IDtd = document.createElement("td");
      		var IDText = document.createTextNode(ID);
      		IDtd.appendChild(IDText);
    		
    		var IDCardTd = document.createElement("td");
    		var IDCardText = document.createTextNode(idcard);
    		IDCardTd.appendChild(IDCardText);
    		
    		var nametd = document.createElement("td");
    		var nameText = document.createTextNode(name);
    		nametd.appendChild(nameText);
    		
    		var nametd = document.createElement("td");
    		var nameText = document.createTextNode(name);
    		nametd.appendChild(nameText);

    		var birthdaytd = document.createElement("td");
    		var birthdayText = document.createTextNode(birthday);
    		birthdaytd.appendChild(birthdayText);

    		var daytd = document.createElement("td");
    		var dayText = document.createTextNode(day);
    		daytd.appendChild(dayText);
    		
    		var workPlacetd = document.createElement("td");
    		var workPlaceText = document.createTextNode(workPlace);
    		workPlacetd.appendChild(workPlaceText);
    		
    		var birthPalcetd = document.createElement("td");
    		var birthPalceText = document.createTextNode(birthPalce);
    		birthPalcetd.appendChild(birthPalceText);
    		
    		 var degree_educationtd = document.createElement("td"); 
    	  	var degree_educationText = document.createTextNode(degree_education);
    	  	degree_educationtd.appendChild(degree_educationText);

    		var nationtd = document.createElement("td");
    		var nationText = document.createTextNode(nation);
    		nationtd.appendChild(nationText);
    		
    		var politics_statustd = document.createElement("td");
    		var politics_statusText = document.createTextNode(politics_status);
    		politics_statustd.appendChild(politics_statusText);
    		
    		var sextd = document.createElement("td");
    		var sexText = document.createTextNode(sex);
    		sextd.appendChild(sexText);
    		
    		var is_CriminalRecordtd = document.createElement("td");
    		var is_CriminalRecordText = document.createTextNode(is_CriminalRecord);
    		is_CriminalRecordtd.appendChild(is_CriminalRecordText);
    		
    		var chargetd = document.createElement("td");
    		var chargeText = document.createTextNode(charge);
    		chargetd.appendChild(chargeText);
    		
    		var charge_maintd = document.createElement("td");
    		var charge_mainText = document.createTextNode(charge_main);
    		charge_maintd.appendChild(charge_mainText);
    		
    		var charge_nexttd = document.createElement("td");
    		var charge_nextText = document.createTextNode(charge_next);
    		charge_nexttd.appendChild(charge_nextText);
    		
        	var victim_nametd = document.createElement("td");
    		var victim_nameText = document.createTextNode(victim_name);
    		victim_nametd.appendChild(victim_nameText);
    		
    		var Sue_nametd = document.createElement("td");
     		var Sue_nameText = document.createTextNode(Sue_name);
     		Sue_nametd.appendChild(Sue_nameText);
     	
     		 var native_palacetd = document.createElement("td");
     	  	 var native_palaceText = document.createTextNode(native_palace);
     	  	 native_palacetd.appendChild(native_palaceText);
     	  		
     	  	var Sue_phonetd = document.createElement("td");
     	    var Sue_phoneText = document.createTextNode(Sue_phone);
     	   	Sue_phonetd.appendChild(Sue_phoneText);
     	   		
     	   	 var charge_familyNametd = document.createElement("td");
     	  	 var charge_familyNameText = document.createTextNode(charge_familyName);
     	  	 charge_familyNametd.appendChild(charge_familyNameText);
     	  		
     	  	var charge_familyPhonetd = document.createElement("td");
     	   	var charge_familyPhoneText = document.createTextNode(charge_familyPhone);
     	   	charge_familyPhonetd.appendChild(charge_familyPhoneText);
           
    	  	var statetd = document.createElement("td");
    		var stateText = document.createTextNode(state);
    		statetd.appendChild(stateText);
    		
    		var operationTd = document.createElement("td");
    			var detailElement = document.createElement("a");
    			detailElement.setAttribute("href", "detailCR.do?CRid="+ID);
    			detailElement.setAttribute("target", "_blank");
    			var detailText = document.createTextNode("详情 |");
    			detailElement.appendChild(detailText);
    			
				var aAgreeElement = document.createElement("a");
				aAgreeElement.setAttribute("href", "adminhandler.do?flag="+true+"&id="+ID);
				var deleteText = document.createTextNode("同意   ");
				aAgreeElement.appendChild(deleteText);
				
				var aDisAgreeElement = document.createElement("a");
				aDisAgreeElement.setAttribute("href", "adminhandler.do?flag="+false+"&id="+ID);
				var editText = document.createTextNode("不同意");
				aDisAgreeElement.appendChild(editText);
				operationTd.appendChild(detailElement);
			operationTd.appendChild(aAgreeElement);
			operationTd.appendChild(aDisAgreeElement);
    		//③创建tr
    		var trElement = document.createElement("tr");
    		//④增加td到tr上
	    		trElement.appendChild(IDtd);
	    		trElement.appendChild(IDCardTd);
	    		trElement.appendChild(nametd);
	    		trElement.appendChild(birthdaytd);
	    		trElement.appendChild(daytd);
	    		trElement.appendChild(birthPalcetd);
	    		trElement.appendChild(workPlacetd);
	    		trElement.appendChild(degree_educationtd);
	    		trElement.appendChild(statetd);
	    		trElement.appendChild(operationTd);
    		//⑤tr添加到table
    		var tableElement = document.getElementById("table_1");
    		tableElement.appendChild(trElement);
    		//删除
    		aDisAgreeElement.onclick=function(){
    			return delTr(aDisAgreeElement);
    		};
    		aAgreeElement.onclick=function(){
    			return agree(aAgreeElement);
    		};
         }); 
};

function agree(aAgreeElement){
	var id = aAgreeElement.parentNode.parentNode.firstChild.firstChild.nodeValue;
	var flag = window.confirm("确定要同意"+id+"这个记录吗");
	if(!flag){
		//使网页链接失效
		return false;
	}else{
		//获取tr
		var table = aAgreeElement.parentNode.parentNode.parentNode;
		var trElement = aAgreeElement.parentNode.parentNode;
		//删除
		table.removeChild(trElement);
		//使网页链接失效
		return true;
	}
};
function delTr(aDisAgreeElement){
	var id = aDisAgreeElement.parentNode.parentNode.firstChild.firstChild.nodeValue;
	var flag = window.confirm("确定不同意："+id+"这个申请吗");
	if(!flag){
		//使网页链接失效
		return false;
	}else{
		//获取tr
	/* 	var table = aDisAgreeElement.parentNode.parentNode.parentNode;
		var trElement = aDisAgreeElement.parentNode.parentNode;
		//删除
		table.removeChild(trElement); */
		//使网页链接失效
		return true;
	}
};
</script>
</head>

<body>
	<div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
		    <li><a href="AdminImgtable.jsp">刑事案件记录</a></li>
	    </ul>
    </div>
    
    <div class="rightinfo">
	    <div class="tools">
	     <div class="search-box" style=" padding-top:20px;position: relative; z-index: 5;float:right;">
             <div class="input-box"> 
                  <select id="querySelect">
                     <option value="1">根据id查找</option>
                     <option value="2">根据犯案时间查找</option>
                     <option value="3">根据报案人查找</option>
                     <option value="4">根据处理状态 查找</option>
                  </select>
                  <input name="postid" type="text" class="inp-metro" id="postid" placeholder="请输入查找相关查找信息" maxlength="26" autocomplete="off" style="color: rgb(51, 51, 51);"/>
                  <input type="button" id="query" onclick="queryadmin()" value="搜索"/>
             </div>
           </div> 
	    </div>
   	  	<div class="formtitle"><span>刑事案件登记记录</span></div>
    	<div class="toolsli"  style="overflow: auto; width: 100%;">
	   		<table class="imgtable" id="table_1">
	   			 <thead>
	   				 <tr>
					    <th>登记表编号</th>
					    <th>身份证号</th>
					    <th>姓名</th>
					    <th>出生日期</th>
					    <th>犯案时间</th>
					    <th>出生地</th>
					     <th>工作地址</th>
					    <th>学历</th>
					   <!--  <th>民族</th>
					    <th>sex</th>
					    <th>政治面貌</th>
					    <th>是否有前科</th>
					    <th>涉嫌罪名</th>
					    <th>主要罪犯</th>
					    <th>从犯</th>
					    <th>被害人姓名</th>
					    <th>起诉人姓名</th>
					    <th>籍贯</th>
					    <th>控告人联系方式</th>
					    <th>犯罪者家属姓名</th>
					    <th>犯罪者家属联系方式</th>  -->
					    <th>状态</th>
					    <th>操作</th>
	    			</tr>
	   			 </thead>
	   			 <tbody>
			    </tbody>
		  </table>
  		 </div>
 
	    <div class="pagin">
	    	<div class="message">全部数据共
	    		<i id="allRecord" class="blue"></i>条记录，当前显示第&nbsp;&nbsp;
	    		<i id="nowRecord" class="blue">1&nbsp;&nbsp;</i>页
		    </div>
		 </div>
		  <div class="pages">
	        <div id="Pagination"></div>
	    </div>
	    
    
<script type="text/javascript">
	$('.imgtable tbody tr:odd').addClass('odd');
</script>
    
</body>

</html>
