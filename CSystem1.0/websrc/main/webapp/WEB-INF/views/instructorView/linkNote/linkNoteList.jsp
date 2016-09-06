<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!-- 联系笔记类型列表页面 -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@	taglib tagdir="/WEB-INF/tags" prefix="tags" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/globle.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/button.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/addEditView.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/datePicker/WdatePicker.js"></script>

<form id="formId" action="${pageContext.request.contextPath}/instructor/linkNote/linkNoteSearchList" method="post">
	<input type="hidden" id="linkNoteTypeId" name="linkNoteTypeId" value="${linkNoteTypeId }" />
	<input type="hidden" id="sortMode" name="sortMode" value="${sortMode }" />
	<input type="hidden" id="sortValue" name="sortValue" value="${sortValue }" />

	<div class="breadcrumbs" id="linkNoteListToolbar">
	
		<span class="input-icon" style="margin: 5px;">
			<input type="text" id="nav-search-input" name="searchText" placeholder="Search ..." class="nav-search-input" autocomplete="off" value="${searchText }"/> 
			<i class="icon-search nav-search-icon"></i>
		</span>
		
		<input id="linkNoteDBToExcelButton" type="button" class="button button-primary button-rounded button-small" style="margin: 5px;float: right;" value="导出联系笔记"/>
		<input id="linkNoteDeleteButton" type="button" class="button button-primary button-rounded button-small" style="margin: 5px;float: right;" value="删除"/>
		<input id="linkNoteAddButton" type="button" class="button button-primary button-rounded button-small" style="margin: 5px;float: right;" value="新增"/>
		<input id="linkNoteQueryButton" type="button" class="button button-primary button-rounded button-small" style="margin: 5px;float: right;" value="查询"/>
	</div>
	<div class="breadcrumbs">
			<label style="margin-left: 20px;">起始时间：</label>
            <input type="text" id="beginTime" name="beginTime" placeholder="起始时间" class="Wdate" 
            	style="width: 150px;height: 30px;cursor: pointer;" value="<fmt:formatDate value="${beginTime }" pattern="yyyy-MM-dd"/>"
              	onfocus="WdatePicker({startDate:'%y',dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'endTime\')}'})">
            <label style="margin-left: 20px;">结束时间：</label>
            <input type="text" id="endTime" name="endTime" placeholder="结束时间" class="Wdate" 
            	style="width: 150px;height: 30px;cursor: pointer;" value="<fmt:formatDate value="${endTime }" pattern="yyyy-MM-dd"/>"
              	onfocus="WdatePicker({startDate:'%y',dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'beginTime\')}'})">
 	
		<label style="margin-left: 20px;">联系笔记类型：</label>
		<select id="linkNoteType_select_id" style="width: 100px;">
			<option value="" selected="selected">全部</option>
			<c:forEach items="${linkNoteTypeList }" var="linkNoteTypeItem">
				<option value="${linkNoteTypeItem.id }">${linkNoteTypeItem.name}</option>
			</c:forEach>
		</select>
	</div>
	<div class="table-responsive">
		<table id="sample-table-1" class="table table-striped table-bordered table-hover" style="table-layout:fixed;">
			<thead>
				<tr>
					<th class="center" style="width: 60px;">
						<label> <input id="theadCheckbox" type="checkbox" class="ace" /> <span class="lbl"></span></label>
					</th>
					<th style="width: 100px;">学号</th>
					<th style="width: 100px;">姓名</th>
					<th style="width: 120px;">班级</th>
					<th style="width: 160px;">联系笔记</th>
					<th style="width: 100px;">时间
					<c:choose>
						<c:when test="${sortMode=='asc'&&sortValue=='time' }">
							<img id="img_time_asc" style="float: right;" src="${pageContext.request.contextPath}/resources/images/sorticon/table_sort_up_24.png">
						</c:when>
						<c:when test="${sortMode=='desc'&&sortValue=='time' }">
							<img id="img_time_desc" style="float: right;" src="${pageContext.request.contextPath}/resources/images/sorticon/table_sort_down_24.png">
						</c:when>
						<c:otherwise>
							<img id="img_time" style="float: right;" src="${pageContext.request.contextPath}/resources/images/sorticon/table_sort_24.png">
						</c:otherwise>
					</c:choose>
					</th>
					<th>备注</th>
					<th>操作</th>
				</tr>
			</thead>
	
			<tbody>
				<c:forEach items="${linkNoteList }" var="linkNoteDomain">
					<tr>
						<td class="center">
						<label> <input type="checkbox" class="ace" value="${linkNoteDomain.id }"/> <span class="lbl"></span></label>
						</td>
						<c:if test="${linkNoteDomain.student!=null }">
							<td><a href="${pageContext.request.contextPath}/studentinfo/studentIndex/${linkNoteDomain.student.id }" target="_blank">${linkNoteDomain.student.stuId }</a></td>
							<td><a href="${pageContext.request.contextPath}/studentinfo/studentIndex/${linkNoteDomain.student.id }" target="_blank">${linkNoteDomain.student.name }</a></td>
							<td>${linkNoteDomain.student.classDomain.name }</td>
						</c:if>
						<c:if test="${linkNoteDomain.student==null }">
							<td></td>
							<td></td>
							<td>${linkNoteDomain.classDomain.name }</td>
						</c:if>

						<td>${linkNoteDomain.linkNoteType.name }</td>
						<td><fmt:formatDate value="${linkNoteDomain.time }" type="date"/></td>
						<td>${linkNoteDomain.note }</td>
						<td style="width: 260px">
							<input type="button" class="btn_list_view" value="查看" onclick="viewlinkNote('${linkNoteDomain.id }')"/>
							<input type="button" class="btn_list_update" value="修改" onclick="updatelinkNote('${linkNoteDomain.id }')"/>
							<input type="button" class="btn_list_delete" value="删除" onclick="deletelinkNote('${linkNoteDomain.id }')"/>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div id="pageId"><tags:paged /></div>
	</div>
