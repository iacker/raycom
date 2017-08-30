<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ include file="/core/include/taglib.jsp"%>

<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>${fns:getConfig('productName')}</title>
<%@include file="/core/include/head.jsp" %>	
 <script src="http://cdn.sockjs.org/sockjs-0.3.min.js"></script>
<style type="text/css">
	#timeShow{
 		font-size: 16px;
		color:#525252;
		font-family:Comic Sans MS;
	}
</style>
</head>
<body>
 	<%
      Calendar rightNow = Calendar.getInstance();
	  SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	%>
<script type="text/javascript">

	//views/pda/msgNogification
	function connect() {
		url = 'ws://' + window.location.host +ctx+ "/notifyMsg";
	    ws = new WebSocket(url);
	    ws.onmessage = function (event) {
	    	var msg = $.parseJSON(event.data);
	    	if(msg.type=="todo")
	    		$('#todo').text(msg.content);
	    	if(msg.type=="example")
	    		//raycom.notifyMsg(event.data.content,'${ctx}/myMenu','1000002');
	    		raycom.notifyMsg(JSON.stringify(msg.content));
	    };
	}
	
	$(document).ready(function () {
		$('.dropdown:has(li:has(a.active)) > a').addClass('active-parent active');
		$('.dropdown:has(li:has(a.active)) > ul').css("display", "block");
		getTime();
		connect();
		
		$("#sidebar-left").mCustomScrollbar({
					setHeight:300,
					theme:"light-thick"
				});
 
		$('#mainFrame').css('height', $(window).height()-55);
		$('#sidebar-left').css('height', $(window).height()-55);
		$('#main').css('min-height', $(window).height()-55);
		$('.main-menu').on('click', 'a', function (e) {
			var parents = $(this).parents('li');
			var li = $(this).closest('li.dropdown');
			var another_items = $('.main-menu li').not(parents);
			another_items.find('a').removeClass('active');
			another_items.find('a').removeClass('active-parent');
			if ($(this).hasClass('dropdown-toggle') || $(this).closest('li').find('ul').length == 0) {
				$(this).addClass('active-parent');
				var current = $(this).next();
				if (current.is(':visible')) {
					li.find("ul.dropdown-menu").slideUp('fast');
					li.find("ul.dropdown-menu a").removeClass('active')
				}
				else {
					another_items.find("ul.dropdown-menu").slideUp('fast');
					current.slideDown('fast');
				}
			}else {
				if (li.find('a.dropdown-toggle').hasClass('active-parent')) {
					var pre = $(this).closest('ul.dropdown-menu');
					pre.find("li.dropdown").not($(this).closest('li')).find('ul.dropdown-menu').slideUp('fast');
				}
			}
			if ($(this).hasClass('active') == false) {
				$(this).parents("ul.dropdown-menu").find('a').removeClass('active');
				$(this).addClass('active')
			}
			if ($(this).hasClass('ajax-link')) {
				if ($(this).hasClass('add-full')) {
					$('#content').addClass('full-content');
				}
				else {
					$('#content').removeClass('full-content');
				}
			}
			if ($(this).attr('href') == '#') {
				//reinitIframe();
				e.preventDefault();
			}else{
				$.get(ctx + "/main/menuId/record", {menuClickId:this.id},function(){},"json");
			}
			$('#mainFrame').css('height', $(window).height()-55);
			//$('#content').css('height', $(window).height()-55);
		});
	});
	
	var  t = new Date(<%=new java.util.Date().getTime()%>);
	
	function getTime(){
	  	t.setSeconds(t.getSeconds()+1); 
	  	var time="";
	  	var dd="";
	  	year=t.getFullYear();
	  	moon=t.getMonth()+1;
	  	date=t.getDate();
	  	day=t.getDay();
	  	h=t.getHours();
	  	m=t.getMinutes();
	  	s=t.getSeconds();
	  
	  	switch(day){
	      	case 1:dd="Mon"; break;
	      	case 2:dd="Tue"; break;
	      	case 3:dd="Wed"; break;
	      	case 4:dd="Thu"; break;
	      	case 5:dd="Fri"; break;
	      	case 6:dd="Sat"; break;
	      	case 7:dd="Sun"; break;
 	 	}
	  
	  	if(h < 10){
			time += "0" + h;
		}else{
			time += h;
		}
		time += ":";
		if(m < 10){
			time += "0" + m;
		}else{
			time += m;
		}
		time += ":";
		if(s < 10){
			time += "0" + s;
		}else{
			time += s;
		}
	 	document.getElementById("timeShow").innerHTML=year+"-"+moon+"-"+date+"&nbsp;"+dd+"&nbsp;&nbsp;"+time + "&nbsp;&nbsp;";
	}
	
	setInterval("getTime()",1000);
	  
	//自定义菜单快捷键
	function menu(){
		$.ajax({
			type : "POST",
			url :ctx+"/myMenu/myMenuList",
			success : function(data) {
				$("#id1").empty();
				tHtml = "<li><a href='${ctx}/myMenu' class='ajax-link' target='mainFrame'><i class='fa fa-plus'></i><span>快捷菜单</span></a></li>";
				for(var i=0;i<data.length;i++){
					tHtml+= "<li>"+
					           "<a href='${ctx}"+data[i].href+"' class='ajax-link' target='mainFrame'>"+
					              "<i class='fa fa-paperclip'></i>"+
					              "<span>"+data[i].menuName+"</span>"+
					           "</a>"+
					         "</li>";
				}
				$("#id1").append(tHtml); 
				
			}
		});
	} 
	
