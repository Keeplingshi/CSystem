<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/main.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jsapi.js"></script>
<script type="text/javascript" src="js/format+zh_CN,default,corechart.I.js"></script>		
<script type="text/javascript" src="js/jquery.gvChart-1.0.1.min.js"></script>
<script type="text/javascript" src="js/jquery.ba-resize.min.js"></script>

<script type="text/javascript">
		gvChartInit();
		jQuery(document).ready(function(){

		jQuery('#myTable5').gvChart({
				chartType: 'PieChart',
				gvSettings: {
					vAxis: {title: 'No of players'},
					hAxis: {title: 'Month'},
					width: 650,
					height: 250
					}
			});
		});
		</script>
</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">工作台</a></li>
    </ul>
    </div>
    
    
    
    
    <div class="leftinfo">
   		 <div class="listtitle"><a href="#" class="more1">更多</a>最新消息</div>
   		 <div class="maintj">  
		    <table id='myTable5'>
		    
		    </table>  
  		  </div>
    </div> 
    <div class="leftinfos">
	    <div class="mainright">
		    <div class="dflist">
			    <div class="listtitle"><a href="#" class="more1">更多</a>法律文库查询</div>    
				    <ul class="newlist">
					    <li><a href="http://www.chinacourt.org/law/detail/2012/12/id/146068.shtml">中国法院网 </a></li>
					    <li><a href="http://code.fabao365.com/level_4.html">中央法规库</a></li>
					    <li><a href="http://www.nciic.com.cn/framework/gongzuo/index.jsp">全国公民身份证号码查询服务中心</a></li>
					    <li><a href="http://www.pkulaw.cn/">北大法宝</a></li>
				    </ul>        
	   		 </div>
	    </div>
    </div>
<script type="text/javascript">
	setWidth();
	$(window).resize(function(){
		setWidth();	
	});
	function setWidth(){
		var width = ($('.leftinfos').width()-12)/2;
		$('.infoleft,.inforight').width(width);
	}
</script>
</body>

</html>
