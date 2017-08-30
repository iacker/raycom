<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/core/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>角色新增</title>
<%@include file="/core/include/head.jsp"%>
<link href="${ctxStatic}/plugins/zTree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet">
<script type="text/javascript">

	$(document).ready(function() {
		fncInitMenu();
		validator = $('#form').bootstrapValidator();//ajax提交时使用
	}); 
	
	var setting = {
		check : {
			enable : true,
			chkStyle : "checkbox",
			chkboxType : {
				"Y" : "ps",
				"N" : "s"
			}
		},
		data : {
			simpleData : {
				enable : true
			}
		},
	};
	
	// 初始化
	function fncInitMenu() {
		$.ajax({
			type : "post",
			url : ctx + "/role/getAllMenu",
			success : function(data) {
				zTree = $.fn.zTree.init($("#tree"), setting, data);
				//zTree.expandAll(true);
				var nodes = zTree.getNodes();
				for(var i=0;i<nodes.length;i++){
					if (nodes[i].level==0) {
						zTree.expandNode(nodes[i], true, false, false);
					}
				}
				fncInitForm() 
			},
			error : function() {
				rayDialog("请求失败")
			}
		});
	}
	
	//保存按钮
	function fncSave() {
		rayDialogConfirm("确认保存？",function(){
			validator.bootstrapValidator('validate');//执行校验
			
			var menuIds =[{
					"roleName" : $('#roleName').val().trim(),
					"roleEnname" : $('#roleEnname').val().trim(),
					"remarks" : $('#remarks').val().trim()
					}];
			
			var selectedNode = zTree.getCheckedNodes();
			for (var i = 0,j = 0; i < selectedNode.length; i++) {
				var node = selectedNode[i];
				if(node.type == 'btn'){//按钮
					menuIds.push({menuPid:node.pId,permissionCode:node.id}); 
				}	
				if(node.type == 'menu'){//meun
					menuIds.push({menuId:node.id});
				}
			}
			if ($(form).data('bootstrapValidator').isValid()) {//校验通过
				$.ajax({
					url : ctx + "/role/createRole",
					type : "POST",
					data :{jsonDt:JSON.stringify(menuIds)} ,
					success : function(msg) {
						if (msg == "0") {
							rayDialog("保存成功",function(){
								actCancel($('#form'), ctx + "/role");
							});
							
						} else {
							rayDialog("该角色名称已经存在，请输入其他角色名称！");
						}
					},
					error : function() {
						rayDialog("保存失败");
					}
				});
			}
		});
	}
	
	//返回按钮
	function fncCancel() {
		rayDialogConfirm("是否确认取消？",function(){
			actCancel($('#form'), ctx + "/role");
		});
	}
	
</script>
</head>
<body>
	<div id="content" class="col-xs-12 col-sm-12">
		<div id="ajax-content">
			<rt:navigation/>
			<div class="row">
				<div class="col-xs-12 col-sm-12">
					<div class="box">
						<%@include file="/core/include/boxHead.jsp"%>
						<div class="box-content">
							<form class="form-horizontal" id="form" method="post"
								data-bv-message="数据有误"
								data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
								data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
								data-bv-feedbackicons-validating="glyphicon glyphicon-refresh"
								action="">
								<div class="col-sm-6">
									<div class="form-group has-feedback">
										<label class="col-sm-2 control-label">角色名称</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" placeholder="角色名称" id="roleName" name="roleName" data-toggle="tooltip" data-placement="bottom" 
												data-bv-notempty="true" 
												data-bv-notempty-message="该字段不能为空" 
												data-bv-stringlength="true" 
												data-bv-stringlength-max="30" 
												data-bv-stringlength-message="该字段输入长度不能超过30">
											<span class="fa fa-check-square-o txt-danger form-control-feedback"></span>
										</div>
									</div>
									<div class="form-group has-feedback">
										<label class="col-sm-2 control-label">英文名称</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" placeholder="英文名称" id="roleEnname" name="roleEnname" data-toggle="tooltip" data-placement="bottom" 
												data-bv-notempty="true" 
												data-bv-notempty-message="该字段不能为空"
												data-bv-regexp="true"
												data-bv-regexp-regexp="[a-zA-Z]+"
												data-bv-regexp-message="必须为字母"data-bv-stringlength="true" 
												data-bv-stringlength-max="50" 
												data-bv-stringlength-message="该字段输入长度不能超过50"><span class="fa fa-check-square-o txt-danger form-control-feedback"></span>
										</div>
									</div>
									<div class="form-group has-feedback">
										<label class="col-sm-2 control-label">备注</label>
										<div class="col-sm-4">
											<!-- <input type="text" class="form-control" id="remarks" name="remarks" placeholder="备注"> -->
											<textarea rows="3" cols="60" class="form-control" placeholder="备注" id="remarks" name="remarks" style="width:335px;" 
												data-bv-stringlength="true" 
												data-bv-stringlength-max="80" 
												data-bv-stringlength-message="该字段输入长度不能超过80" ></textarea>
										</div>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<div class="ztreeBackground left" style="position:absolute; height:400px; width:350px; overflow:auto">
											<ul id="tree" class="ztree"></ul>
										</div>
									</div>
								</div>
								<div class="clearfix"></div>
								<div class="form-group">
									<div class="col-sm-9">
									</div>
									<div class="col-sm-3 text-right">
										<button type="button" class="btn btn-default btn-xs" onclick="fncSave()">
										保&nbsp;存
										</button>
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
	<script type="text/javascript" src="${ctxStatic}/plugins/zTree/js/jquery.ztree.core.js"></script>
	<script type="text/javascript" src="${ctxStatic}/plugins/zTree/js/jquery.ztree.excheck.js"></script>
	<script type="text/javascript" src="${ctxStatic}/plugins/zTree/js/jquery.ztree.core.min.js"></script>
	<script type="text/javascript" src="${ctxStatic}/plugins/zTree/js/jquery.ztree.excheck.min.js"></script>
</body>
</html>
