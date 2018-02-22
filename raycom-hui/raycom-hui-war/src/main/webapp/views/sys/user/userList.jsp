<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/core/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>用户管理</title>
<%@include file="/core/include/head.jsp" %>	
<script type="text/javascript">

	function fncAdd(){
		actSubmit($('#form'), ctx+"/user/add");
	}
	
	function fncDelete(userId){
		rayDialogConfirm("确认删除？",function(){
			actSubmit($('#form'), ctx+"/user/deleteUserDo?userId="+userId);
		});
	} 
	
	function fncUpdate(userId){
		 actSubmit($('#form'), ctx+"/user/update?userId="+userId);
	}
	
	$(function() {
		
		$(document).keyup(function(event){
			if(event.keyCode == 13){
				$("#btnSearch").click();
			};
		});
		table = $('#datatable-form').raytable('form',{rightColumns:-1});
		setWinMoved();
		$("#btnSearch").click(function(){
			table.ajax.reload(null,true);
		});
		$('#officeName').orgRadioTree({id:'officeId',values:'${officeId}'});
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
				<form class="form-horizontal" id="form" method="post" action="/user/queryUserList">
					<div class="form-group">
						<label class="col-sm-1 control-label">登录名</label>
						<div class="col-sm-2">
							<input type="text" id="loginName" class="form-control" placeholder="登录名"  data-query="yes" data-toggle="tooltip" data-placement="bottom" title="登录名">
						</div>
						<label class="col-sm-1 control-label">姓名</label>
						<div class="col-sm-2">
							<input type="text" id="userName" class="form-control" placeholder="姓名" data-query="yes"  data-toggle="tooltip" data-placement="bottom" title="姓名"  >
						</div>
						<label class="col-sm-1 control-label">拼音码</label>
						<div class="col-sm-2" >
							<input type="text" id="assistCode"  class="form-control" placeholder="拼音码" data-query="yes"  data-toggle="tooltip" data-placement="bottom" title="拼音码">
						</div>
					</div>
						
						<div class="form-group">
						<label class="col-sm-1 control-label">部门</label>
						<div class="col-sm-2" >
							<input type="text" id="officeName" class="form-control" placeholder="部门" data-query="yes"  data-toggle="tooltip" data-placement="bottom" title="部门">
							<input type="hidden" id="officeId" class="form-control" placeholder="部门" data-query="yes"  data-toggle="tooltip" data-placement="bottom" title="部门">
						</div>
						<label class="col-sm-1 control-label">登录状态</label>
						<div class="col-sm-2">
						<rt:select2 id="loginFlag"  name="loginFlag" dataQuery="yes" headerKey="-1" headerValue="请选择"  comCode="loginStatus">
							</rt:select2>
							
						</div>
						<label class="col-sm-1 control-label">角色</label>
						<div class="col-sm-2">
							<rt:select2 id="roleId" name="roleId" dataQuery="yes" headerKey="-1" headerValue="请选择"
									items="${role}" itemLabel="roleName"
									itemValue="roleId" >
							</rt:select2>
						</div>
						
					</div>
					<div class="form-group">
						<label class="col-sm-1 control-label">用户类型</label>
						<div class="col-sm-2">
							<rt:select2 id="userType"  name="userType" dataQuery="yes" headerKey="-1" headerValue="请选择"  comCode="userCategory"></rt:select2>
						</div>
						<div class="col-sm-6"></div>
						<div class="text-right col-sm-3">
							<button type="button" class="btn btn-default btn-xs" id="btnSearch">
								查&nbsp;询 
							</button>
							<shiro:hasPermission name="user:create">
								<button type="button" class="btn btn-default  btn-xs" onclick="fncAdd()">
									新&nbsp;增
								</button>
							</shiro:hasPermission>
						</div>
					</div>
					
				</form>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-xs-12">
		<div class="box">
		<%@include file="/core/include/boxHead.jsp" %>
			<div class="box-content no-padding">
				<table class="table table-striped table-bordered" id="datatable-form">
					<thead>
						<tr>
							<th data-column="num">序号</th>
							<th data-column="loginName">登录名</th>
							<th data-column="userName">姓名</th>
							<th data-column="employeeId">员工工号</th>
							<th data-column="officeName">部门</th>
							<th data-column="loginFlag">登录状态</th>
							<th data-column="roleName">角色</th>
							<th data-column="op" data-method="[
										{targets:-1,title:'查看',fncName:'fncUpdate',params:'userId'},
										{targets:-1,title:'删除',fncName:'fncDelete',params:'userId',icon:'del'}
										]">操作</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
	</div>
</div>
</div>
</div>
</body>
</html>
