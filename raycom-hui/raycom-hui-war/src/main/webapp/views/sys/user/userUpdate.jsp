<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/core/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>用户修改界面</title>
<%@include file="/core/include/head.jsp" %>		
<link rel="stylesheet" href="${ctxStatic}/plugins/zTree/css/metroStyle/metroStyle.css" type="text/css">
<script type="text/javascript">

	function fncUpdate() {
		rayDialogConfirm("确认保存？",function(){
			validator.bootstrapValidator('validate');//执行校验
			if($(form).data('bootstrapValidator').isValid()){
				$.ajax({
				     type: "post",
				     url: "${ctx}/user/updateUserDo?roleId="+$('#roleId').val()+"&authorizeOfficeId="+$("#authorizeOfficeId").val(),
				     data: $('#form').serialize() ,
				     async:false,
				     success: function(data){
			    	 	rayDialog("修改成功",function(){
			    	 		actSubmit($('#form'), ctx + "/user");
			    	 	});
				    },
				 });
			}
		});
	}
	
	//生成拼音码
	function fncUserName(){
		$.ajax({
		     type: "post",
		     url: ctx + "/material/aliasCode",
		     data: {alias:$("#userName").val()} ,
		     async:false,
		     success: function(data){
		    	 $("#assistCode").val(data.aliasCode);
	    	}
		 });
	}
	
	function fncCancel() {
		rayDialogConfirm("确认取消修改吗？",function(){
			actCancel($('#form'), ctx+"/user");
		})
	}
	
	//重置密码
	function  resetPass() {
		rayDialogConfirm("确认重置密码吗？",function(){
			$.ajax({
			     type: "post",
			     url: "${ctx}/user/resetPass",
			     data: $('#form').serialize() ,
			     async:false,
			     success: function(data){
		    	 	rayDialog("重置成功",function(){
		    	 		actSubmit($('#form'), ctx + "/user");
		    	 	});
			    },
			 });
		})
	}
	
	$(document).ready(function(){
		$(".js-example-basic-single").select2();
		validator = $('#form').bootstrapValidator();
		$("input[value='"+$("#a1").val()+"']").attr("checked",true); //使用登录
		$("#userType").val($("#a2").val());//用户类型
		$("#sex").val($("#gender").val());
		//$("#roleId").select2("val",[${userRole}]);
		$('#officeName').orgRadioTree({id:'officeId',values:'${user.officeId}'});
	}); 
	
