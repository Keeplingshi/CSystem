/**
 * 
 */
//页面加载完毕的时候执行查询  刑事案件登记表和呈请文书
window.onload=function(){
	$.ajax({
        url:"query.do?flag="+"",
        // 数据发送方式
        type:"post",
        // 接受数据格式
        dataType:"json",
        // 要传递的数据
        beforeSend: LoadFunction, //加载执行方法
        error: erryFunction,  //错误执行方法  
        success: succFunction //成功执行方法 
	});/*data:param,  */
	
};


 function LoadFunction() {  
	} 
 
function erryFunction(XMLHttpRequest, result, errorThrown,res) {  
/*  alert(XMLHttpRequest.status);   // 200    
  alert(res);
  alert(errorThrown);  */
}  

//查询共有多少条记录
function succFunction1(result){
   	var num = Math.ceil(result/6);
   	var n = (num<2)?1:num;
   $("#Pagination").pagination(n);
	 var total = document.getElementById("allRecord");
	 total.innerText = result;
}

//查询刑事案件登记表 成功之后调用的函数
function succFunction(result){
	$.ajax({
        url:"queryAllCR.do",
        // 数据发送方式
        type:"post",
        // 接受数据格式
        dataType:"json",
        // 要传递的数据
        beforeSend: LoadFunction, //加载执行方法
        error: erryFunction,  //错误执行方法  
        success: succFunction1 //成功执行方法 
	}); 
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
          if(result_list[index].state == true){
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
		//当管理员没有审批或者审核结果是没有通过
		if(state == "未通过"){
			var aDeleteElement = document.createElement("a");
			aDeleteElement.setAttribute("href", "delete.do?id="+ID);
			var deleteText = document.createTextNode("删除 | ");
			aDeleteElement.appendChild(deleteText);
			
			
			var aEditElement = document.createElement("a");
			aEditElement.setAttribute("href", "editCR.do?id="+ID);
			aEditElement.setAttribute("target", "_blank");
			var editText = document.createTextNode("修改  | ");
			aEditElement.appendChild(editText);
			operationTd.appendChild(aDeleteElement);
			operationTd.appendChild(aEditElement);
			//删除
			aDeleteElement.onclick=function(){
				return delTr(aDeleteElement);
			};
		}
		
		var detailElement = document.createElement("a");
		detailElement.setAttribute("href","detailCR.do?CRid="+ID);
		detailElement.setAttribute("target", "_blank");
		var detailText = document.createTextNode("详情");
		detailElement.appendChild(detailText);
		
		operationTd.appendChild(detailElement);
		
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

		
     }); 
}        
function delTr(aDeleteElement){
	var id = aDeleteElement.parentNode.parentNode.firstChild.firstChild.nodeValue;
	var flag = window.confirm("确定要删除"+id+"这个记录吗");
	if(!flag){
		//使网页链接失效
		return false;
	}else{
		//获取tr
		var table = aDeleteElement.parentNode.parentNode.parentNode;
		var trElement = aDeleteElement.parentNode.parentNode;
		//删除
		table.removeChild(trElement);
		//使网页链接失效
		return true;
	}
};
//Case_Register search id

//通过id查询刑事案件登记表
function query(){
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
	 //开始查询
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


$(document).ready(function(){
	//刑事案件登记表的添加
	  $(".clickadd").click(function(){
	 	 $(".tip").fadeIn(200);
	 });
	  $(".tiptop a").click(function(){
	 	 $(".tip").fadeOut(200);
	 });
	  $(".suretip").click(function(){
	 	 $(".tip").fadeOut(100);
	 	 window.location="xingshi.jsp";
	});
	  $(".cancel").click(function(){
	  	$(".tip").fadeOut(100);
	});
});