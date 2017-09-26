                            <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/core/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>产品安装</title>
<%@include file="/core/include/head.jsp" %>	
<script type="text/javascript">
$(document).ready(function(){
	DashboardTabChecker();
	//$("#mqModel").select2();
	validator = $('#form').bootstrapValidator();
}); 

function DashboardTabChecker(){
	$('#content').on('click', 'a.tab-link', function(e){
		$(this).closest('.nav').find('li').removeClass('active');
		$(this).closest('li').addClass('active');
	});
}

function fncAdd(){
	validator.bootstrapValidator('validate');
	if(!$(form).data('bootstrapValidator').isValid()){
		 $("#overview").click();
		 return;
	}
	
	if($('input:radio[name="mqIsRun"]:checked').val()=='Y'&&$("#mqAddress").val()==""){
		rayDialog('需要填写mq服务器的地址');
		$("#graph").click();
		 return;
	}

	 rayDialogConfirm("确认保存？",function(){
		 actSubmit($('#form'), ctx+"/init/initDo");
	});
}
</script>	
</head>
<body>

<div id="content" class="col-xs-12 col-sm-12" >
<div id="ajax-content">
<div class="row">
	<div id="breadcrumb" class="col-xs-12">
		<ol class="breadcrumb pull-left">
			<li><a href="index.html">ASC</a></li>
			<li><a href="#">一键部署</a></li>
		</ol>
	</div>
