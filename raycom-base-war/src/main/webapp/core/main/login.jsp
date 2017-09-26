<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/core/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>${fns:getConfig('productName')}</title>
<meta name=”renderer” content=”webkit” /> 
<style>
	body{
		PADDING-BOTTOM: 0px; 
		MARGIN: 0px; 
		PADDING-LEFT: 0px; 
		PADDING-RIGHT: 0px; 
		FONT-FAMILY: "Arial"; 
		BACKGROUND: url(${ctxStatic}/img/bg-loginbody.png) #3c3c3c; 
		COLOR: #222; 
		FONT-SIZE: 13px; 
		PADDING-TOP: 0px
	}
	.hide{DISPLAY: none}
	IMG{BORDER-BOTTOM: 0px; BORDER-LEFT: 0px; BORDER-TOP: 0px; BORDER-RIGHT: 0px}
	#logo{TEXT-ALIGN: center; PADDING-BOTTOM: 10px; MARGIN: 80px auto 0px; WIDTH: 247px}
	#login{BACKGROUND-IMAGE: url(${ctxStatic}/img/bg-login.png); PADDING-BOTTOM: 20px; MARGIN: 0px auto; PADDING-LEFT: 20px; WIDTH: 247px; PADDING-RIGHT: 20px; PADDING-TOP: 20px; border-radius: 4px 4px 4px 4px}
	#login FORM{PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; PADDING-TOP: 0px}
	#login P{MARGIN: 10px 0px}
	.control-group{MARGIN-BOTTOM: 10px}
	.control-group .icon-user{BORDER-BOTTOM: #cccccc 1px solid; BORDER-LEFT: #cccccc 1px solid; PADDING-BOTTOM: 4px; LINE-HEIGHT: 20px; PADDING-LEFT: 5px; WIDTH: 16px; PADDING-RIGHT: 5px; DISPLAY: block; BACKGROUND: url(${ctxStatic}/img/bg-loginicons.png) -1px 0px; FLOAT: left; HEIGHT: 20px; OVERFLOW: hidden; BORDER-TOP: #cccccc 1px solid; MARGIN-RIGHT: -1px; BORDER-RIGHT: #cccccc 1px solid; PADDING-TOP: 4px; border-radius: 4px 0 0 4px}
	.control-group .icon-lock{BORDER-BOTTOM: #cccccc 1px solid; BORDER-LEFT: #cccccc 1px solid; PADDING-BOTTOM: 4px; LINE-HEIGHT: 20px; PADDING-LEFT: 5px; WIDTH: 16px; PADDING-RIGHT: 5px; DISPLAY: block; BACKGROUND: url(${ctxStatic}/img/bg-loginicons.png) -1px 0px; FLOAT: left; HEIGHT: 20px; OVERFLOW: hidden; BORDER-TOP: #cccccc 1px solid; MARGIN-RIGHT: -1px; BORDER-RIGHT: #cccccc 1px solid; PADDING-TOP: 4px; border-radius: 4px 0 0 4px}
	.control-group .icon-mail{BORDER-BOTTOM: #cccccc 1px solid; BORDER-LEFT: #cccccc 1px solid; PADDING-BOTTOM: 4px; LINE-HEIGHT: 20px; PADDING-LEFT: 5px; WIDTH: 16px; PADDING-RIGHT: 5px; DISPLAY: block; BACKGROUND: url(${ctxStatic}/img/bg-loginicons.png) -1px 0px; FLOAT: left; HEIGHT: 20px; OVERFLOW: hidden; BORDER-TOP: #cccccc 1px solid; MARGIN-RIGHT: -1px; BORDER-RIGHT: #cccccc 1px solid; PADDING-TOP: 4px; border-radius: 4px 0 0 4px}
	.control-group .icon-lock{BACKGROUND-POSITION: -30px 0px}
	.control-group .icon-mail{BACKGROUND-POSITION: -58px 0px}
	.control-group INPUT{
		BORDER-BOTTOM: #cccccc 1px solid; 
		BORDER-LEFT: #cccccc 1px solid; 
		PADDING-BOTTOM: 4px; 
		LINE-HEIGHT: 30px; 
		BACKGROUND-COLOR: #ffffff; 
		PADDING-LEFT: 6px; 
		WIDTH: 206px; 
		PADDING-RIGHT: 6px; 
		DISPLAY: inline-block; 
		FONT-FAMILY: "Helvetica Neue", Helvetica, Arial, sans-serif; 
		MARGIN-BOTTOM: 10px; 
		HEIGHT: 30px; 
		COLOR: #555555; 
		MARGIN-LEFT: 0px;
		FONT-SIZE: 14px; 
		VERTICAL-ALIGN: middle; 
		BORDER-TOP: #cccccc 1px solid; 
		BORDER-RIGHT: #cccccc 1px solid; 
		PADDING-TOP: 4px; 
		border-radius: 0 4px 4px 0; 
	 	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset; 
		transition: border 0.2s linear 0s, box-shadow 0.2s linear 0s}
	.control-group INPUT:focus{Z-INDEX: 2; OUTLINE-STYLE: dotted; OUTLINE-COLOR: invert; OUTLINE-WIDTH: thin; box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(82, 168, 236, 0.6); -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(82, 168, 236, 0.6); -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(82, 168, 236, 0.6)}
	.login-btn INPUT{BORDER-BOTTOM: 1px solid; BORDER-LEFT: 1px solid; PADDING-BOTTOM: 4px; LINE-HEIGHT: 20px; BACKGROUND-COLOR: #f56c06; MARGIN: 0px auto; PADDING-LEFT: 12px; WIDTH: 80px; PADDING-RIGHT: 12px; DISPLAY: block; BACKGROUND-REPEAT: repeat-x; COLOR: #ffffff; FONT-SIZE: 13px; BORDER-TOP: 1px solid; CURSOR: pointer; BORDER-RIGHT: 1px solid; PADDING-TOP: 4px; border-radius: 4px 4px 4px 4px; box-shadow: 0 1px 0 rgba(255, 255, 255, 0.2) inset, 0 1px 2px rgba(0, 0, 0, 0.05); text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25)}
	.login-btn INPUT:hover{BACKGROUND-COLOR: #fa7716}
	#login-copyright{TEXT-ALIGN: center; PADDING-BOTTOM: 0px; MARGIN: 0px auto; PADDING-LEFT: 10px; WIDTH: 250px; PADDING-RIGHT: 10px; COLOR: #999999; FONT-SIZE: 11px; PADDING-TOP: 10px}
	#login-copyright A{COLOR: #999999; TEXT-DECORATION: none}
	#login-copyright A:hover{BORDER-BOTTOM: #fff 1px dashed; COLOR: #fff; TEXT-DECORATION: none}
</style>
</head>
<body>

<div id="logo">
	<img alt="HongCMS" src="${ctxStatic}/img/logo-login.png">
</div>
<div id="login">
<form id="loginForm" class="form-signin" action="${ctx}/login" method="post">
	<P id=info>&nbsp;</P>
	<div class="header">
		<div id="messageBox" class="alert alert-error ${empty message ? 'hide' : ''}">
			<label id="loginError" class="error">${message}</label>
		</div>
	</div>
	<div class="control-group">
		<span class="icon-user"></span>
		<input type="text" name="username" id="username" placeholder="登录名" class=" required"  value="${username}">
	</div>
	<div class="control-group">
		<span class="icon-lock"></span>
		<input type="password" id="password" name="password" placeholder="登录密码" class=" required">
	</div>
	<c:if test="${isValidateCodeLogin}"><div class="validateCode">
			<label class="input-label mid" for="validateCode">验证码</label>
			<sys:validateCode name="validateCode" inputCssStyle="margin-bottom:0;"/>
		</div></c:if>
	<div class="login-btn">
		<input id="login-btn" value="登 录" type="submit" name="submit">
		<a href="http://10.160.23.78/video/firefox_48_setup.exe">火狐浏览器下载</a>&nbsp;&nbsp;
		<a href="http://10.160.23.78/video/usc_20160818.apk">APK下载</a>
	</div>
</form>
	<div id="login-copyright">北京协和医院 ©2016</div>
</div>
<script src="${ctxStatic}/plugins/jquery/jquery.min.js"></script>
<script src="${ctxStatic}/plugins/jquery/jquery.validate.min.js"></script>
<script type="text/javascript">
		$(document).ready(function() {

			if(self!=top){
				//如果不是顶层页面，将其设为顶层页面
			 	top.location=self.location;
			}
			$("#loginForm").validate({
				rules: {
					validateCode: {remote: "${pageContext.request.contextPath}/servlet/validateCodeServlet"}
				},
				messages: {
					username: {required: "请填写用户名."},password: {required: "请填写密码."},
					validateCode: {remote: "验证码不正确.", required: "请填写验证码."}
				},
				errorLabelContainer: "#messageBox",
				errorPlacement: function(error, element) {
					error.appendTo($("#loginError").parent());
				} 
			});
		});
	</script>
</body>
</html>