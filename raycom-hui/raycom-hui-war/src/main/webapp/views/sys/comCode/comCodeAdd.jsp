<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/core/include/taglib.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>共同代码管理</title>
<%@include file="/core/include/head.jsp" %>	

<script type="text/javascript">

	$(document).ready(function(){
		
		 $('#upload').rayfileupload('uploadId');
		
		validator = $("#form").validate({
			submitHandler:function(form){				
				if (!confirm("请确认是否提交？")) return;
					form.submit();
			}	
		});	
	}); 
	
	function fncAdd() {
		rayDialogConfirm("确认保存？",function(){
			if(validator.form()){//校验通过
				$.ajax({
				     type: "post",
				     url: "${ctx}/comCode/addComCodeDo",
				     data: $('#form').serialize() ,
				     async:false,
				     success: function(){
						rayDialog("新增共同代码成功",function(){
							actCancel($('#form'), ctx + "/comCode");
						});
						
					 },
					 error:function(){
				    	rayDialog("新增共同代码失败");
				    }
				 });
			}
		});		
	}
	
	function fncCancel() {
		rayDialogConfirm("确认保存？",function(){
			actCancel($('#form'), ctx + "/comCode");
		});
	}
	
	function product_add(title,url){
		var index = layer.open({
			type: 2,
			title: title,
			content: url
		});
		layer.full(index);
	}
	
	function myselfinfo(){
		layer.open({
			type: 1,
			area: ['300px','200px'],
			fix: false, //不固定
			maxmin: true,
			shade:0.4,
			title: '查看信息',
			content: '<div>管理员信息</div>'
		});
	}
	/*用户-添加*/
	function member_add(title,url,w,h){
		layer_show(title,url,w,h);
	}
</script>
</head>
<body>
<rt:navigation/>
<form class="form form-horizontal" id="form">
<div class="panel panel-default mb-10 mr-10 ml-10 mt-10">
<div class="panel-header"></div>
	<div class="panel-body pd-0 ">
	<article class="page-container pt-0">
		<div class="row cl mt-5">
			<label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>分类：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="text" class="input-text radius size-S" value="" id="type" name="type" placeholder="分类" >
			</div>
			<label class="form-label col-xs-1 col-sm-2">代码：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="text" class="input-text radius size-S" id="code" name="code" placeholder="代码" >
			</div>
		</div>
		<div class="row cl mt-5">
			<label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>代码名：</label>
			<div class="formControls col-xs-3 col-sm-3"> 
				<input type="text" class="input-text radius size-S" value="" id="label" name="label" placeholder="代码名" validata="{required:true}"> 
			</div>
			<label class="form-label col-xs-2 col-sm-2"><span class="c-red">*</span>代码描述：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="text" class="input-text radius size-S" value="" id="remark" name="remark" placeholder="代码描述" validata="{required:true,isDigits:true}"> 
			</div>
		</div>
		<div class="row cl mt-5">
			<label class="form-label col-xs-2 col-sm-2">代码排序：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="text" class="input-text" value="" id="sort" name="sort" placeholder="代码排序"  validata="{required:true,minlength:10}">
			</div>
			<label class="form-label col-xs-2 col-sm-2">代码状态：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="radio" id="delFlag1" checked="checked" name="delFlag"  value="N" >可用
				<input type="radio" id="delFlag2" name="delFlag"  value="Y" >禁用
			</div>
		</div>
		<div class="row cl mt-5">
			<label class="form-label col-xs-2 col-sm-2">开始时间：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="text" onfocus="WdatePicker({ dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'commentdatemax\')||\'%y-%M-%d\'}' })" id="commentdatemin" name="commentdatemin" class="input-text Wdate">
			</div>
			<label class="form-label col-xs-2 col-sm-2">数据时间：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="text" onfocus="WdatePicker({ dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'commentdatemin\')}' })" id="commentdatemax" name="commentdatemax" class="input-text Wdate">
			</div>
		</div>
		<div class="row cl mt-5">
			<label class="form-label col-xs-2 col-sm-2">代码排序：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input id="upload" name="file"  type="file">
				<input type="hidden" class="form-control" id="uploadId" name="uploadId">
				<a  href="javascript:;" style="padding-left: 7px;" id="a1" onclick="" title="删除" >
						<i class="Hui-iconfont Hui-iconfont-del3" ></i>
				</a>
			</div>
			<label class="form-label col-xs-2 col-sm-2">代码状态：</label>
			<div class="formControls col-xs-3 col-sm-3">
				<input type="radio" id="delFlag1" checked="checked" name="delFlag"  value="N" >可用
				<input type="radio" id="delFlag2" name="delFlag"  value="Y" >禁用
			</div>
		</div>
	</article>
</div>
</div>
	<div class="row cl mt-5">
		<div class="col-xs-4 col-sm-4 col-sm-offset-8">
			<button onClick="" 						 class="btn btn-primary radius"   type="button"><i class="Hui-iconfont">&#xe632;</i> 保&nbsp;存</button>
			<button onClick="article_save_submit1()" class="btn btn-secondary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 保存草稿</button>
			<button onClick="fncCancel();"           class="btn btn-default radius cancel"   type="button">&nbsp;&nbsp;返回&nbsp;&nbsp;</button>
		</div>
	</div>
</form>	
</body>
</html>
