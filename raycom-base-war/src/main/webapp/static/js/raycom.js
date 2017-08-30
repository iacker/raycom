"use strict";


var browserVersion = window.navigator.userAgent.toUpperCase();
var isOpera = browserVersion.indexOf("OPERA") > -1 ? true : false;
var isFireFox = browserVersion.indexOf("FIREFOX") > -1 ? true : false;
var isChrome = browserVersion.indexOf("CHROME") > -1 ? true : false;
var isSafari = browserVersion.indexOf("SAFARI") > -1 ? true : false;
var isIE = (!!window.ActiveXObject || "ActiveXObject" in window);
var isIE9More = (! -[1, ] == false);
var pre_height,timer,pre_conent_height;
var openFlag=0;//0：初始状态，N不执行，Y:执行
function reinitIframe() {
	var iframe = document.getElementById('mainFrame');
    var subWeb = document.frames ? document.frames["mainFrame"].document : iframe.contentDocument;   
    var pre_conent_height = $(subWeb).find("#content").height();
    
    if(pre_conent_height<($(window).height()-60)){
    	$(subWeb).find("#content").css("min-height",$(window).height()-60);
    }
}

function getHeight(iframe){
	   var bHeight = 0;
    if (isChrome == false && isSafari == false)
        bHeight = iframe.contentWindow.document.body.scrollHeight;

    var dHeight = 0;
    if (isFireFox == true)
        dHeight = iframe.contentWindow.document.documentElement.offsetHeight + 2;
    else if (isIE == false && isOpera == false)
        dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
    else if (isIE == true && isIE9More) {//ie9+
        var heightDeviation = bHeight - eval("window.IE9MoreRealHeight" + iframeId);
        if (heightDeviation == 0) {
            bHeight += 3;
        } else if (heightDeviation != 3) {
            eval("window.IE9MoreRealHeight" + iframeId + "=" + bHeight);
            bHeight += 3;
        }
    }
    else//ie[6-8]、OPERA
        bHeight += 3;
    
    return Math.max(bHeight, dHeight);
}



$(document).ready(function () {
	
	
	$('body').on('click', '.show-sidebar', function (e) {
		e.preventDefault();
		$('div#main',window.parent.document).toggleClass('sidebar-show');
	});
	
	var height = window.innerHeight - 49;
	$('#content').on('click', '.expand-link', function (e) {
			var body = $('body');
			e.preventDefault();
			var box = $(this).closest('div.box');
			var button = $(this).find('i');
			button.toggleClass('fa-expand').toggleClass('fa-compress');
			box.toggleClass('expanded');
			body.toggleClass('body-expanded');
			if(openFlag!=0){//第二次执行，标志恢复为初始值
				if(openFlag=='Y')
				$(".show-sidebar").click();
				openFlag=0;
			}else if(!($('div#main',window.parent.document).hasClass("sidebar-show"))){
				$(".show-sidebar").click();
				openFlag='Y';
			}else{//边框已经处于隐藏状态，则不进行操作
				openFlag='N';
			}
			var timeout = 0;
			if (body.hasClass('body-expanded')) {
				timeout = 100;
			}
			setTimeout(function () {
				box.toggleClass('expanded-padding');
			}, timeout);
			setTimeout(function () {
				box.resize();
				box.find('[id^=map-]').resize();
			}, timeout + 50);
		})
		.on('click', '.collapse-link', function (e) {
			e.preventDefault();
			var box = $(this).closest('div.box');
			var button = $(this).find('i');
			var content = box.find('div.box-content');
			content.slideToggle('fast');
			button.toggleClass('fa-chevron-up').toggleClass('fa-chevron-down');
			setTimeout(function () {
				box.resize();
				box.find('[id^=map-]').resize();
			}, 50);
		})
		.on('click', '.close-link', function (e) {
			e.preventDefault();
			var content = $(this).closest('div.box');
			content.remove();
		});
	
});


function setWinMoved(){
	$( "div.box").not('.no-drop')
		.draggable({
			revert: true,
			zIndex: 2000,
			cursor: "crosshair",
			handle: '.box-name',
			opacity: 0.8
		})
		.droppable({
			tolerance: 'pointer',
			drop: function( event, ui ) {
				var draggable = ui.draggable;
				var droppable = $(this);
				var dragPos = draggable.position();
				var dropPos = droppable.position();
				draggable.swap(droppable);
				setTimeout(function() {
					var dropmap = droppable.find('[id^=map-]');
					var dragmap = draggable.find('[id^=map-]');
					if (dragmap.length > 0 || dropmap.length > 0){
						dragmap.resize();
						dropmap.resize();
					}
					else {
						draggable.resize();
						droppable.resize();
					}
				}, 50);
				setTimeout(function() {
					draggable.find('[id^=map-]').resize();
					droppable.find('[id^=map-]').resize();
				}, 250);
			}
		});
}

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
	oform.off('submit.bv').submit()
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