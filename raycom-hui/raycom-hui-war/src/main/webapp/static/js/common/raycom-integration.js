"use strict";
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