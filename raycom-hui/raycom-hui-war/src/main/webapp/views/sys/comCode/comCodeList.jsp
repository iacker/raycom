<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/core/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>共同代码管理</title>
<%@include file="/core/include/head.jsp" %>	
<script type="text/javascript">
	$(document).ready(function() {
		table = $('#datatable-form').raytable('form',{rightColumns:-1});
		//查询按钮
		$("#btnSearch").click(function(){ 
			table.ajax.reload();
		});
		$(document).keyup(function(event){
			if(event.keyCode == 13){
				$("#btnSearch").click();
			};
		});
	});

	function fncAdd(){
		actSubmit($('#form'), ctx+"/comCode/add");
	}

	function fncupdate(dictId){
		actSubmit($('#form'), ctx+"/comCode/update?dictId="+dictId);
	}

</script>	
</head>
<body>
<rt:navigation/>
<div class="page-container">
<div class="panel panel-default pt-5">
<form class="form-horizontal" id="form" method="post" action="/comCode/querycomCodeList">
	<table class="table  ">
		<tr>
			<td class="text-r"></td>
			<td class="text-l">
			</td>
			<td class="text-r">分类</td>
			<td class="text-l pd-0">
				<rt:select2 id="type" dataQuery="yes" headerKey="-1" className="select" headerValue="全部" items="${types}" itemValue="type" itemLabel="type"></rt:select2>
			</td>
			<td class="text-r">代码名</td>
			<td class="text-l pd-0">
				<input type="text" id="label" class="input-text radius size-S"  placeholder="代码名" data-query="yes">
			</td>
			<td class="text-r ">代码描述</td>
			<td class="text-l pd-0">
				<input type="text"  id="remark" class="input-text radius size-S "  placeholder="代码名" data-query="yes">
			</td>
			<td class="text-r"></td>
			<td class="text-l"></td>
		</tr>
	</table>
	</form>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-5">
		<span class="r">
			<a href="javascript:;" class="btn btn-danger radius" id="btnSearch">
				<i class="Hui-iconfont">&#xe6e2;</i> 查 &nbsp;询
			</a> 
			<a href="javascript:;" onclick="fncAdd()" class="btn btn-primary radius">
				<i class="Hui-iconfont">&#xe600;</i> 新&nbsp;增
			</a>
		</span>
	</div>

	<div class="mt-15">
	<div class="panel panel-default pt-0">
		<table class="table table-border table-bordered table-bg table-hover table-sort table-responsive" id="datatable-form"  width="100%">
			<thead>
				<tr>
					<th data-column="dictId" >序号</th>
					<th data-column="type" >分类</th>
					<th data-column="code" >代码</th>
					<th data-column="label" >代码名</th>
					<th data-column="remark" >代码描述</th>
					<th data-column="sort" >代码排序</th>
					<th data-column="delFlag" >状态</th>
					<th data-column="op"  data-method="[{targets:-1,title:'查看',fncName:'fncupdate',params:'dictId'}]">操作</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>
	</div>
</div>
</body>
</html>