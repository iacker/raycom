<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ include file="/core/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>用户添加界面</title>
<%@include file="/core/include/head.jsp" %>		
<link rel="stylesheet" href="${ctxStatic}/plugins/zTree/css/metroStyle/metroStyle.css" type="text/css">
<script type="text/javascript">

	function fncAdd() {
		rayDialogConfirm("确认保存？",function(){
			validator.bootstrapValidator('validate');//执行校验
		    if($(form).data('bootstrapValidator').isValid()){//校验通过 */
				$.ajax({
				     type: "post",
				     url: "${ctx}/user/createUserDo?roleId="+$('#roleId').val()+"&authorizeOfficeId="+$("#authorizeOfficeId").val(),
				     data: $('#form').serialize() ,
				     async:false,
				     success: function(msg){
				    	 if(msg=="true"){
							rayDialog("新增用户成功",function(){
								actSubmit($('#form'), ctx + "/user");
							});
		    				
				    	 }else {
				    		rayDialog(msg,function(){
				    			$("#loginName").focus();
				    		});
				    		
				    	 }
			    	}
				 });
			   }
		});
	}
	
	function fncCancel() {//返回
		 actCancel($('#form'), ctx+"/user");
	}
	
	//导入新的员工
	function Import() {
		 window.open("/usc/views/sys/user/ImportUser.jsp", 'newwindow', "height=600px, width=1200px, top=50,left=50,right=50,toolbar =no, menubar=no, scrollbars=yes, resizable=yes, location=no, status=no");
	}
	
	$(function(){
		$(".js-example-basic-single").select2();
		validator = $('#form').bootstrapValidator();
		$('#officeName').orgRadioTree({id:'officeId',values:' '});
	})
	
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
	
	//根据模态窗选择的物资库存主键查询物资
	function queryImportUser(array){
		$.ajax({
			type:"POST",
			async:false,
        	url:ctx +"/user/queryImportUser",
        	data:{'interfaceId':array},
        	success:function(list){
        		if(list.loginName == '' || list.loginName == null){
        			document.getElementById('loginName').value = list.userId;
        		}else{
        			document.getElementById('loginName').value = list.loginName;
        		}
        		document.getElementById('userName').value = list.userName;
        		document.getElementById('assistCode').value = list.aliasCode;
        		document.getElementById('employeeId').value = list.userId;
        		document.getElementById('phoneNo').value = list.phoneNo;
        		document.getElementById('mobileNo').value = list.mobileNo;
        		document.getElementById('email').value = list.email;
        		document.getElementById('officeName').value = list.officeName;
        		document.getElementById('officeId').value = list.officeId;
        		document.getElementById('position').value = list.position;
        		document.getElementById('password').value ='123456';
        		$('#userType').select2('val',list.userType);
        		$('#sex').select2('val',list.genderflag);
        	}
		})
	}
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
					<div class="form-group has-feedback"  >
						<label class="col-sm-1 control-label">登录名</label>
						<div class="col-sm-4">
							<input type="text" placeholder="登录名" class="form-control" id="loginName" name="loginName"  data-placement="bottom"
								maxlength="10"
								data-bv-notempty="true" 
								data-bv-notempty-message="该字段不能为空">
								<span class="fa fa-check-square-o txt-danger form-control-feedback"></span>
						</div>
						<label class="col-sm-2 control-label">密码</label>
						<div class="col-sm-4">
							<input type="password" class="form-control" placeholder="密码" id="password" name="password" data-placement="bottom"
								data-bv-notempty="true" 
								data-bv-notempty-message="该字段不能为空"
								data-bv-stringlength-min="6"	
								data-bv-stringlength-max="20" 
								data-bv-stringlength-message="该字段输入长度在6和20之间">
							<span class="fa fa-check-square-o txt-danger form-control-feedback"></span>
						</div>
					</div>
					<div class="form-group  has-feedback" >
						<label class="col-sm-1 control-label">姓名</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" placeholder="姓名" id="userName" name="userName"    data-placement="bottom"  onkeyup="fncUserName()"
								maxlength="10"
								data-bv-notempty="true" 
								data-bv-notempty-message="该字段不能为空"/>
								<span class="fa fa-check-square-o txt-danger form-control-feedback"></span>
						</div>
						<label class="col-sm-2 control-label">拼音码</label>
						<div class="col-sm-4" >
							<input type="text" id="assistCode" name="assistCode" readonly="readonly" class="form-control" placeholder="拼音吗" data-query="yes"  data-toggle="tooltip" data-placement="bottom" title="拼音吗">
						</div>
						
					</div>
					<div class="form-group" >
						<label class="col-sm-1 control-label">性别</label>
						<div class="col-sm-4">
							<rt:select2 id="sex"  name="sex" dataQuery="yes" headerKey="-1" headerValue="请选择"  comCode="gender"></rt:select2>
						</div>
						<label class="col-sm-2 control-label">电话</label>
						<div class="col-sm-4">
					    	<input type="text" class="form-control" placeholder="电话" id="phoneNo" name="phoneNo" 
								maxlength="16"
								data-bv-regexp="true"
								data-bv-regexp-regexp="((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)"
								data-bv-regexp-message="电话格式为3-4位区号，7-8位直播号码，1－4位分机号">
						</div>
					</div>
					<div class="form-group" >
						<label class="col-sm-1 control-label">手机</label>
						<div class="col-sm-4">
							<input type="text"  class="form-control" id="mobileNo" placeholder="手机" name="mobileNo"  data-placement="top" 
								maxlength="11"
								data-bv-regexp="true" 
								data-bv-regexp-regexp="^(1[0-9]|)\d{9}$" 
								data-bv-regexp-message="输入不是一个有效的手机格式" >
						</div>
						<label class="col-sm-2 control-label">邮箱</label>
						<div class="col-sm-4">
							<input type="text"  class="form-control" placeholder="邮箱" id="email" name="email" 
								maxlength="30"
								data-bv-emailaddress="true" 
								data-bv-regexp-regexp="^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$"
								data-bv-emailaddress-message="输入不是一个有效的邮箱格式">
							
						</div>
					</div>
					<div class="form-group" >
						<label class="col-sm-1 control-label">部门</label>
						<div class="col-sm-4">
							<input type="hidden" class="form-control" id="officeId" name="officeId">
							<input type="text" id="officeName" name="officeName" readOnly="true" placeholder="部门" class="form-control">
						</div>
						<label class="col-sm-2 control-label">员工编号</label>
						<div class="col-sm-4">
							<input  type="text"  maxlength="8" class="form-control" id="employeeId" placeholder="员工编号" name="employeeId" >
						</div>
					</div>
					<div class="form-group" >
					<label class="col-sm-1 control-label">用户类型</label>
						<div class="col-sm-2">
							<rt:select2 id="userType"  name="userType" dataQuery="yes" headerKey="-1" headerValue="请选择"  comCode="userCategory"></rt:select2>
						</div>
					<label class="col-sm-4 control-label">状态</label>
						<div class="col-sm-4">
							<input name="loginFlag" type="radio" value="Y" checked="checked">可以登录</input>
							<input name="loginFlag" type="radio" value="N">禁止登录</input>
						</div>
					</div>		
					<div class="form-group" >
						<label class="col-sm-1 control-label">角色</label>
						<div class="col-sm-4">
							<rt:select2 id="roleId" name="roleId" htmlAppend="multiple='multiple'" 
									items="${role}" itemLabel="roleName"
									itemValue="roleId" >
							</rt:select2>
						</div>
						<label class="col-sm-2 control-label">人员岗位</label>
						<div class="col-sm-4">
							<input  type="text"  id="position" name="position" class="form-control" placeholder="人员岗位"  >
						</div>
						
					</div>			
					<div class="form-group" >
						<label class="col-sm-1 control-label">授权科室</label>
						<div class="col-sm-4">
							<rt:select2 id="authorizeOfficeId" name="authorizeOfficeId" htmlAppend="multiple='multiple'" 
									items="${querOfficeList}" itemLabel="orgName"
									itemValue="orgId" >
							</rt:select2>
						</div>
						<div class="col-sm-4"></div>
						<div class="col-sm-3 text-right">
						<button type="button" class="btn btn-default btn-xs" onclick="Import();" > 
									导&nbsp;入
							</button>
							<button type="button" class="btn btn-default btn-xs" onclick="fncAdd();" > 
									保&nbsp;存
							</button>
							<button type="button" class="btn btn-default btn-xs" onclick="fncCancel()" >
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
