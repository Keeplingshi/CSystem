/**
 * This jQuery plugin displays pagination links inside the selected elements.
 * 
 * This plugin needs at least jQuery 1.4.2
 *
 * @author Gabriel Birke (birke *at* d-scribe *dot* de)
 * @version 2.2
 * @param {int} maxentries Number of entries to paginate
 * @param {Object} opts Several options (see README for documentation)
 * @return {Object} jQuery Object
 */
 (function($){
	/**
	 * @class Class for calculating pagination values
	 */
	$.PaginationCalculator = function(maxentries, opts) {
		this.maxentries = maxentries;
		this.opts = opts;
	}
	
	$.extend($.PaginationCalculator.prototype, {
		/**
		 * Calculate the maximum number of pages
		 * @method
		 * @returns {Number}
		 */
		numPages:function() {
			return Math.ceil(this.maxentries/this.opts.items_per_page);
		},
		/**
		 * Calculate start and end point of pagination links depending on 
		 * current_page and num_display_entries.
		 * @returns {Array}
		 */
		getInterval:function(current_page)  {
			var ne_half = Math.floor(this.opts.num_display_entries/2);
			var np = this.numPages();
			var upper_limit = np - this.opts.num_display_entries;
			var start = current_page > ne_half ? Math.max( Math.min(current_page - ne_half, upper_limit), 0 ) : 0;
			var end = current_page > ne_half?Math.min(current_page+ne_half + (this.opts.num_display_entries % 2), np):Math.min(this.opts.num_display_entries, np);
			return {start:start, end:end};
		}
	});
	
	// Initialize jQuery object container for pagination renderers
	$.PaginationRenderers = {}
	
	/**
	 * @class Default renderer for rendering pagination links
	 */
	$.PaginationRenderers.defaultRenderer = function(maxentries, opts) {
		this.maxentries = maxentries;
		this.opts = opts;
		this.pc = new $.PaginationCalculator(maxentries, opts);
	}
	$.extend($.PaginationRenderers.defaultRenderer.prototype, {
		/**
		 * Helper function for generating a single link (or a span tag if it's the current page)
		 * @param {Number} page_id The page id for the new item
		 * @param {Number} current_page 
		 * @param {Object} appendopts Options for the new item: text and classes
		 * @returns {jQuery} jQuery object containing the link
		 */
		createLink:function(page_id, current_page, appendopts){
			var lnk, np = this.pc.numPages();
			page_id = page_id<0?0:(page_id<np?page_id:np-1); // Normalize page id to sane value
			appendopts = $.extend({text:page_id+1, classes:""}, appendopts||{});
			if(page_id == current_page){
				lnk = $("<a class='current'>" + appendopts.text + "</a>");
			}
			else
			{
				lnk = $("<a>" + appendopts.text + "</a>")
					.attr('href', this.opts.link_to.replace(/__id__/,page_id));
			}
			if(appendopts.classes){ lnk.addClass(appendopts.classes); }
			lnk.data('page_id', page_id);
			return lnk;
		},
		// Generate a range of numeric links 
		appendRange:function(container, current_page, start, end, opts) {
			var i;
			for(i=start; i<end; i++) {
				this.createLink(i, current_page, opts).appendTo(container);
			}
		},
		getLinks:function(current_page, eventHandler) {
			var begin, end,
				interval = this.pc.getInterval(current_page),
				np = this.pc.numPages(),
				fragment = $("<div class='pagination'></div>");
			
			// Generate "Previous"-Link
			if(this.opts.prev_text && (current_page > 0 || this.opts.prev_show_always)){
				fragment.append(this.createLink(current_page-1, current_page, {text:this.opts.prev_text, classes:"prev"}));
			}
			// Generate starting points
			if (interval.start > 0 && this.opts.num_edge_entries > 0)
			{
				end = Math.min(this.opts.num_edge_entries, interval.start);
				this.appendRange(fragment, current_page, 0, end, {classes:'sp'});
				if(this.opts.num_edge_entries < interval.start && this.opts.ellipse_text)
				{
					$("<span class='pagination-break'>"+this.opts.ellipse_text+"</span>").appendTo(fragment);
				}
			}
			// Generate interval links
			this.appendRange(fragment, current_page, interval.start, interval.end);
			// Generate ending points
			if (interval.end < np && this.opts.num_edge_entries > 0)
			{
				if(np-this.opts.num_edge_entries > interval.end && this.opts.ellipse_text)
				{
					$("<span class='pagination-break'>"+this.opts.ellipse_text+"</span>").appendTo(fragment);
				}
				begin = Math.max(np-this.opts.num_edge_entries, interval.end);
				this.appendRange(fragment, current_page, begin, np, {classes:'ep'});
				
			}
			// Generate "Next"-Link
			if(this.opts.next_text && (current_page < np-1 || this.opts.next_show_always)){
				fragment.append(this.createLink(current_page+1, current_page, {text:this.opts.next_text, classes:"next"}));
			}
			$('a', fragment).click(eventHandler);
			return fragment;
		}
	});
	// Extend jQuery
	$.fn.paginationstaff = function(maxentries, opts){
		opts = $.extend({
			items_per_page:1,//每页显示条数初始化，修改显示条数，修改这里即可 
			num_display_entries:4,//连续分页主体部分分页条目数
			current_page:0,//当前页索引 
			num_edge_entries:1,//两侧首尾分页条目数 
			link_to:"#",
			prev_text:"<i></i> <上一页",
			next_text:"下一页> <i></i>",
			ellipse_text:".....",
			prev_show_always:true,
			next_show_always:true,
			renderer:"defaultRenderer",
			show_if_single_page:true,
			load_first_page:false,
			callback:PageCallback, //PageCallback() 为翻页调用次函数。 
		},opts||{});
		function PageCallback(index, jq) { 
			InitTable(index); 
		} 
		//请求数据 
		function InitTable(pageIndex) { 
			$.ajax({ 
				type: "POST", 
				dataType: "text", 
				url:"pagingStaff.do", //提交到一般处理程序请求数据 
				data:"pageIndex=" + (pageIndex)+ "&pageSize=" + 6,/*"pageIndex=" + (pageIndex) + "&pageSize=" + pageSize*/ //提交两个参数：pageIndex(页面索引)，pageSize(显示条数) 
				success: function(data) { 
					var table = document.getElementById("list_table");//获取表格
					if(table==null ||table==""){
						alert("获取表格为空");
					}else{
						var rows = table.rows.length ;//获取表格的行数
						for(var i=rows-1;i>0;i--){
							table.deleteRow(i);

						}
					}
					var result_list = eval(data);

					$.each(result_list, function (index, item) {  
					
			             //循环获取数据    
						 var Id = result_list[index].id;  
				          var Idcard = result_list[index].idcard;  
				          var StaffName = result_list[index].staffName; 
				          var LoginName = result_list[index].loginName;  
				          var LoginPwd = result_list[index].loginPwd;  
				          var Identify = result_list[index].identify;
				    
				      	var checkBoxtd=document.createElement("input");
				      	checkBoxtd.setAttribute("id",Idcard);
						checkBoxtd.setAttribute("type","checkbox");
					
						var tdTd = document.createElement("td");
				      	tdTd.setAttribute("class","td_center");
				      	tdTd.appendChild(checkBoxtd);
						
				    	var idtd = document.createElement("td");
						var idText = document.createTextNode(Id);
						idtd.appendChild(idText);
						
						var Idcardtd = document.createElement("td");
						var IdcardText = document.createTextNode(Idcard);
						Idcardtd.appendChild(IdcardText);
						
						var staffNametd = document.createElement("td");
						var staffNameText = document.createTextNode(StaffName);
						staffNametd.appendChild(staffNameText);
						
						var LoginNametd = document.createElement("td");
						var LoginNameText = document.createTextNode(LoginName);
						LoginNametd.appendChild(LoginNameText);
						
						var LoginPwdtd = document.createElement("td");
						var LoginPwdText = document.createTextNode(LoginPwd);
						LoginPwdtd.appendChild(LoginPwdText);
						
						var IdentifyTd = document.createElement("td");
						var IdentifyText = document.createTextNode(Identify);
						IdentifyTd.appendChild(IdentifyText);
				;
						//③创建tr
						var trElement = document.createElement("tr");
						//④增加td到tr上
						trElement.appendChild(tdTd);
						trElement.appendChild(idtd);
						trElement.appendChild(Idcardtd);
						trElement.appendChild(staffNametd);
						trElement.appendChild(LoginNametd);
						trElement.appendChild(LoginPwdtd);
						trElement.appendChild(IdentifyTd);

							var operationTd = document.createElement("td");
							var aDeleteElement = document.createElement("a");
							aDeleteElement.setAttribute("href", "doDelStaff.do?id="+Id);
							var deleteText = document.createTextNode("删除   ");
							aDeleteElement.appendChild(deleteText);
							var aEditElement = document.createElement("a");
							aEditElement.setAttribute("href", "editStaff.do?id="+Id);
							aEditElement.setAttribute("target", "_blank");
							var editText = document.createTextNode("修改");
							aEditElement.appendChild(editText);
						operationTd.appendChild(aDeleteElement);
						operationTd.appendChild(aEditElement);
						trElement.appendChild(operationTd);
						
						aDeleteElement.onclick=function(){
							return delTr(aDeleteElement);
						};
						//⑤tr添加到table
						var tableElement = document.getElementById("list_table");
						tableElement.appendChild(trElement);
						//删除
						
				     }); 
				} 
			  });
	  }
		
		var containers = this,
			renderer, links, current_page;

		//goto
    $(".page-btn").one("click",function(){
    	var allPage = $(".allPage").text();
    	//console.log(allPage);
      var goPage = $(".page-go input").val() - 1; //跳转页数
      if(goPage > -1 && goPage < allPage){
				opts.current_page = goPage;
      	$("#Pagination").pagination(allPage,opts);
      }else {
      	$("#Pagination").pagination(allPage);
      }
      //清空用户跳转页数
      $(".page-go input").val("");
    });
		
		/**
		 * This is the event handling function for the pagination links. 
		 * @param {int} page_id The new page number
		 */
		function paginationClickHandler(evt){
			var links, 
				new_current_page = $(evt.target).data('page_id'),
				continuePropagation = selectPage(new_current_page);
			if (!continuePropagation) {
				evt.stopPropagation();
			}
			return continuePropagation;
		}
		
		/**
		 * This is a utility function for the internal event handlers. 
		 * It sets the new current page on the pagination container objects, 
		 * generates a new HTMl fragment for the pagination links and calls
		 * the callback function.
		 */
		function selectPage(new_current_page) {
			// update the link display of a all containers
			containers.data('current_page', new_current_page);
			links = renderer.getLinks(new_current_page, paginationClickHandler);
			containers.empty();
			links.appendTo(containers);
			// call the callback and propagate the event if it does not return false
			var continuePropagation = opts.callback(new_current_page, containers);
			return continuePropagation;
		}
		
		// -----------------------------------
		// Initialize containers
		// -----------------------------------
                current_page = parseInt(opts.current_page);
		containers.data('current_page', current_page);
		// Create a sane value for maxentries and items_per_page
		maxentries = (!maxentries || maxentries < 0)?1:maxentries;
		opts.items_per_page = (!opts.items_per_page || opts.items_per_page < 0)?1:opts.items_per_page;
		
		if(!$.PaginationRenderers[opts.renderer])
		{
			throw new ReferenceError("Pagination renderer '" + opts.renderer + "' was not found in jQuery.PaginationRenderers object.");
		}
		renderer = new $.PaginationRenderers[opts.renderer](maxentries, opts);
		
		// Attach control events to the DOM elements
		var pc = new $.PaginationCalculator(maxentries, opts);
		var np = pc.numPages();
		containers.bind('setPage', {numPages:np}, function(evt, page_id) { 
				if(page_id >= 0 && page_id < evt.data.numPages) {
					selectPage(page_id); return false;
				}
		});
		containers.bind('prevPage', function(evt){
				var current_page = $(this).data('current_page');
				if (current_page > 0) {
					selectPage(current_page - 1);
				}
				return false;
		});
		containers.bind('nextPage', {numPages:np}, function(evt){
				var current_page = $(this).data('current_page');
				if(current_page < evt.data.numPages - 1) {
					selectPage(current_page + 1);
				}
				return false;
		});
		
		// When all initialisation is done, draw the links
		links = renderer.getLinks(current_page, paginationClickHandler);
		containers.empty();
		if(np > 1 || opts.show_if_single_page) {
			links.appendTo(containers);
		}
		// call callback function
		if(opts.load_first_page) {
			opts.callback(current_page, containers);
		}
	} // End of $.fn.pagination block

	
	
	
	
})(jQuery);
