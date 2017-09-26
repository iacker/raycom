<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/core/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公告详情</title>
<%@include file="/core/include/head.jsp" %>	
<link rel="stylesheet" href="${ctxStatic}/css/default/default.css">
<link rel="stylesheet" href="${ctxStatic}/plugins/kindeditor/plugins/code/prettify.css">
<script src="${ctxStatic}/plugins/kindeditor/kindeditor-all.js"></script>
<script src="${ctxStatic}/plugins/kindeditor/lang/zh-CN.js"></script>
<script type="text/javascript">
	var editor;	
	
	$(function(){
		$("#startDate").rayDatePicker();
		$("#endDate").rayDatePicker();
		$(".js-example-basic-single").select2();
		$('#form').bootstrapValidator();//表单提交时使用
		$('#noticeUpload').rayfileupload('notice');  
		$('#noticeUpload').rayfileupload('noticePicture','','Y');
	
		KindEditor.ready(function(K) {
			editor = K.create('textarea[name="noticeContent"]',{
		        uploadJson: '${ctxStatic}/plugins/kindeditor/jsp/upload_json.jsp',  
		        fileManagerJson: '${ctxStatic}/plugins/kindeditor/jsp/file_manager_json.jsp',  
		        allowFileManager: true,  
		        //上传文件后执行的回调函数,获取上传图片的路径  
		        afterUpload: function (url) {
		            var a = $("#uppics").val();
		            if (a.length > 0) {
		                $("#uppics").val(a + "," + url);
		            } else {
		                $("#uppics").val(url);
		            }
		        },
		        afterCreate: function () {  
		            this.sync();  
		        },
		        afterBlur: function () {   
		            this.sync();  
		        },
				items : ['source','fontname','fontsize','forecolor','preview','selectall','justifyleft','justifycenter','justifyright','emoticons','link','unlink','image'],
				afterChange : function() {
				this.sync(); 
				} 
				});
			editor.html($("#noticeContent").val());//设置HTML的内容
		});
	});	
	
	function fncAdd(){
		if(new Date($('#endDate').val()) < new Date($('#startDate').val())){
			rayDialog('开始时间不能大于结束时间！');
			return;
		}
		rayDialogConfirm("确认保存？",function(){
			editor.sync();
			//actSubmit($('#form'), ctx+"/notice/updateNoticeDo"); 
			$.post(
					ctx+"/notice/updateNoticeDo",
					$('#form').serialize(),
					function(data){
						if(data == 'ok'){
							return rayDialog("修改成功！",function(){
								actCancel($('#form'), ctx+"/notice/list");
							});						
						}
						actCancel($('#form'), ctx+"/notice/list");
					}
				);
		});
	}
	
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
<div id="content" class="col-xs-12 col-sm-12" >
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
				    data-bv-feedbackicons-validating="glyphicon glyphicon-refresh" >
					<input type="hidden" id="noticeId" name="noticeId" value="${notice.noticeId}">
					<input type="hidden" id="noticeContent" value="${notice.noticeContent}">
					<div class="form-group has-feedback">
						<label class="col-sm-2 control-label">公告标题</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" value="${notice.noticeTitle}" id="noticeTitle" name="noticeTitle" placeholder="parentIds" data-toggle="tooltip" data-placement="bottom" title="公告标题"
								data-bv-notempty="true"
              					data-bv-notempty-message="公告标题不能为空">
              				<span class="fa fa-check-square-o txt-danger form-control-feedback"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">开始日期</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" readonly value="${notice.startDate}" id="startDate" name="startDate"  placeholder="开始日期"   data-toggle="tooltip" data-placement="bottom" title="开始日期"
							data-bv-regexp="true"
							data-bv-regexp-regexp="^[0-9]{4}-[0-1]?[0-9]{1}-[0-3]?[0-9]{1}$"
							data-bv-regexp-message="日期格式为:XXXX-XX-XX"/>
						</div>
						<label class="col-sm-1 control-label">结束日期</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" readonly value="${notice.endDate}" id="endDate" name="endDate" placeholder="结束日期"    data-toggle="tooltip" data-placement="bottom" title="结束日期"
							data-bv-regexp="true"
							data-bv-regexp-regexp="^[0-9]{4}-[0-1]?[0-9]{1}-[0-3]?[0-9]{1}$"
							data-bv-regexp-message="日期格式为:XXXX-XX-XX"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">发布系统</label>
						<div class="col-sm-4">
							<select id="publishSys" class="js-example-basic-single" name="publishSys" onchange="changeSys();" data-query="yes" data-placement="bottom"> 
							    <option value="01" <c:if test="${notice.publishSys == '01'}">selected</c:if> >U-SC</option> 
							    <option <c:if test="${notice.publishSys == '02'}">selected</c:if> value="02">U-PS</option> 
							</select>
						</div>
						<label class="col-sm-1 control-label">显示顺序</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="showNo" name="showNo" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" placeholder="显示顺序" data-toggle="tooltip" data-placement="bottom" value="${notice.showNo}" >
						</div>
					</div>
					<div class="form-group">
						<div id="type" <c:if test="${notice.publishSys == '01'}">style="display:none"</c:if>>
							<label class="col-sm-2 control-label">类型</label>
							<div class="col-sm-4">
								<select id="noticeType" class="js-example-basic-single" name="noticeType" onchange="changeType();" data-query="yes" data-placement="bottom">
								    <option <c:if test="${notice.noticeType == '01'}">selected</c:if> value="01">公告</option> 
								    <option <c:if test="${notice.noticeType == '02'}">selected</c:if> value="02">Q&A</option>
								    <option <c:if test="${notice.noticeType == '03'}">selected</c:if> value="03">特色</option> 
								</select>
							</div>
						</div>
						<div id="classify" <c:if test="${notice.publishSys == '01' || (notice.publishSys == '02' && notice.noticeType != '01')}">style="display:none"</c:if>>
							<label class="col-sm-1 control-label">公告分类</label>
							<div class="col-sm-4">
								<rt:select2 id="noticeClassify" name="noticeClassify" dataQuery="yes" comCode="noticeClassify" value="${notice.noticeClassify}"></rt:select2>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">公告内容</label>
						<div class="col-sm-9">
							<textarea id="noticeContent" name="noticeContent" cols="110" rows="8" ></textarea>
						</div>
					</div>
					<div class="form-group" id="picture" <c:if test="${notice.publishSys == '02' && notice.noticeType == '02'}">style="display:none"</c:if>>
						<label class="col-sm-2 control-label">上传附件</label>
						<div class="col-sm-4">
							<input id="noticeUpload" name="file"  type="file" >
							<input type="hidden" class="form-control" id="noticePicture" name="noticePicture" value="${notice.noticePicture}">
							<c:if test="${notice.noticePicture!=null && notice.noticePicture!=''}">
								<a href="${ctx}/file/download?fileId=${notice.noticePicture}" target="_blank">${fns:getFileOrigName(notice.noticePicture)}</a>
							</c:if>
						</div>
					</div>
					<div class="clearfix"></div>
					<div class="form-group">
						<div class="col-sm-9"></div>
						<div class="col-sm-3 text-right">
						    <shiro:hasPermission name="notice:create">
						    <button type="button" class="btn btn-default btn-xs" onclick="fncAdd();">
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
