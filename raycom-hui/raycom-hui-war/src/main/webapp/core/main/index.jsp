<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ include file="/core/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>${fns:getConfig('productName')}</title>
<%@include file="/core/include/head.jsp" %>	
</head>
<body>
<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl">
			<a class="logo navbar-logo f-l mr-10 hidden-xs" href="${ctx}">${fns:getConfig('productName')}</a> 
			<a class="logo navbar-logo-m f-l mr-10 visible-xs" href="${ctx}">${fns:getConfig('productName')}</a> 
			<nav class="nav navbar-nav">
				<ul class="cl">
					<!-- <li class="dropDown dropDown_hover"><a href="javascript:;" class="dropDown_A"><i class="Hui-iconfont">&#xe600;</i> 新增 <i class="Hui-iconfont">&#xe6d5;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="javascript:;" onclick="article_add('添加资讯','article-add.html')"><i class="Hui-iconfont">&#xe616;</i> 资讯</a></li>
							<li><a href="javascript:;" onclick="picture_add('添加资讯','picture-add.html')"><i class="Hui-iconfont">&#xe613;</i> 图片</a></li>
							<li><a href="javascript:;" onclick="product_add('添加资讯','product-add.html')"><i class="Hui-iconfont">&#xe620;</i> 产品</a></li>
							<li><a href="javascript:;" onclick="member_add('添加用户','member-add.html','','510')"><i class="Hui-iconfont">&#xe60d;</i> 用户</a></li>
						</ul>
					</li> -->
					<rt:topMenu/>
			</ul>
		</nav>
		<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
			<ul class="cl">
				<li>${fns:getUser().roleNames}</li>
				<li class="dropDown dropDown_hover">
					<a href="#" class="dropDown_A">${fns:getUser().name} <i class="Hui-iconfont">&#xe6d5;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="javascript:;" onClick="myselfinfo()">个人信息</a></li>
						<li><a href="${ctx}/user/updatePwd">修改密码</a></li>
						<li><a href="${ctx}/logout">退出</a></li>
				</ul>
			</li>
				<li id="Hui-msg"> <a href="${ctx}/toDo" title="待办事项"><span class="badge badge-danger">1</span><i class="Hui-iconfont" style="font-size:18px">&#xe68a;</i></a> </li>
				<li id="Hui-skin" class="dropDown right dropDown_hover"> <a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
						<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
						<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
						<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
						<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
						<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
					</ul>
				</li>
			</ul>
		</nav>
	</div>
</div>
</header>
<aside class="Hui-aside">
	<rt:menu/>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<li class="active">
					<span title="我的桌面" data-href="welcome.html">我的桌面</span>
					<em></em>
				</li>
			</ul>
		</div>
		<div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
	</div>
	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
			<div style="display:none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" src=""></iframe>
		</div>
	</div>
</section>
<div class="contextMenu" id="Huiadminmenu">
	<ul>
		<li id="closethis">关闭当前 </li>
		<li id="closeall">关闭全部 </li>
	</ul>
</div>
<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${ctxStatic}/plugins/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
<script type="text/javascript">
$(function(){
	$("body").Huitab({
		tabBar:".navbar-wrapper .navbar-levelone",
		tabCon:".Hui-aside .menu_dropdown",
		className:"current",
		index:0,
	});
});

function product_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*用户-添加*/
function member_add(title,url,w,h){
	layer_show(title,url,w,h);
}
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
</body>
</html>