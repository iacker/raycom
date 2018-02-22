<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/core/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>权限管理</title>
<%@include file="/core/include/head.jsp"%>
<script type="text/javascript">

	$(document).ready(function() {
		table = $('#datatable-form').raytable('form',{rightColumns:-1});
		setWinMoved();
		//返回按钮
		$("#btnSearch").click(function() {
			table.ajax.reload();
		});
		//输入框中输完后点击回车就发起搜索
		$("#roleName").keyup(function(event){
			if(event.keyCode == 13){
				$("#btnSearch").click();
			};
		});
	}); 
	
	
	//新增
	function fncAdd() {
		actSubmit($('#form'), ctx + "/role/add");
	}
	
	//查看详情
	function fncDetail(id) {
		actSubmit($('#form'), ctx + "/role/queryDetail?roleId=" + id);
	}
	
	//删除
	function fncDelete(id) {
		rayDialogConfirm("确认删除？",function(){
			//判断当前角色是否有用户关联
			$.ajax({
				url : ctx + "/role/checkedUser",
				type : "POST",
				data : {"roleId" : id},
				success : function(msg) {
					if (msg == "canDelete") {
						rayDialogConfirm("确定要删除此角色？",function(){
							actSubmit($('#form'), ctx+ "/role/deleteRoleAndPercodes?roleId=" + id);
						});
					} else {
						rayDialog("该角色还有用户使用，不能删除！");
					}
				}
			});
		});
	}
	
</script>
</head>
<body>
<div id="content" class="col-xs-12 col-sm-12">
	<div id="ajax-content">
		<!-- nav -->
		<rt:navigation/>
		<!-- nav end -->
		<div class="row">
			<div class="col-xs-12 col-sm-12">
				<div class="box">
					<%@include file="/core/include/boxHead.jsp"%>
					<div class="box-content">
						<!-- <h4 class="page-header">Registration form</h4> -->
						<form class="form-horizontal" id="form" method="post"
							action="/role/queryRoleList">
							<div class="form-group" >
								<label class="col-sm-1 control-label">角色名称</label>
								<div class="col-sm-2">
									<input type="text" id="roleName" class="form-control" placeholder="角色名称" data-query="yes" data-toggle="tooltip" data-placement="bottom" title="Tooltip for last name">
									<input style="display:none" /> 
								</div>
								<div class="col-sm-9 text-right ">
									<button type="button" class="btn btn-default  btn-xs  " id="btnSearch">
										查&nbsp;询 
									</button>
									<shiro:hasPermission name="role:create">
									<button type="button" class="btn btn-default  btn-xs" onclick="fncAdd()" >
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
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<%@include file="/core/include/boxHead.jsp"%>
				<div class="box-content no-padding">
					<table class="table table-striped table-bordered " id="datatable-form" width="100%">
						<thead>
							<tr>
								<th data-column="roleId">角色编码</th>
								<th data-column="roleName">角色名称</th>
								<th data-column="roleEnname">英文名称</th>
								<th data-column="op" data-method="[
											{targets:-1,title:'查 看',fncName:'fncDetail',params:'roleId'},
											{targets:-1,title:'删 除',fncName:'fncDelete',params:'roleId',icon:'del'}
											]">操作</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!--End Container-->
</div>
</body>
</html>
