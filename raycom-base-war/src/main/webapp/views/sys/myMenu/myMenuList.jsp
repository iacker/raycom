<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<%@ include file="/core/include/taglib.jsp"%>
<!DOCTYPE html>
<HTML>
<HEAD>
<TITLE>菜单管理</TITLE>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@include file="/core/include/head.jsp"%>
<title>菜单管理</title>
<link rel="stylesheet" href="${ctxStatic}/plugins/zTree/css/metroStyle/metroStyle.css" type="text/css">
<script type="text/javascript">
	var index=0;
	$(document).ready(function() {
		 for(var i=0,allDoc=document.getElementsByName("nums");i<allDoc.length;i++){
				index=allDoc[allDoc.length-1].value;
			}
	}); 


	 var setting = {
		edit: {
			enable: true,
			showRemoveBtn: false,
			showRenameBtn: false
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback : {
			onClick : fncTreeNodeClick
		}
	};
	
	$(function() {
		fncInitMenu();
	});
	
	//鼠标单击执行的事件
	function fncTreeNodeClick(event, treeId, treeNode) {
		if( treeNode.isParent){
			return;
		}
		
		var arr=[];
		for(var i=0,allDoc=document.getElementsByName("menuId");i<allDoc.length;i++){
			arr[i]=allDoc[i].value;
		}
		
		
		$.ajax({
			url: ctx+"/myMenu/searchById",
			data: { menuId: treeNode.id},
			type: "POST",
			success: function(data){
				for(var i=0;i<arr.length;i++){
					if(arr[i]==data.menuId){
						rayDialog("菜单已添加！");
						return;
					}
					if(arr.length==11){
						rayDialog("添加菜单不能超过十个！");
						return;
					}
				}
				index=parseInt(index)+1;
				var trHTML ="<tr id="+data.menuId+"><td>"+index+"<input type='hidden' name='menuName' value="+data.name+"><input type='hidden' name='nums' value="+index+"></td><td>"+data.name+"<input type='hidden' name='menuId' value="+data.menuId+"></td><td> <button id='qw' type='button' class='btn btn-default btn-xs' onclick='fncDel("+data.menuId+")'>删&nbsp;除</button></td></tr>";
				$("#tab").append(trHTML);
				
			}
		}); 
	}
	
	//初始化
	function fncInitMenu() {
		$.ajax({
			async : false,
			cache : false,
			type : "post",
			url : ctx + "/myMenu/getAllNode",
			success : function(data) {
				zTree = $.fn.zTree.init($("#tree"), setting, data);
				zTree.expandNode(zTree.getNodes(),true,false,true);
			},
			error : function() {
				rayDialog("请求失败")
			}
		});
	}
	
	function fncDel(menuId){
		$("#"+menuId+"").remove();
	}
	
	function fncAdd(){
		rayDialogConfirm("确认保存？",function(){
			$.ajax({
				url: ctx+"/myMenu/insertMyMenu",
				data: $('#form').serialize() ,
				type: "POST",
				success: function(){
					rayDialog("保存成功！",function(){
						actCancel($('#form'), ctx + "/myMenu");
					});
					
				}
			}); 
		});
	}

</script>
</head>
<body>
<div id="content" class="col-xs-12 col-sm-12">
		<rt:navigation/>
		<div class="row">
			<div class="box">
			<%@include file="/core/include/boxHead.jsp" %>
			<div id="box-content" class="col-xs-12 col-sm-12">
			<div class="form-group">
				<div class="box-content col-xs-6 col-sm-6">
					<div class="well" style="position:absolute; height:400px; width:350px; overflow:auto">
						<div class="ztreeBackground left">
							<ul id="tree" class="ztree"></ul>
						</div>
					</div>
				</div>
				<div class="box-content col-xs-6 col-sm-6">
					<div class="well">
						<form class="form-horizontal" id="form"	 method="post">
							<div class="form-group has-feedback">
									<label class="col-sm-2 control-label">我的菜单</label>
									<b style="color:#F22; font-size:12px">(添加我的菜单数量不能超过十个)</b>
									<table class="table table m-table table-bordered table-hover table-heading" id="tab">
										<thead>
											<tr>
												<th>序号</th>
												<th>菜单</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${myMenuList}" var="myMenuList">
												<tr id="${myMenuList.menuId}">
													<td>${myMenuList.num}<input type="hidden" name="menuName" value="${myMenuList.menuName}"><input type="hidden" name="nums" value="${myMenuList.num}"></td>
													<td>${myMenuList.menuName}<input type="hidden" name="menuId" value="${myMenuList.menuId}"></td>
													<td><button type="button" class="btn btn-default btn-xs" onclick="fncDel('${myMenuList.menuId}')" >删&nbsp;除</button></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
							</div>
							<div class="form-group" >
								<div class="col-sm-9"></div>
								<div class="col-sm-3 text-right">
					   					<button type="button" class="btn btn-default btn-xs" id="button" onclick="fncAdd()">
											保&nbsp;存
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
</div>
<script type="text/javascript" src="${ctxStatic}/plugins/zTree/js/jquery.ztree.all.js"></script>
</body>
</html>