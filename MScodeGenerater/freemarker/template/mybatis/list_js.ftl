/**
 * 查询${modelName}信息
 * @param {Object} null
 */
 <#assign idPreName = "${'${middelPath}'?replace('/','_')}">
 
function query${ClassName?cap_first}(){
    var url = getAbsolutePath("/<#assign s = "${middelPath}"?split("/")>${s[0]}/list${ClassName?cap_first}.do");
    var params = serializeObject($("#${idPreName}_queryForm"));
    commQuery(url, params, "#${idPreName}_dataGrid");
};
/**
 * 新增/编辑${modelName}信息
 * @param id
 */
function edit${ClassName?cap_first}(id){
	var url ="";
	if (id == undefined || id == "" || id == null || id == "null"){
		url = "/<#assign s = "${middelPath}"?split("/")>${s[0]}/show${ClassName?cap_first}.do";
	}else{
		url = "/<#assign s = "${middelPath}"?split("/")>${s[0]}/show${ClassName?cap_first}.do?${pk["javaName"]}=" + id;
	}
    loadPage("${modelName}--编辑", getCurrProgId(), url);
	
}
/**
 * 删除
 * @param {Object} null
 */
function del${ClassName?cap_first}(){
    var rows = $("#${idPreName}_dataGrid").datagrid("getChecked");
    if (rows.length > 0) {
        $.messager.confirm("提示", "您确定要删除选定的记录吗？", function(r){
            if (r) {
                var ids = "";
                for (i = 0; i < rows.length; i++) {
                    ids = ids + rows[i][1] + ",";
                }
                var url = "/<#assign s = "${middelPath}"?split("/")>${s[0]}/deleteAll${ClassName?cap_first}.do?ids=" + ids;
                url = getAbsolutePath(url);
                $.ajax({
                    type: "POST",
                    url: url,
                    dataType: "json",
                    success: function(data){
                        if (data.success) {
                            showMessage("提示", data.msg);
                            query${ClassName?cap_first}();
                        }
                        else {
                            $.messager.alert("错误", data.msg, "error");
                        }
                    }
                });
            }
        });
    }
    else {
        showMessage("提示", "请先选择要删除的记录！");
    }
}
/*
 * 清空查询表单
 */
function clearForm(){
	$("#${idPreName}_queryForm").form('clear');
	$("#${idPreName}_queryForm_isUsed").combobox('setValue', '');
	query${ClassName?cap_first}();
	
}

$(document).ready(function(){
   var options = defaultDataGridOptions;
   options.frozenColumns = [[{
       field: 'ck',
       checkbox: true
   }]];
    options.columns = [[ {
    <#list columnList as l>
      <#if "${l_index+1}"=="1">
        "field": "${l_index+1}",
        "title": "${l.remarks}",
        "width": 100,
        align: "center",
        formatter: function(value, row, index){ 
        	return "<a href=javascript:edit${ClassName?cap_first}(" + row[1] + ");>" + value + "</a>";
        }
    }
    <#else>
    , {
        "field": "${l_index+1}",
        "title": "${l.remarks}",
        "width": 200,
        align: "center"
       }
    </#if>
    </#list>
      ]];
	options.fitColumns =true;
    $('#${idPreName}_dataGrid').datagrid(options);
    query${ClassName?cap_first}();
});