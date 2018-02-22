<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ include file="/core/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>${fns:getConfig('productName')}</title>
<%@include file="/core/include/head.jsp" %>	
<link rel="stylesheet" type="text/css" href="${ctxStatic}/plugins/h-ui.admin/css/H-ui.login.css" />
</head>
<body>
<div class="header c-white"><h2 style="padding-bottom: 10px;padding-top: 10px;padding-left: 25px;">${fns:getConfig('productName')}</h2></div>
<div class="loginWraper">
  <div id="loginform" class="loginBox">
    <form id="loginForm" class="form-signin form form-horizontal" action="${ctx}/login" method="post">
    	<div class="row cl">
        	<div id="messageBox" class="formControls col-xs-6 col-xs-offset-3 alert alert-error ${empty message ? 'hide' : ''}">
				<p class="c-error">${message}用户名和密码错误</p>
			</div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
        <div class="formControls col-xs-8">
          <input type="text" name="username" id="username" placeholder="登录名"   class="input-text size-L required"> 
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-xs-8">
          <input type="password" id="password" name="password" placeholder="登录密码" class="input-text size-L required">
        </div>
      </div>
      <c:if test="${isValidateCodeLogin}">
      	<sys:validateCode name="validateCode" inputCssStyle="margin-bottom:0;"/>
	  </c:if>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input name="" type="submit" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
          <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
        </div>
      </div>
    </form>
  </div>
</div>
<div class="footer">北京协和医院 ©2016</div>
<script src="${ctxStatic}/plugins/jquery/1.9.1/jquery.validate.min.js"></script>
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