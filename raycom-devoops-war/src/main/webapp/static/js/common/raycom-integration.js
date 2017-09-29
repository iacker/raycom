"use strict";
//DataTable js

var raycom ={
		notifyMsg: function (body,url,menuClickId) {
	        if (!("Notification" in window)) {
	            return false;
	        }

	        var initNogification = function (url,body,menuClickId) {
	            var notification = new Notification("消息通知", {
	                body:body
	            });
	            notification.onclick = notification.onerror = function () {
	            	if($("#initNogificationHref"))
	            		$("#initNogificationHref").remove();
	            	if(url){
	            		$('<a href="'+url+'" class="modal-link" id="initNogificationHref" target="mainFrame"><span id="initNogificationTitle">跳转</span>').appendTo('body');
		                if(menuClickId)
		                	$.get(ctx + "/main/menuId/record", {menuClickId:menuClickId},function(){},"json");
		            	$("#initNogificationTitle").click();
	            	}
	                
	            };
	        };

	        if (Notification.permission === "granted") {
	            initNogification(url,body,menuClickId);
	        }

	        else if (Notification.permission !== 'denied') {
	            Notification.requestPermission(function (permission) {
	                if (permission === "granted") {
	                    initNogification(url,body,menuClickId);
	                }
	            });
	        }
	    }
};

function isJson(obj){
	var isjson = typeof(obj) == "object" && Object.prototype.toString.call(obj).toLowerCase() == "[object object]" && !obj.length; 
	return isjson;
	}

$.fn.raySimpleTable=function(formId,columnDef,loading){
	return this.raytable(formId,{columnDef:columnDef,loading:loading,saveRealQuest:true});
}

$.fn.raytable=function(formId){
	settings={};
	
	return this.raytable(formId,settings);
} 
/**
 * columnDef,loading,saveRealQuest
 */