</div>
<div id="dashboard-header" class="row">
	<div class="col-xs-12 col-sm-4 col-md-5">
		<h3>ASC系统--USC</h3>
	</div>
	<div class="clearfix visible-xs"></div>
	<div class="col-xs-12 col-sm-8 col-md-7 pull-right">
		<div class="row">
			<div class="col-xs-3">
				<div class="sparkline-dashboard-info">
					数据库配置<i class="fa fa-list-alt"></i>
					<span class="txt-primary">第一步</span>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="sparkline-dashboard-info">
					文件路径配置<i class="fa  fa-folder-open-o"></i>
					<span class="txt-info">第二步</span>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="sparkline-dashboard-info">
					mq配置<i class="fa fa-gears"></i>
					<span>第三步</span>
				</div>
			</div>
			<div class="col-xs-3">
				<div class="sparkline-dashboard-info">
					邮件以及其他配置<i class="fa fa-tasks"></i>
					<span>第四步</span>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row-fluid">
	<div id="dashboard_links" class="col-xs-12 col-sm-2 pull-right "  style="position:fixed;z-index:1000;float: right;right:10px;">
		<ul class="nav nav-pills nav-stacked">
			<li class="active"><a href="#dbLink" class="tab-link"><span id="overview">配置数据库</span></a></li>
			<li><a href="#filePath" class="tab-link" id="clients">配置文件路径</a></li>
			<li><a href="#mqPath" class="tab-link" ><span id="graph">配置mq（可选）</span></a></li>
			<li><a href="#emailPath" class="tab-link" id="servers">配置邮件（可选）</a></li>
			<!-- <li><a href="#" class="tab-link" id="servers">其他（可选）</a></li> -->
			<li><a href="#btnSub" class="tab-link" id="servers">提交</a></li>
		</ul>
	</div>
	<div id="dashboard_tabs" class="col-xs-12 col-sm-10" >
	<form class="form-horizontal" id="form" name="form">
		<!--Start Dashboard Tab 1-->
		<div id="dbLink" class="row">
			<div id="ow-marketplace" class="col-sm-12 col-md-12">
				<h4 class="page-header">配置数据库（必填）</h4>
					<div class="form-group has-feedback" >
						<label class="col-sm-2 control-label">类型</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="dbType" name="dbType" placeholder="代码名" value="oracle" readonly="readonly"
								maxlength="10"
								data-bv-notempty="true" 
								data-bv-notempty-message="该字段不能为空">
								<span class="fa fa-check-square-o txt-danger form-control-feedback"></span>
						</div>
					</div>
					<div class="form-group  has-feedback">
						<label class="col-sm-2 control-label">数据库IP地址</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="dbip" name="dbip" 
								maxlength="16"
								data-bv-notempty="true" 
								data-bv-notempty-message="该字段不能为空">
								<span class="fa fa-check-square-o txt-danger form-control-feedback"></span>
						</div>
					</div>
					<div class="form-group  has-feedback">
						<label class="col-sm-2 control-label">端口</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="dbPort" name="dbPort" value="1521"
								maxlength="16"
								data-bv-notempty="true" 
								data-bv-notempty-message="该字段不能为空">
								<span class="fa fa-check-square-o txt-danger form-control-feedback"></span>
						</div>
						</div>
					<div class="form-group  has-feedback">
						<label class="col-sm-2 control-label">数据库名称</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="dbName" name="dbName" value="orcl"
								maxlength="16"
								data-bv-notempty="true" 
								data-bv-notempty-message="该字段不能为空">
								<span class="fa fa-check-square-o txt-danger form-control-feedback"></span>
						</div>
					</div>
					<div class="form-group  has-feedback">
						<label class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="dbUser" name="dbUser" 
								maxlength="16"
								data-bv-notempty="true" 
								data-bv-notempty-message="该字段不能为空">
								<span class="fa fa-check-square-o txt-danger form-control-feedback"></span>
						</div>
					</div>
					<div class="form-group  has-feedback">
						<label class="col-sm-2 control-label">密码</label>
						<div class="col-sm-4" >
							<input type="text" class="form-control" id="dbPasswd" name="dbPasswd" 
								maxlength="16"
								data-bv-notempty="true" 
								data-bv-notempty-message="该字段不能为空">
								<span class="fa fa-check-square-o txt-danger form-control-feedback"></span>
						</div>
					</div>
			</div>
		</div>
		<!--End Dashboard Tab 1-->
		<!--Start Dashboard Tab 2-->
		<div id="filePath" class="row">
			<div id="ow-marketplace" class="col-sm-12 col-md-12">
				<h4 class="page-header">配置文件路径 </h4>
					<div class="form-group has-feedback" >
						<label class="col-sm-2 control-label">系统名</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="productName" name="productName" value="U-SC系统"
								maxlength="50"
								data-bv-notempty="true" 
								data-bv-notempty-message="该字段不能为空">
								<span class="fa fa-check-square-o txt-danger form-control-feedback"></span>
						</div>
					</div>
					<div class="form-group  has-feedback">
						<label class="col-sm-2 control-label">文件上传路径</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="productFile" name="productFile" value="/hmoe/usc/file"
								maxlength="50"
								data-bv-notempty="true" 
								data-bv-notempty-message="该字段不能为空">
								<span class="fa fa-check-square-o txt-danger form-control-feedback"></span>
						</div>
						</div>
					<div class="form-group  has-feedback">
						<label class="col-sm-2 control-label">日志存放目录</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="productLogFile" name="productLogFile" value="/hmoe/usc/log"
								maxlength="50"
								data-bv-notempty="true" 
								data-bv-notempty-message="该字段不能为空">
								<span class="fa fa-check-square-o txt-danger form-control-feedback"></span>
						</div>
					</div>
			</div>
		</div>
		<!--End Dashboard Tab 2-->
		<!--Start Dashboard Tab 3-->
		<div id="mqPath" class="row">
			<div id="ow-marketplace" class="col-sm-12 col-md-12">
				<h4 class="page-header">配置mq（可选）</h4>
					<div class="form-group has-feedback" >
						<label class="col-sm-2 control-label">mq是否运行</label>
						<div class="col-sm-4 ">
								<div class="radio-inline">
							<label>
								<input type="radio" name="mqIsRun" checked value="N"> 否
								<i class="fa fa-circle-o"></i>
							</label>
						</div>
						<div class="radio-inline">
							<label>
								<input type="radio" name="mqIsRun" value="Y"> 是
								<i class="fa fa-circle-o"></i>
							</label>
						</div>
						</div>
						<label class="col-sm-2 control-label">mq运行模式</label>
						<div class="col-sm-4">
							<select class="form-control" id="mqModel" name="mqModel" >
								<option value="dev">开发模式</option>
								<option value="server" selected="selected">生产模式</option>
							</select>
						</div>
						</div>
					<div class="form-group  has-feedback">
						<label class="col-sm-2 control-label">mq地址</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="mqAddress" name="mqAddress" placeholder="tcp://127.0.0.1:8162">
						</div>
						</div>
					<div class="form-group  has-feedback">
						<label class="col-sm-2 control-label">客户机访问地址</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="upsUrl" name="upsUrl" >
						</div>
					</div>
			</div>
		</div>
		<!--End Dashboard Tab 3-->
		<!--Start Dashboard Tab 4-->
		<div id="emailPath" class="row">
			<div id="ow-marketplace" class="col-sm-12 col-md-12">
				<h4 class="page-header">配置邮件（可选）</h4>
					<div class="form-group has-feedback" >
						<label class="col-sm-2 control-label">SMTP服务器地址</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="emailHost" name="emailHost" >
						</div>
						<label class="col-sm-2 control-label">SMTP端口</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="emailPort" name="emailPort" value="25">
						</div>
						</div>
					<div class="form-group  has-feedback">
						<label class="col-sm-2 control-label">登陆账号</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="emailAccount" name="emailAccount" >
						</div>
						</div>
					<div class="form-group  has-feedback">
						<label class="col-sm-2 control-label">账号密码</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="emailPasswd" name="emailPasswd" >
						</div>
					</div>
					<div class="form-group  has-feedback">
						<label class="col-sm-2 control-label">显示名称</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="emailUsername" name="emailUsername">
						</div>
					</div>
					<div class="form-group  has-feedback">
						<label class="col-sm-2 control-label">发信名称</label>
						<div class="col-sm-4" >
							<input type="text" class="form-control" id="emailSendFrom" name="emailSendFrom" >
						</div>
					</div>
			</div>
		</div>
		<!--End Dashboard Tab 4-->
		<!-- -Start Dashboard Tab 5
		<div id="dashboard-overview" class="row">
			<div id="ow-marketplace" class="col-sm-12 col-md-12">
				<h4 class="page-header">配置其他（可选）</h4>
					<div class="form-group has-feedback" >
						<label class="col-sm-2 control-label">属性添加</label>
						<div class="col-sm-4">
							<textarea id="ot" rows="" cols=""></textarea>
						</div>
					</div>
			</div>
		</div> -->
		<div id="btnSub" class="row">
			<div id="ow-marketplace" class="col-sm-12 col-md-12">
			<h4 class="page-header">填写完成</h4>
					<div class="form-group has-feedback" >
						<label class="col-sm-2 control-label"></label>
						<div class="col-sm-2">
							<button type="reset" class="btn btn-default btn-block">重置</button>
						</div>
						<div class="col-sm-2">
							<button type="button" class="btn btn-default btn-block" onclick="fncAdd();">提交</button>
						</div>
					</div>
				
			</div>
		</div>
		</form>
	<div class="clearfix"></div>
</div>
<div id="dashboard-header" class="row">
	<div class="col-xs-12 pull-center ">
		<h3>创智融科(北京)科技有限责任公司</h3>
	</div>
</div>

</div>
</div>
</body>
</html>
