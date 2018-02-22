$.extend( true, $.fn.dataTable.defaults, {
	sDom: "rt<'table-footer'<'col-sm-2'i><'col-sm-8  text-center'p><'col-sm-2  text-right'l><'clearfix'>>",
	searching: false,
    ordering: false,
	language: {
        "lengthMenu": "_MENU_ 条记录每页",
        "zeroRecords": "没有找到记录",
        "info": "第 _PAGE_ 页 ( 总共 _PAGES_ 页 )",
        "infoEmpty": "无记录",
        "emptyTable": "没有找到记录",
        "infoFiltered": "(从 _MAX_ 条记录过滤)",
        "paginate": {
            "previous": "上一页",
            "next": "下一页",
            "first": "首页",
            "last": "尾页"
        }
    },
    "pagingType": "full_numbers",
    pageLength: 10,
    rowReorder: true,
    autoFill: true,
    serverSide: true,
	deferLoading:null,
	fixedHeader: true,
	fixedColumns: true,
	scrollCollapse: true,
	scrollY: 390,
	scrollX:true,
    processing: true
} );

;(function($, window, document,undefined) {
    //定义Beautifier的构造函数
    var RayTable = function(ele, formId,settings) {
		this.$element = ele,
		this.$formId = formId,
		this.defaults = {
			isDtRealQuest :false,
			ajax: {
					url: ctx+$('#'+formId ).attr("action"),
					type: "POST",
					data: function ( d ) {
						$("#"+formId+" :input").each(function(index,ele){
							if($(ele).data("query")=='yes'){
								d[$(ele).attr('id')] = $(ele).val();
							}
						});
						$("#"+formId+" select").each(function(index,ele){
						if($(ele).data("query")=='yes'){
							 var val=$(ele).val();
							 if($.isArray($(ele).val())){
								val = $(ele).val().join(",") 
							 }
							 d[$(ele).attr('id')] = val;
						 }
						});
					}
				},
				fixedColumns: {
				  leftColumns:settings.leftColumns?settings.leftColumns:0,
				  rightColumns: settings.rightColumns?settings.rightColumns:1
				}
			},
		this.options = $.extend(true,{}, this.defaults, settings ),
		
		this.init=function(rayTable){
			this.options.columns=this.getColomun(this.$element);
			this.options.columnDefs=this.getColomunDefs(settings["columnDef"]);
			var $rayTable = this;
			this.$element.on( 'preXhr.dt', function ( e, settings, data ) {
				   data.isDtRealQuest = $rayTable.options.isDtRealQuest;
			});
			this.$element.on( 'xhr.dt', function ( e, settings, data ) {
				isDtRealQuest  = true;
			});
			
			this.$element.on( 'init.dt', function (e, settings, data) {
				for(var key in data.sessionRdata){  
					if("drawstartlengthsearch[value]search[regex]currentUser".indexOf(key)<0&&key.indexOf("columns")<0){
						if($('#'+key).is('input')){
							$('#'+key).val(data.sessionRdata[key]);
						}
						if($('#'+key).is('select')){
							if($('#'+key).attr('class').indexOf("select2")>-1){
								$('#'+key).select2("val",data.sessionRdata[key].split(","));
							}else{
								$('#'+key).val(data.sessionRdata[key]);
							}
						}
					}
				} 
			});
			return this.$element.DataTable(this.options);
		},
		
		this.getColomun=function(){
			var jsonarray = eval('([])');
			var arr="";
			var i=0;
			this.$element.find("th").each(function(index,ele){
				if($(ele).data("column")&&$(ele).data("column")!=''){
					arr={
						"data": $(ele).data("column")=='op'?null:$(ele).data("column"),
						"defaultContent": '',
						"inx" : $(ele).data("inx")?$(ele).data("inx"):i++
					};
					jsonarray.push(arr);
				}
			});
			return jsonarray.sort(sortIndex);
		},	 
		this.getColomunDefs=function(columnDef){
			iconClass={
					"del":"Hui-iconfont Hui-iconfont-del3",
					"detail":"Hui-iconfont Hui-iconfont-order",
					"save":"Hui-iconfont save",
					"history":"faHui-iconfont Hui-iconfont-yulan",
					"edit":"Hui-iconfont Hui-iconfont-shuru"
				};
			if(!columnDef)
				columnDef = [];
			var item;
			this.$element.find("th").each(function(index,ele){
				if($(ele).data("method")||$(ele).data("columndefs")){
					var arr =eval($(ele).data("method"));
					if(arr.length>0){
						item ={targets: arr[0].targets,
								render:function(data, type, row) {
									var context = "";
									for ( var fnc in arr) {
									if(arr[fnc].htmlAppend){
											var paramsItem =arr[fnc].params.split(","); 
											for (i=0;i<paramsItem.length;i++ ){ 
												context += arr[fnc].htmlAppend.replace(new RegExp(paramsItem[i],'gm') ,row[paramsItem[i]]);
											} 
										}else if(arr[fnc].fncName){
											if(!arr[fnc].icon){
												arr[fnc].icon="detail"
											}
											context+= "<a href=\"javascript:;\" style=\"padding-left: 7px;\"  onclick=\""+arr[fnc].fncName+"(";
											if(arr[fnc].params){
												var paramsAry = (arr[fnc].params).split(',');
												for (var i = 0; i < paramsAry.length; i++) {
													if(i==0)
														context+="'"+row[paramsAry[i]]+"'";
													else
														context+=",'"+row[paramsAry[i]]+"'";
												}
											}
											context+=")\" title=\""+arr[fnc].title+"\" ><i class=\""+iconClass[arr[fnc].icon]+"\" ></i></a>";
										}
									}
									return context;
								}
						}	

						if(arr[0].className)
							item["className"]= arr[0].className;
						if(arr[0].visible)
							item["visible"]= arr[0].visible;
						
						columnDef.push(item);
					}//end if length
				}//end if menthod
			});
			return columnDef;
		}
		
		function sortIndex(x, y) {
			return (x.inx < y.inx) ? -1 : 1;
		}
		
		function isJson(obj){
			var isjson = typeof(obj) == "object" && Object.prototype.toString.call(obj).toLowerCase() == "[object object]" && !obj.length; 
			return isjson;
		}
    }
	
    $.fn.raytable = function(formId,settings) {
    	if(!settings)settings={};
        return new RayTable(this, formId,settings).init();
    }
    $.fn.raytableDefault = function(formId) {
    	settings={rightColumns:-1};
    	return new RayTable(this, formId,settings).init();
    }
    //loading:false时进入页面不加载数据
    //不推荐使用，为了保持向后兼容，保留
	$.fn.raySimpleTable=function(formId,columnDef,loading){
		return this.raytable(formId,{columnDef:columnDef,loading:loading,isDtRealQuest:true});
	}


})(jQuery, window, document);