$.fn.raytable=function(formId,settings){
	if(!isJson(settings))
		settings={};
	var isDtRealQuest = false;
	if(settings.saveRealQuest&&settings["saveRealQuest"])
		isDtRealQuest = settings["saveRealQuest"];
	this.on( 'preXhr.dt', function ( e, settings, data ) {
		   data.isDtRealQuest = isDtRealQuest;
		} );
	this.on( 'xhr.dt', function ( e, settings, data ) {
		isDtRealQuest  = true;
	} );
	this.on( 'init.dt', function (e, settings, data  ) {
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
	return this.DataTable({
      ajax: {
          url: ctx+$('#'+formId).attr("action"),
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
      deferLoading:settings.loading?settings["loading"]:null,
      columns:getColomun(this),
      fixedColumns: {
    	  leftColumns:settings.leftColumns?settings["leftColumns"]:0,
          rightColumns: settings.rightColumns?settings["rightColumns"]:1
      },
      scrollY: settings.scrollY?settings["scrollY"]:390,
      scrollX: settings.scrollX?settings["scrollX"]:true,
      fixedHeader: settings.fixedHeader?settings["fixedHeader"]:true,
      columnDefs: getColomunDefs(this,settings["columnDef"])
  });
}

function sortIndex(x, y) {
    return (x.inx < y.inx) ? -1 : 1

}
//表头
function getColomun(oTb){
	  var jsonarray = eval('([])');
	  var arr="";
	  var i=0;
	  oTb.find("th").each(function(index,ele){
		 if($(ele).data("column")&&$(ele).data("column")!=''&&$(ele).data("column")!='op'){
			 arr ={"data":$(ele).data("column"),"inx":$(ele).data("inx")?$(ele).data("inx"):i++};
			 jsonarray.push(arr);
		 }
	     else if($(ele).data("column")=='op'){
	     	 arr ={"data":null,"defaultContent": '',"inx":$(ele).data("inx")?$(ele).data("inx"):i++};
	    	 jsonarray.push(arr);
	     }
	  });
		 return jsonarray.sort(sortIndex);
};
//按钮
function getColomunDefs(oTb,columnDef){
	var iconClass={
		"del":"fa fa-trash-o",
		"detail":"fa fa-file-text-o",
		"save":"fa fa-save (alias)",
		"history":"fa fa-clock-o",
		"edit":"fa fa-file-text-o"
	};
	if(!columnDef)
		columnDef = [];
	var item;
	oTb.find("th").each(function(index,ele){
		if($(ele).data("method")){
			var arr =eval($(ele).data("method"));
			if(arr.length>0){
				item= {targets: arr[0].targets,
						render: function (data, type, row) {
							var context = "";
							for ( var fnc in arr) {
								if(arr[fnc].htmlAppend){
									var htmlAppend = arr[fnc].htmlAppend;
									if(arr[fnc].replace){
										var paramsItem =arr[fnc].params.split(","); 
										for (i=0;i<paramsItem.length ;i++ ){ 
										 htmlAppend = htmlAppend.replace(new RegExp(paramsItem[i],'gm') ,row[paramsItem[i]]);
										} 
									}else if(arr[fnc].params){
										htmlAppend = htmlAppend.replace('>' ," value='"+row[arr[fnc].params]+"'>");
									}
									context +=htmlAppend;
								}else{
									if(!arr[fnc].icon){
										arr[fnc].icon="detail"
									}
									context+= "<a href=\"javascript:;\" style=\"padding-left: 7px;\"  " ;
									if(arr[fnc].fncName)
										context+=" onclick=\""+arr[fnc].fncName+"(";
									if(arr[fnc].params){
										var paramsAry = (arr[fnc].params).split(',');
										for (var i = 0; i < paramsAry.length; i++) {
											if(i==0)
												context+="'"+row[paramsAry[i]]+"'";
											else
												context+=",'"+row[paramsAry[i]]+"'";
										}
									}
										context+=")\"";
									context+=" title=\""+arr[fnc].title+"\" ><i class=\""+iconClass[arr[fnc].icon]+"\" ></i></a>";
								}
							}
							return context;
						}
				}	
				//columnDef.push(item);
				if(arr[0].className)
					item["className"]= arr[0].className;
				columnDef.push(item);
			}//end if length
		}//end if menthod
		
		if($(ele).data("columndefs")){
			var arr =eval($(ele).data("columndefs"));
			if(arr.length>0){
				item= {"targets": arr[0].targets}				  
				if(arr[0].className)
					item["className"]= arr[0].className;
				if(arr[0].visible)
					item["visible"]= arr[0].visible;
				columnDef.push(item);
			}//end if length
		}//end if columnDefs
		
	});
	return columnDef;
};

$.fn.rayDatePicker=function(){
	return this.datepicker({dateFormat: 'yy-mm-dd', changeYear: true,          // 年下拉菜单  
	         changeMonth: true,             // 月下拉菜单  
	         showButtonPanel: true,         // 显示按钮面板  
	         showMonthAfterYear: true,  // 月份显示在年后面  
	         currentText: "今日",         // 当前日期按钮提示文字  
	         closeText: "清空"}); 
}; 
$.fn.rayfileupload=function(attchId,callback,eventFired){
	return this.fileupload({
	    multipart: true,
	    url: ctx+"/file/upload",
	    add: function (e, data) {
	    	if(eventFired)
	    		data.formData = {eventFired: eventFired};
	      	data.submit();
	    },
	    done: function (e, data) {
	    	if(data.result.error!=""){
	    		rayDialog(data.result.error)
	   	 	}else{
	   	 		$('#'+attchId).val(data.result.fileId);
	   	 		$('#'+attchId).next("#uploadContent").remove();
	   	 		$('#'+attchId).after('<div id="uploadContent"><a href="'+ ctx+'/file/download?fileId='+data.result.fileId+'" target="_blank">'+data.files[0].name+'</a></div>');
	   	 	 if(typeof callback == "function")  callback();
	   	 	}
	    },
	    fail: function (e, data) {
	    }
	}).on('fileuploadprocessalways', function (e, data) {
	    var currentFile = data.files[data.index];
	    if (data.files.error && currentFile.error) {
	        rayDialog(currentFile.error);
	    }
	}); 
}; 

$.fn.materialCategoryRadioTree=function(data){
	data.url = "/popup/materialCategoryPopup";
	window.treeLvl = 6;
	this.radioTree(data);
}
$.fn.materialCategory10RadioTree=function(data){
	data.url = "/popup/materialCategory10Popup";
	this.radioTree(data);
}

$.fn.orgRadioTree=function(data){
	data.url = "/popup/orgPopup";
	this.radioTree(data);
}

$.fn.radioTree=function(data){
	var selectedValue=data.values;
	var id=data.id;
	var name=data.name?data.name:this[0].id;
	var url=data.url;
	window.selectedValue = selectedValue;
	window.dataUrl = url;
	var treeLvl="";
	if(window.treeLvl) 
		treeLvl = window.treeLvl;
	this.on('click', function () {
		if(window.treeLvl&&treeLvl!=window.treeLvl){
			treeLvl =window.treeLvl;
			popup.remove();
		}
		window.popup =dialog({
			id: id+'-dialog',
			align: 'bottom left',
		    width: 400,
		    height: 400,
		    padding: 0, 
			url: ctx+'/popup/radio',
			quickClose: true,
			onshow: function () { 
			},
			oniframeload: function () {
			},
			onclose: function () {
				if (this.returnValue) {
					$('#'+name).val(this.returnValue.name);
					$('#'+id).val(this.returnValue.id);
					window.selectedValue = this.returnValue.id;
				}
			},
			onremove: function () {
			}
		});
		popup.show(this);
	});
}; 

$.fn.raymultiplefileUpload=function(fileList){
	return this.fileinput({
	     	language: 'zh', 
			'theme': 'explorer',
			uploadAsync:true,
			browseClass:"btn btn-primary btn-xs",
			removeClass:"btn btn-default btn-xs",
			uploadClass:"btn btn-default btn-xs",
			cancelClass:"btn btn-default btn-xs",
			uploadUrl: ctx+"/file/upload", 
        }).on("filebatchselected", function(event, files) {
            $(this).fileinput("upload");
        }).on('fileuploaded', function(event, data, previewId, index) {
        	fileList.push({ fileId: data.response.fileId, KeyID: previewId })
	    }).on("filesuccessremove", function (event, data, previewId, index) { 
	    	 for (var i = 0; i < fileList.length; i++) { 
	    	      if (fileList[i].KeyID== data) { 
	    	    	  fileList.splice(i,1);
		    	      return;
	    	      } 
	    	   }
		}).on('fileclear', function(event) {	
			fileList.length = 0;
		});
}; 