</script>
<header class="navbar">
	<div class="container-fluid expanded-panel">
		<div class="row">
			<div id="logo" class="col-xs-12 col-sm-4">
				<a href="${ctx}">${fns:getConfig('productName')}</a>
			</div>
			<div id="top-panel" class="col-xs-12 col-sm-8">
				<div class="row">
					<div class="col-xs-8 col-sm-2">
					</div>
					<div class="col-xs-4 col-sm-10 top-panel-right">
						<!-- <a href="#" class="about">about</a> 导航条加连接示例 -->
						<ul class="nav navbar-nav pull-right panel-menu">
							<!-- 时间图标 -->
							<li class="hidden-xs">
								<i class="fa fa-clock-o"></i>
								<span id="timeShow"></span>
							</li>
							<!-- 待办事项图标 -->
							<li class="hidden-xs">
								<a href="${ctx}/toDo" class="modal-link" target="mainFrame">
									<i class="fa fa-tasks"></i>
									<span id="todo" class="badge"></span>
								</a>
							</li>
							<!-- 公告图标 -->
							<li class="hidden-xs">
								<a href="${ctx}/notice" class="modal-link" target="mainFrame">
									<i class="fa fa-bell"></i>
								</a>
							</li>
							<!-- 修改密码 -->
							<li>
								<a href="${ctx}/user/updatePwd" class="modal-link" target="mainFrame">
									<i class="fa fa-key"></i>
									<!-- <span>修改密码</span> -->
								</a>
							</li>
							<!-- 退出图标 -->
							<li class="hidden-xs">
								<a href="${ctx}/logout">
									<i class="fa fa-power-off"></i>
									<!-- <span>退出</span> -->
								</a>
							</li>
							<li class="dropdown">
								<a href="javascript:void(0);" onclick="menu()" class="dropdown-toggle account" data-toggle="dropdown" >
									<i class="fa fa-angle-down pull-right"></i>
									<div class="user-mini pull-right">
										<span>${fns:getUser().roleNames}</span>
										<span>${fns:getUser().name}</span>
									</div>
								</a>
								<ul class="dropdown-menu" id="id1">
									
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>
<!--End Header-->
<!--Start Container-->
<div id="main" class="container-fluid">
	<div class="row">
		<div id="sidebar-left" class="col-xs-2 col-sm-2" style="OVERFLOW-Y: auto; OVERFLOW-X:hidden;">
			<ul class="nav main-menu"><rt:menu/></ul>
		</div>
		<!--Start Content id="content"-->
		<div id="content"  class="col-xs-12 col-sm-10 contet-width" style="padding-left: 0px; padding-right: 0px;  ">
			<iframe id="mainFrame" name="mainFrame" src="${ctx}/chart"   width="100%" onload="reinitIframe()" ></iframe>
		</div>
	</div>
</div>
</body>
</html>
