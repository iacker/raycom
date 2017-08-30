                            <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/core/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>产品安装</title>
<%@include file="/core/include/head.jsp" %>	
<script type="text/javascript">
var i;
$(document).ready(function(){
	i = setInterval(fncGetStatic, 1000);

function fncGetStatic(){
	$.post(ctx+"/init/initStatic",
			null,
			function(data){
				if(data.runFlag=='OK'){//执行完成
					fileProcess		=100;
					tableProcess	=100;
					dataProcess		=100;
					clearInterval(i);
					$("#fileProcess").css("width",fileProcess+"%");
					$("#tableProcess").css("width",tableProcess+"%");
					$("#dataProcess").css("width",dataProcess+"%");
					
					$("#fileProcess >span").text("文件写入: "+fileProcess+"%;");
					$("#tableProcess  >span").text("表结构创建: "+tableProcess+"%;");
					$("#dataProcess >span ").text("数据写入: "+dataProcess+"%;");
					
					rayDialog('部署完成，请重启系统');
				}
				if(data.runFlag=='Y'){
					fileProcess = (data.fileProcess/2)*100;
					if(data.tableProcess==data.tableTotalProcess){
						tableProcess=100;
					}else{
						tableProcess = (data.tableProcess/data.tableTotalProcess+1/(data.tableTotalProcess*2))*100;
					}
					if(data.dataProcess==data.dataTotalProcess){
						dataProcess=100;
					}else{
						dataProcess = (data.dataProcess/data.dataTotalProcess+1/(data.dataTotalProcess*2))*100;
					}
					$("#fileProcess").css("width",fileProcess+"%");
					$("#tableProcess").css("width",tableProcess+"%");
					$("#dataProcess").css("width",dataProcess+"%");
					
					$("#fileProcess >span").text("文件写入: "+fileProcess+"%;");
					$("#tableProcess  >span").text("表结构创建: "+tableProcess+"%;");
					$("#dataProcess >span ").text("数据写入: "+dataProcess+"%;");
					
				}
				if(data.runFlag=='N'){//执行报错
					clearInterval(i);
					actSubmit($('#form'), ctx+"/init");
				}
			}
		);
	}
}); 
</script>	
</head>
<body>

<div id="content" class="col-xs-12 col-sm-12" >
<div id="ajax-content">
<div class="row">
	<div id="breadcrumb" class="col-xs-12">
		<ol class="breadcrumb pull-left">
			<li><a href="#">ASC</a></li>
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
			<div class="col-xs-12">
				<div class="sparkline-dashboard-info">
					一键部署进行中<i class="fa fa-list-alt"></i>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row-fluid" style="height:600px">
	<div id="dashboard_tabs" class="col-xs-12 col-sm-10" >
	<form class="form-horizontal" id="form" name="form">
		<!--Start Dashboard Tab 1-->
		<div id="dbLink" class="row">
			<div id="ow-marketplace" class="col-sm-12 col-md-12">
				<h4 class="page-header">配置项写入</h4>
					<div class="box-content">
				<div class="progress progress-striped active">
					<div id="fileProcess" class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
						<span>文件写入:100%</span>
					</div>
				</div>
			</div>
			</div>
		</div>
		<!--End Dashboard Tab 1-->
		<!--Start Dashboard Tab 2-->
		<div id="filePath" class="row">
			<div id="ow-marketplace" class="col-sm-12 col-md-12">
				<h4 class="page-header">数据库脚本执行 </h4>
				<div class="box-content">
				<div class="progress progress-striped active">
					<div id="tableProcess" class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
						<span>表结构创建：60%</span>
					</div>
				</div>
				<div class="progress progress-striped active">
					<div id="dataProcess" class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width:0%;">
						<span>数据写入：10% </span>
					</div>
				</div>
			</div>
			</div>
		</div>
		<!--End Dashboard Tab 2-->
		<div id="btnSub" class="row">
			<div id="ow-marketplace" class="col-sm-12 col-md-12">
			<h4 class="page-header">执行说明</h4>
					<div class="form-group has-feedback" >
						<label class="col-sm-12 control-label pull-left">一键安装后，需要重新启动服务器</label>
					</div>
				
			</div>
		</div>
		<div id="btnSub" class="row"  style="height:200px">
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
