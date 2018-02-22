"use strict";




function actSubmit(oform, action, target) {
	if(!target)
		target="_self";
	  if (target) oform.attr("target", target);
	  if (action) oform.attr("action",action);
	  oform.submit();
}

function actCancel(oform, action, target) {
	if(!target)
		target="_self";
	if (target) oform.attr("target", target);
	if (action) oform.attr("action",action);
	oform.append('<input type="hidden" id="urlAction" name="urlAction"  value="cancel">');
	oform.off('submit.bv');
	oform.off("submit.validate");
	oform.submit();
}

function rayDialog(content,yes){
	 var d=dialog({
		    content: content,
		    cancel: false,
		    width: '20em',
		    button: [
		    	{
	            value: '确定',
	            callback: function () {
	            	if(yes&&typeof yes == "function"){
	            		yes.call();
	            	}
		    	}
		    	}/*,
		    	{
	            value: '取消'
		    	}*/
		    ]
	});
	 d.showModal();
	return true;
};
function rayDialogConfirm(content,yes,no){
	var result=false;
	var d=dialog({
		content: content,
		width: '20em',
		autofocus: true,
		 button: [
		        {
		            value: '同意',
		            callback: function () {
		            	 result=true;
		    			 return true;
		            },
		            autofocus: true
		        },
		        {
		            value: '取消',
		            callback: function () {
		            	result=false;
		   			 	return true;
		            }
		        }
		    ]
	});
	d.showModal();
	
	d.addEventListener('close', function () {
	    if(result){
	    	if(yes&&typeof yes == "function")
				yes.call();
	    	}else if(no&&typeof no == "function"){
	    		no.call();
	    	}
	});
};

//显示图片
function fncRaycomShowImg(attachId){
	var iWidth=800; //弹出窗口的宽度;
	var iHeight=600; //弹出窗口的高度;
	var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
	var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	window.open (ctx+ "/imgShow?attachId="+attachId, 'newwindow', "height="+iHeight+", width="+iWidth+", top="+iTop+", left="+iLeft+"toolbar =no, menubar=no, scrollbars=no, resizable=yes, location=yes, status=no")
}