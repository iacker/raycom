<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/core/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>密码修改界面</title>
<%@include file="/core/include/head.jsp" %>		
<link rel="stylesheet" href="${ctxStatic}/plugins/zTree/css/metroStyle/metroStyle.css" type="text/css">
<script type="text/javascript">
	
	$(document).ready(function() {
		validator = $('#form').bootstrapValidator();//ajax提交时使用
	});
	
	function fncUpdate() {
		rayDialogConfirm("确认保存？",function(){
			validator.bootstrapValidator('validate');//执行校验
			if($(form).data('bootstrapValidator').isValid()){
				//校验原密码是否与新密码相等，新密码是否一致
				if($('#oldPassword').val() == $('#newPassword').val()){
					rayDialog("新密码与不能与原来密码相同,请重新输入！");
					return;
				}
				if($('#newPassword').val() != $('#confirmPassword').val()){
					rayDialog("两次新密码输入不一致,请重新输入！");
					return;
				}
				$.ajax({
				     type: "post",
				     url: "${ctx}/user/saveUpdatedPwd",
				     data: $('#form').serialize(),
				     async:false,
				     success: function(data){
				    	if(data == 'ok'){
				    		rayDialog("修改成功,请重新登录！",function(){ actSubmit($('#form'), ctx + "/logout");  });
							
				    	}
				    	if(data == 'oldPasswordError'){
				    		rayDialog("原密码错误,请输入正确原密码");
				    		return;
				    	}
				     }
				 });
			}
		});
	}
	
	function fncCancel() {
		actCancel($('#form'), ctx+"/user");
	}
	

	
</script>
</head>
<body>
<div id="content" class="col-xs-12 col-sm-12" >
<div id="ajax-content">
<!-- nav -->
<div class="row">
	<div id="breadcrumb" class="col-xs-12" style="margin-bottom: 20px;">
		<a href="#" class="show-sidebar">
			<i class="fa fa-bars"></i>
		</a>
		<ol class="breadcrumb pull-left">
			<li><a href="#">修改密码</a></li>
		</ol>
	</div>
</div>
<!-- nav end -->
<div class="row">
	<div class="col-xs-12 col-sm-12">
		<div class="box">
			<%@include file="/core/include/boxHead.jsp" %>	
			<div class="box-content">
				<form class="form-horizontal" id="form" name="form" action=""  method="post" >
						<input type="hidden" id="userId" name="userId" value="${user.userId}">
					<div class="form-group">
						<label class="col-sm-2 control-label">登录名</label>
						<div class="col-sm-4">
							<input  value="${user.loginName}" type="text" class="form-control" id="loginName" name="loginName" data-toggle="tooltip" data-placement="bottom" readOnly>
						</div>
					</div>
					<div class="form-group has-feedback">
						<label class="col-sm-2 control-label">姓名</label>
						<div class="col-sm-4">
							<input value="${user.userName}" type="text" readonly class="form-control" placeholder="姓名" id="userName" name="userName" placeholder="张三" data-toggle="tooltip" data-placement="bottom">
						</div>
					</div>
					<div class="form-group has-feedback">
						<label class="col-sm-2 control-label">原密码</label>
						<div class="col-sm-4">
							<input type="password" value="" class="form-control" placeholder="原密码" id="oldPassword" name="oldPassword">
						</div>
					</div>
					<div class="form-group has-feedback">
						<label class="col-sm-2 control-label">新密码</label>
						<div class="col-sm-4">
							<input type="password" value="" class="form-control" placeholder="新密码" id="newPassword" name="newPassword"
							data-bv-stringlength="true"
							data-bv-stringlength-min="6"	
							data-bv-stringlength-max="30" 
							data-bv-stringlength-message="该字段输入长度在6和30之间"
							data-bv-notempty="true"
							data-bv-notempty-message="该字段不能为空">
						</div>
					</div>
					<div class="form-group has-feedback">
						<label class="col-sm-2 control-label">确认新密码</label>
						<div class="col-sm-4">
							<input type="password" value="" class="form-control" placeholder="确认新密码" id="confirmPassword" name="confirmPassword"
							data-bv-stringlength="true"
							data-bv-stringlength-min="6"	
							data-bv-stringlength-max="30" 
							data-bv-stringlength-message="该字段输入长度在6和30之间"
							data-bv-notempty="true"
							data-bv-notempty-message="该字段不能为空">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-9">
						</div>
						<div class="col-sm-3 text-right">
						<shiro:hasPermission name="user:create">
							<button type="button" class="btn btn-default btn-xs" onclick="fncUpdate();">
								保&nbsp;存
							</button>
						</shiro:hasPermission>
							<!-- <button type="button" class="btn btn-default btn-xs" onclick="fncCancel()">
								返&nbsp;回
							</button> -->
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</div>
</div>
</body>
</html>