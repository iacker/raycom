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
	var setting = {
			view: {
				selectedMulti: false
			},
			check: {
				enable: true,
				chkStyle: "radio",
				radioType: "all"
			},
			callback: {
				onCheck: onCheck,
				onClick: onClick
			},
			data: {
				simpleData: {
					enable: true
				}
			}
	};
	var zTree;
	$(function() {
		getTree();
		$('#btnClose').on('click', function () {
			parent.popup.close();
		});
		$('#btnClear').on('click', function () {
			parent.popup.close(setCleanValue());
		});
		
		$('#popSearch').on('change', function () {
			getTree()
		});
		
		
	});
	
	function onCheck(){
		parent.popup.close(getCheckedValue());
	}
	
	function getTree(){
		var treeLvl="";
		if(parent.treeLvl) 
			treeLvl = parent.treeLvl
		$.ajax({
			async : true,
			cache : true,
			type : "post",
			data : {
				popSearch:$("#popSearch").val(),
				treeLvl:treeLvl
			},
			url : ctx + parent.dataUrl,
			success : function(data) {
				zTree = $.fn.zTree.init($("#tree"), setting,  data);
				if($("#popSearch").val()!='')
					zTree.expandAll(true);
				else
					zTree.expandNode(zTree.getNodes()[0],true,false,true);
				if(parent.selectedValue){
					node =zTree.getNodeByParam("id",parent.selectedValue,null); 
					if(node)
						zTree.checkNode(node,true);
				}
			}
		});
	}
	
	function getCheckedValue(){
		var zTree = $.fn.zTree.getZTreeObj("tree");
		var nodes = zTree.getCheckedNodes(true);
		var result ={id:'',name:''};
		if(nodes.length>0){
			result.id=nodes[0].id;
			result.name=nodes[0].name; 
		}
		return result;
	}
	
	function onClick(event, treeId, treeNode, clickFlag) {
		var result ={id:'',name:''};
			result.id=treeNode.id;
			result.name=treeNode.name; 
		parent.popup.close(result);
	}
	
	function setCleanValue(){
		var result ={};
		result.id="";
		result.name=""; 
		return result;
	}
</script>
</head>
<body>

	<div class="box-content" style="width:400px;height:400px;">
	<div class="form-group">
		<div class="well col-sm-12" style="width:350px;height:300px; overflow: auto;">
			<div class="ztreeBackground left" style="position:absolute; height:400px; width:350px; overflow:auto">
				<ul style="padding-left: 0px;" >
					<input  class="form-control" id="popSearch" name="popSearch"  type="text" placeholder="请输入中文名称关键字"/> 
				</ul>
				<ul id="tree" class="ztree" style="margin-top: -10px;"></ul>
			</div>
		</div>
	</div>
	<div class="form-group" style="text-align: center;">
				<button type="button" class="btn btn-default btn-xs"  id="btnClear">
					清&nbsp;空
				</button>
				<button type="button" class="btn btn-default btn-xs"  id="btnClose">
					关&nbsp;闭
				</button>
			</div>
</div>
<script type="text/javascript" src="${ctxStatic}/plugins/zTree/js/jquery.ztree.all.js"></script>
<script type="text/javascript" src="${ctxStatic}/plugins/artDialog-6.0.4/dialog-plus.js"></script>
</body>
</html>