</script>
</head>
<body>
<div id="content" class="col-xs-12 col-sm-12" >
<div id="ajax-content">
<rt:navigation/>
<div class="row">
	<div class="col-xs-12 col-sm-12">
		<div class="box">
			<%@include file="/core/include/boxHead.jsp" %>	
			<div class="box-content">
				<form class="form-horizontal" id="form" name="form" action=""  method="post" >
						<input type="hidden" id="a1" value="${user.loginFlag}"/>
						<input type="hidden" id="a2" value="${user.userType}"/>
						<input type="hidden" id="userId" name="userId" value="${user.userId}">
						<input type="hidden" id="gender" value="${user.sex}"/>
					<div class="form-group has-feedback">
						<label class="col-sm-2 control-label">登录名</label>
						<div class="col-sm-4">
							<input  value="${user.loginName}" type="text"  class="form-control" placeholder="admin" id="loginName" name="loginName" data-toggle="tooltip" data-placement="bottom" readOnly>
						</div>
					</div>
					<div class="form-group has-feedback">
						<label class="col-sm-2 control-label">姓名</label>
						<div class="col-sm-4">
							<input value="${user.userName}" type="text" class="form-control" placeholder="姓名" id="userName" name="userName" placeholder="张三" data-toggle="tooltip" data-placement="bottom" onkeyup="fncUserName()"
								maxlength="10"
								data-bv-notempty="true" 
								data-bv-notempty-message="该字段不能为空" >
							<span class="fa fa-check-square-o txt-danger form-control-feedback"></span>
						</div>
						<label class="col-sm-2 control-label">拼音码</label>
						<div class="col-sm-4" >
							<input value="${user.assistCode}"  type="text" id="assistCode" name="assistCode" readonly="readonly" class="form-control" placeholder="拼音吗" data-query="yes"  data-toggle="tooltip" data-placement="bottom" title="拼音吗">
						</div>
					</div>
					<div class="form-group">
					<label class="col-sm-2 control-label">性别</label>
						<div class="col-sm-4">
							<rt:select2  id="sex"  name="sex" dataQuery="yes" headerKey="-1" headerValue="请选择"  comCode="gender"></rt:select2>
						</div>
						<label class="col-sm-2 control-label">电话</label>
						<div class="col-sm-4">
							<input value="${user.phoneNo}" type="text" class="form-control" id="phoneNo" placeholder="电话" name="phoneNo"  data-toggle="tooltip" data-placement="bottom"
								maxlength="16"
								data-bv-regexp="true"
								data-bv-regexp-regexp="((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)"
								data-bv-regexp-message="电话格式为3-4位区号，7-8位直播号码，1－4位分机号">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">邮箱</label>
						<div class="col-sm-4">
							<input value="${user.email}" type="text" class="form-control" placeholder="邮箱" id="email" name="email" 
								maxlength="30"
								data-bv-emailaddress="true" 
								data-bv-regexp-regexp="^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$"
								data-bv-emailaddress-message="输入不是一个有效的邮箱格式">
						</div>
						<label class="col-sm-2 control-label">手机</label>
						<div class="col-sm-4">
							<input type="text" value="${user.mobileNo}" placeholder="手机" id="mobileNo" name="mobileNo" class="form-control"  data-placement="top" 
								maxlength="11"
								data-bv-regexp="true" 
								data-bv-regexp-regexp="^(1[0-9]|)\d{9}$" 
								data-bv-regexp-message="输入不是一个有效的手机格式" >
						</div>
					</div>
					<div class="form-group">
					<label class="col-sm-2 control-label">员工编号</label>
						<div class="col-sm-4">
							<input type="text" id="employeeId" name="employeeId" placeholder="员工编号" class="form-control" value="${user.employeeId}">
						</div>
						<label class="col-sm-2 control-label">部门</label>
						<div class="col-sm-4">
							<input value="${user.officeId}" type="hidden" id="officeId" name="officeId" class="form-control" placeholder="" data-toggle="tooltip" data-placement="top">
							<input value="${user.officeName}" type="text" id="officeName" placeholder="部门" name="officeName" class="form-control" placeholder="" data-toggle="tooltip" data-placement="top" >
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">状态</label>
						<div class="col-sm-4">
							<input name="loginFlag" type="radio" value="Y">可以登录</input>
							<input name="loginFlag" type="radio" value="N">禁止登录</input>
						</div>
						<label class="col-sm-2 control-label">用户类型</label>
						<div class="col-sm-4">
							<rt:select2 id="userType"  name="userType" dataQuery="yes" headerKey="-1" headerValue="请选择"  comCode="userCategory"></rt:select2>
						</div>
					</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">角色</label>
						<div class="col-sm-4">
							<rt:select2 id="roleId" name="roleId" htmlAppend="multiple='multiple'" value="${userRole}"
									items="${role}" itemLabel="roleName"
									itemValue="roleId" >
							</rt:select2>
						</div>
							<label class="col-sm-2 control-label">人员岗位</label>
							<div class="col-sm-4">
								<input  type="text"  value="${user.position}" id="position" name="position" class="form-control" placeholder="人员岗位"  >
							</div>
						</div>
						
					<div class="form-group">
						<label class="col-sm-2 control-label">授权科室</label>
						<div class="col-sm-4">
							<rt:select2 id="authorizeOfficeId" name="authorizeOfficeId" htmlAppend="multiple='multiple'" value="${user.authorizeOfficeIds}" 
									items="${querOfficeList}" itemLabel="orgName"
									itemValue="orgId" >
							</rt:select2>
						</div>
						<div class="col-sm-3">
						</div>
						<div class="col-sm-3 text-right">
						<shiro:hasPermission name="user:create">
						<button type="button" class="btn btn-default btn-xs" onclick="resetPass();">
								重置密码
						</button>
							<button type="button" class="btn btn-default btn-xs" onclick="fncUpdate();">
								保&nbsp;存
							</button>
						</shiro:hasPermission>
							<button type="button" class="btn btn-default btn-xs" onclick="fncCancel()">
								返&nbsp;回
							</button>
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

