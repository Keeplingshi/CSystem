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
	$.fn.paginationAdmin = function(maxentries, opts){
		// Initialize options with default values
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
			document.getElementById("nowRecord").innerText = pageIndex+1;
			$.ajax({ 
				type: "POST", 
				dataType: "text", 
				url:"paging.do?flag=admin",//提交到一般处理程序请求数据 
				data:"pageIndex=" + (pageIndex)+ "&pageSize=" + 6,/*"pageIndex=" + (pageIndex) + "&pageSize=" + pageSize*/ //提交两个参数：pageIndex(页面索引)，pageSize(显示条数) 
				success: function(data) { 
					var table = document.getElementById("table_1");//获取表格
					if(table==null ||table==""){
						alert("获取表格为空");
					}else{
						var rows = table.rows.length ;//获取表格的行数
						for(var i=rows-1;i>0;i--){
							table.deleteRow(i);

						}
					}
					var result = eval(data);

					$.each(result, function (index, item) {  
			             //循环获取数据    
						 var ID = result[index].id;  
			              var idcard = result[index].idcard;  
			              var name = result[index].name; 
			              var birthday = result[index].birthday;  
			              var day = result[index].day;
			              var workPlace = result[index].workPalce;
			                var  birthPalce= result[index].birthPalce;
         var degree_education = result[index].degreeEducation;

         if(result[index].degreeEducation=="1"){
	  			degree_education = "博士";
         }else if(result[index].degreeEducation=="2"){
       	  degree_education = "硕士";
	      }else if(result[index].degreeEducation=="3"){
	  			degree_education = "本科";  
		  }else if(result[index].degreeEducation=="4"){
				degree_education = "其他";
			}
    
         var nation = result[index].nation;
         var sex = null;
       
         if(result[index].sex == "true"){
       	  sex = "女";  
         }else{
       	  sex = "男";  
         }
        /* var sex = result_list[index].sex;*/
         var politics_status = result[index].politicsStatus;
         var is_CriminalRecord = null;
         if(result[index].isCriminalRecord == "true"){
       	  is_CriminalRecord = "有前科";
         }else{
       	  is_CriminalRecord = "没有前科";
         }
         
         var charge = result[index].charge;
         var charge_main = result[index].chargeMain;
         var charge_next = result[index].chargeNext;
         var victim_name = result[index].victimName;
         var Sue_name = result[index].sueName;
         var native_palace = result[index].nativePalace;
         var Sue_phone = result[index].suePhone;
         var charge_familyName = result[index].chargeFamilyName;
         var charge_familyPhone = result[index].chargeFamilyPhone;
         var state = null;  
         if(result[index].state == "true"){
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

		var detailElement = document.createElement("a");
		detailElement.setAttribute("href", "detailCR.do?CRid="+ID);
		detailElement.setAttribute("target", "_blank");
		var detailText = document.createTextNode("详情 |");
		detailElement.appendChild(detailText);
		
		var statetd = document.createElement("td");
		var stateText = document.createTextNode(state);
		statetd.appendChild(stateText);
		var operationTd = document.createElement("td");
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
