<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/core/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>共同代码修改界面</title>
<%@include file="/core/include/head.jsp" %>		
<script type="text/javascript">
	$(document).ready(function(){
		validator = $('#form').bootstrapValidator();//ajax提交
	}); 

	function fncUpdate() {
		rayDialogConfirm("确认保存？",function(){
			validator.bootstrapValidator('validate');//执行校验
			if($('#form').data('bootstrapValidator').isValid()){//校验通过
				$.ajax({
				     type: "post",
				     url: "${ctx}/comCode/updateComCodeDo",
				     data: $('#form').serialize(),
				     async:false,
				     success: function(data){
						rayDialog("修改成功",function(){
							actCancel($('#form'), ctx + "/comCode");
						})
						
				     },
				     error:function(){
				    	rayDialog("修改失败");
				     }
				 });
			}
		});
	}
	
	function fncCancel() {
		actCancel($('#form'), ctx + "/comCode");
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
				<form class="form-horizontal" id="form" method="post" >
					<div class="form-group has-feedback">
						<input type="hidden" class="form-control" id="dictId" name="dictId" value="${comCode.dictId}">
						<label class="col-sm-2 control-label">分类</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="type" name="type" value="${comCode.type}" disabled="disabled">
							<span class="fa fa-check-square-o txt-danger form-control-feedback"></span>
						</div>
						<label class="col-sm-1 control-label">代码</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="code" name="code" value="${comCode.code}" disabled="disabled">
							<span class="fa fa-check-square-o txt-danger form-control-feedback"></span>
						</div>
					</div>
					<div class="form-group  has-feedback">
						<label class="col-sm-2 control-label">代码名</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="label" name="label" value="${comCode.label}"
							 	data-bv-notempty="true" 
							 	data-bv-notempty-message="该字段不能为空">
							<span class="fa fa-check-square-o txt-danger form-control-feedback"></span>
						</div>
						<label class="col-sm-1 control-label">代码描述</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="remark" placeholder="代码描述" name="remark" value="${comCode.remark}">
						</div>
					</div>
					<div class="form-group  has-feedback">
						<label class="col-sm-2 control-label">代码排序</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="sort" name="sort" value="${comCode.sort}" 
								data-bv-notempty="true" 
								data-bv-notempty-message="该字段不能为空" 
								data-bv-regexp="true" 
								data-bv-regexp-regexp="[0-9]+" 
								data-bv-regexp-message="必须为数字">
							<span class="fa fa-check-square-o txt-danger form-control-feedback"></span>
						</div>
						<label class="col-sm-1 control-label">状态</label>
						<div class="col-sm-4" id="del">
							<input type="radio" id="delFlag1" name="delFlag" <c:if test="${comCode.delFlag=='N'}">checked</c:if>  value="N" >可用
							<input type="radio" id="delFlag2" name="delFlag" <c:if test="${comCode.delFlag=='Y'}">checked</c:if> value="Y" >禁用
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-9">
						</div>
						<div class="col-sm-3 text-right">
							<shiro:hasPermission name="comCode:create">
							<button type="button" class="btn btn-default btn-xs" onclick="fncUpdate()">
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
