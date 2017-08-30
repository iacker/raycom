<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<%@ include file="/core/include/taglib.jsp"%>
<!DOCTYPE html>
<HTML>
<HEAD>
<TITLE>数据库备份</TITLE>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@include file="/core/include/head.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		validator = $('#form').bootstrapValidator();//ajax提交时使用
	});
	function fncBackup() {
		rayDialogConfirm("确认开始备份？",function(){
			validator.bootstrapValidator('validate');//执行校验
		   	if($('#form').data('bootstrapValidator').isValid()){//校验通过
			   var fileName=$('#fileName').val();
				$.ajax({
				     type: "post",
				     url: "${ctx}/dbBackup/update?bakFile="+fileName,
				     data: $('#form').serialize() ,
				     async:false,
				     success: function(data){
						rayDialog("备份成功")
					    },
					    error:function(){
					    	rayDialog("备份失败");
					    }
				 });
			}
		});
	}
	
</script>
<link rel="stylesheet" href="${ctxStatic}/plugins/zTree/css/metroStyle/metroStyle.css" type="text/css">
</head>
<body>
<div id="content" class="col-xs-12 col-sm-12">
<div id="ajax-content">
<rt:navigation/>
<div class="row">
	<div class="col-xs-12 col-sm-12">
		<div class="box">
			<%@include file="/core/include/boxHead.jsp" %>
			<div class="box-content">
				<form class="form-horizontal" id="form" name="form" >
					<div class="form-group has-feedback" >
						<label class="col-sm-2 control-label">保存路径:</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="file" name="file" data-toggle="tooltip" data-placement="bottom" onblur="fncCheckUserRepeat();" value="${file }" readonly="readonly" >
						</div>
						<label class="col-sm-1 control-label">数据库备份文件名:</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="fileName" name="fileName" data-toggle="tooltip" data-placement="bottom" onblur="fncCheckUserRepeat();" value="${newFile}"
								data-bv-notempty="true"
								data-bv-notempty-message="文件名不能为空">
							 <span class="fa fa-check-square-o txt-danger form-control-feedback"></span>
						</div>
						<span>.dmp</span>
					</div>
					<div class="form-group " >
						<div class="col-sm-9"></div>
						<div class="col-sm-3 text-right">
						<shiro:hasPermission name="dbBackup:create">
							<button type="button" class="btn btn-default btn-xs" onclick="fncBackup()">保&nbsp;存</button>
						</shiro:hasPermission>
							<button type="button" class="btn btn-default btn-xs" onclick="history.back(-1)">返&nbsp;回</button>
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