</form>

<script type="text/javascript">

	$("#sample-table-1 thead tr th img").click(function(){
		var sortValueVal=$(this)[0].id.split("_")[1];
		var sortModeVal=$(this)[0].id.split("_")[2];
		$("#sortValue").val(sortValueVal);
		if(sortModeVal=='asc'){
			$("#sortMode").val('desc');
		}else{
			$("#sortMode").val('asc');
		}
		
 		//默认加载学生列表
		$("#formId").ajaxSubmit(function(data){
    	 	$("#content_page").html(data);
		}); 
	});

	//使下拉框默认选择
	$(function(){
		$("#linkNoteType_select_id option[value='${linkNoteTypeId}']").attr("selected",true);
	});
	
	 //下拉框选择后给隐藏域赋值
	$("#linkNoteType_select_id").change(function(){
		var linkNoteTypeIdVal=$(this).children('option:selected').val();
		$("#linkNoteTypeId").val(linkNoteTypeIdVal);
	});
	
	//查询
	$("#linkNoteQueryButton").click(function(){
		//加载列表
		$("#formId").ajaxSubmit(function(data){
	    	$("#content_page").html(data);
		});	
	});
	
	//报表
	$("#linkNoteReportButton").click(function(){
		parent.layer.open({
	        type: 2,
	        title: '联系笔记信息统计',
	        shadeClose: true,
	        area : ['600px' , '400px'],
	        offset: ['100px'],
	        content: '${pageContext.request.contextPath}/instructor/linkNote/linkNoteCountView'
	    });
	});

	//新增联系笔记类型按钮
	$("#linkNoteAddButton").click(function(){
	    parent.layer.open({
	        type: 2,
	        title: '新增联系笔记',
	        shadeClose: true, //点击遮罩关闭层
	        area : ['800px' , '650px'],
	        offset: '130px',
	        content: '${pageContext.request.contextPath}/instructor/linkNote/linkNoteAdd',
	        end: function(){
				//默认加载联系笔记类型列表
	    		$("#formId").ajaxSubmit(function(data){
	        	 	$("#content_page").html(data);
	    		});
	        }
	    });
	});
	
	//list中查看联系笔记类型按钮
	function viewlinkNote(linkNoteId)
	{
	    parent.layer.open({
	        type: 2,
	        title: '查看联系笔记',
	        shadeClose: true,
	        area : ['600px' , '470px'],
	        offset: ['100px'],
	        content: '${pageContext.request.contextPath}/instructor/linkNote/linkNoteView/'+linkNoteId
	    });
	}

	//list中修改联系笔记类型按钮
	function updatelinkNote(linkNoteId)
	{
	    parent.layer.open({
	        type: 2,
	        title: '修改联系笔记类型',
	        shadeClose: true,
	        area : ['600px' , '470px'],
	        offset: ['100px'],
	        content: '${pageContext.request.contextPath}/instructor/linkNote/linkNoteEdit/'+linkNoteId,
	        end: function(){
	        	//默认加载用户列表
	        	$("#formId").ajaxSubmit(function(data){
	        	 	$("#content_page").html(data);
	    		});
	        }
	    });
	}
	
	//删除
	function deletelinkNote(linkNoteId)
	{
		//询问框
		layer.confirm('是否确定删除？', {
			offset: '200px',
		    btn: ['确定','取消'] //按钮
		}, function(){
	 		//默认加载联系笔记类型列表
			$.post("${pageContext.request.contextPath}/instructor/linkNote/delete/"+linkNoteId, function(result){
				if(result=='success'){
					//默认加载联系笔记类型列表
		        	$("#formId").ajaxSubmit(function(data){
		        	 	$("#content_page").html(data);
		    		});
					parent.layer.msg('删除成功', {
						offset: '200px',
	     		        time: 1500//1.5s后自动关闭
	     		    });
				}else{
					layer.msg('删除失败', {
						offset: '200px',
	     		        time: 1500//1.5s后自动关闭
	     		    });
				}
			});
		}, function(){
			
		});
	}
	
	//多选删除
	$("#linkNoteDeleteButton").click(function(){
		var checkBoxs=$("table tbody input:checkbox");
		var linkNoteIds=new Array();
		for(var i=0;i<checkBoxs.length;i++)
		{
			var checkBox=checkBoxs[i];
			if(checkBox.checked){
				linkNoteIds.push(checkBox.value);
			}
		}
		if(linkNoteIds.length=='0'){
			layer.msg('请至少选择一个',{
				offset: ['260px']
			});
			return;
		}
		
		//询问框
		layer.confirm('是否确定删除这些记录？', {
			offset: ['260px'],
		    btn: ['确定','取消'] //按钮
		}, function(){
			$.ajax({
				url : "${pageContext.request.contextPath}/instructor/linkNote/deletelinkNotes",
				async: false,
				data : {
					"linkNoteIds" : linkNoteIds
				},
				dataType : "text",
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					layer.msg('删除失败',{
						offset: ['260px']
					});
                },
				success : function(result) {
					if(result=='success'){
						//默认加载用户列表
			        	$("#formId").ajaxSubmit(function(data){
			        	 	$("#content_page").html(data);
			    		});
						parent.layer.msg('删除成功', {
							offset: ['260px'],
		     		        time: 1500//1.5s后自动关闭
		     		    });
					}else{
						layer.msg('删除失败',{
							offset: ['260px']
						});
					}
				}
			});
			
		}, function(){
			
		});
	});

	//联系笔记导出
	$("#linkNoteDBToExcelButton").click(function(){
		parent.layer.open({
	        type: 2,
	        title: '联系笔记信息',
	        shadeClose: true,
	        area : ['600px' , '400px'],
	        offset: ['100px'],
	        content: '${pageContext.request.contextPath}/instructor/linkNote/linkNoteDBToExcelView'
	    });
		
	});
	
	//点击表格标题栏，选中所有checkbox框
	$('table th input:checkbox').on('click' , function(){
		
		var that=this;		
 		$(this).closest('table').find('tr > td:first-child input:checkbox').each(function(){
			this.checked = that.checked;
			$(this).closest('tr').toggleClass('selected');
		});
	});

	//选择学院，得到专业
	function getMajor(college_id)
	{
    	$.ajax({
			url:'${pageContext.request.contextPath}/instructor/major/getMajorByCollege?college_id='+college_id,
			type:"post",
			error:function(e){
			},
			success:function(data){
				var json = new Function("return" + data)();
 				var major_select=$("#major_select_id");
				major_select.empty();
				major_select.append('<option value="">'+"全部"+'</option>');
				for(var i=0;i<json.length;i++){
					major_select.append('<option value="'+json[i].selectText+'">'+json[i].selectValue+'</option>');
				} 
			}
		});
	}
	
	//选择专业，得到班级
	function getClass(major_id)
	{
    	$.ajax({
			url:'${pageContext.request.contextPath}/instructor/class/getClassByMajor?major_id='+major_id,
			type:"post",
			error:function(e){
			},
			success:function(data){
				var json = new Function("return" + data)();
 				var class_select=$("#class_select_id");
				class_select.empty();
				class_select.append('<option value="">'+"全部"+'</option>');
				for(var i=0;i<json.length;i++){
					class_select.append('<option value="'+json[i].selectText+'">'+json[i].selectValue+'</option>');
				} 
			}
		});
	}

	</script>
