<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/core/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公告新增</title>
<%@include file="/core/include/head.jsp" %>
<link rel="stylesheet" href="${ctxStatic}/css/default/default.css">
<link rel="stylesheet" href="${ctxStatic}/plugins/kindeditor/plugins/code/prettify.css">
<script src="${ctxStatic}/plugins/kindeditor/kindeditor-all.js"></script>
<script src="${ctxStatic}/plugins/kindeditor/lang/zh-CN.js"></script>
<script type="text/javascript">
	var editor;
	
	$(function() {
		$("#startDate").rayDatePicker();
		$("#endDate").rayDatePicker();
		$(".js-example-basic-single").select2();
		$('#form').bootstrapValidator();//表单提交时使用
		$('#noticeUpload').rayfileupload('noticePicture','','Y');
		
		$('#type').hide();
		$('#classify').hide();
		
		KindEditor.ready(function(K) {
			editor = K.create('textarea[name="noticeContent"]',{
				allowFileManager : true,
				items : ['source','fontname','fontsize','forecolor','preview','selectall','justifyleft','justifycenter','justifyright','emoticons','link','unlink','image'],
				afterChange : function() {
				this.sync(); 
				} 
				});
		});
	})
	

	//新增
	function fncAdd() {
		
		if(new Date($('#endDate').val()) < new Date($('#startDate').val())){
			rayDialog('开始时间不能大于结束时间！');
			return;
		}
		rayDialogConfirm("确认保存？",function(){
			editor.sync();
			$.post(
				ctx+"/notice/createNoticeDo",
				$('#form').serialize(),
				function(data){
					if(data == 'ok'){
						return rayDialog("保存成功！",function(){
							actCancel($('#form'), ctx+"/notice/list");
						});						
					}
					
				}
			);	
		});
	}
	
	//返回
	function fncCancel(){
		rayDialogConfirm("是否放弃本次编辑？",function(){
			actCancel($('#form'), ctx+"/notice/list");//方法提交不需要校验
		});
			
	}
	
	
	//更改发布公告系统控制类型和分类单选
	function changeSys(){
		var sys = $('#publishSys option:checked').val();
		if(sys == '01'){
			$('#type').hide();
			$('#classify').hide();
		}
		if(sys == '02'){
			$('#type').show();
			$('#classify').show();
		}
	}
	
	//更改类型控制分类显隐
	function changeType(){
		var type = $('#noticeType option:checked').val();
		if(type == '01'){//公告
			$('#classify').show();
			$('#picture').show();
		}
		if(type == '02'){
			$('#classify').hide();
			$('#picture').hide();
			$('#noticeUpload').val('');
			$('#noticePicture').val('');
			$('#uploadContent').remove();
			
		}
		if(type == '03'){
			$('#classify').hide();
			$('#picture').show();
		}
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
			<%@include file="/core/include/boxHead.jsp" %>
			<div class="box-content">
				<form class="form-horizontal" id="form"  action="${ctx}/notice/createNoticeDo"  method="post"
					data-bv-message="数据有误"
					data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
					data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
					data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">
					<div class="form-group has-feedback ">
						<label class="col-sm-2 control-label">公告标题</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="noticeTitle" name="noticeTitle" placeholder="公告标题" data-toggle="tooltip" data-placement="bottom" title="公告标题" 
								data-bv-notempty="true"
								data-bv-notempty-message="公告标题不能为空">
							<span class="fa fa-check-square-o txt-danger form-control-feedback"></span>
						</div>
					</div>
					<div class="form-group has-feedback ">
						<label class="col-sm-2 control-label">开始日期</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" readonly id="startDate" name="startDate" placeholder="开始日期"   data-toggle="tooltip" data-placement="bottom" title="开始日期"
							data-bv-regexp="true"
							data-bv-regexp-regexp="^[0-9]{4}-[0-1]?[0-9]{1}-[0-3]?[0-9]{1}$"
							data-bv-regexp-message="日期格式为:XXXX-XX-XX"/>
						</div>
						<label class="col-sm-1 control-label">结束日期</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" readonly id="endDate" name="endDate" placeholder="结束日期"  data-toggle="tooltip" data-placement="bottom" title="结束日期"
							data-bv-regexp="true"
							data-bv-regexp-regexp="^[0-9]{4}-[0-1]?[0-9]{1}-[0-3]?[0-9]{1}$"
							data-bv-regexp-message="日期格式为:XXXX-XX-XX"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">发布系统</label>
						<div class="col-sm-4">
							<select id="publishSys" class="js-example-basic-single" name="publishSys" onchange="changeSys();"  data-query="yes" data-placement="bottom"> 
							    <option value="01" selected>U-SC</option> 
							    <option value="02" >U-PS</option> 
							</select>
						</div>
						<label class="col-sm-1 control-label">显示顺序</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="showNo" name="showNo" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" placeholder="显示顺序" data-toggle="tooltip" data-placement="bottom" >
						</div>
					</div>
					<div class="form-group">
						<div id="type">
							<label class="col-sm-2 control-label">类型</label>
							<div class="col-sm-4">
								<select id="noticeType" class="js-example-basic-single" name="noticeType" onchange="changeType();" data-query="yes" data-placement="bottom">
								    <option value="01">公告</option> 
								    <option value="02">Q&A</option>
								    <option value="03">特色</option> 
								</select>
							</div>
						</div>
						<div id="classify">
							<label class="col-sm-1 control-label">公告分类</label>
							<div class="col-sm-4">
								<rt:select2 id="noticeClassify" name="noticeClassify" dataQuery="yes" comCode="noticeClassify" ></rt:select2>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">公告内容</label>
						<div class="col-sm-9">
							<textarea id="noticeContent" name="noticeContent" cols="110" rows="8" ></textarea>
						</div>
					</div>
					<div class="form-group" id="picture">
						<label class="col-sm-2 control-label">上传图片</label>
						<div class="col-sm-4">
							<input id="noticeUpload" name="file"  type="file" >
							<input type="hidden" class="form-control" id="noticePicture" name="noticePicture">
						</div>
					</div>
					<div class="clearfix"></div>
					<div class="form-group">
						<div class="col-sm-9"></div>
						<div class="col-sm-3 text-right">
						    <button type="button" class="btn btn-default btn-xs" onclick="fncAdd();">
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
</body>
</html>