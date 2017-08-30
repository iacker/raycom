<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/thirdparty/bootstrap/css/bootstrap.bak.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/thirdparty/jqueryui/css/jquery-ui-1.10.2.custom.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/css/common.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/css/layout.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/page/thirdparty/jquery/jquery-1.11.0.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/page/thirdparty/jqueryui/js/jquery-ui-1.10.2.custom.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/page/thirdparty/jqueryui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/page/thirdparty/angular/angular.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/page/thirdparty/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/page/js/common/commonutil.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/page/js/common/pageutil.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/page/js/common/daterange.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/page/js/common/anpagination.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/page/js/common/anajax.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/page/js/common/validate.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/page/js/common/agularValidate.js"></script>
 <!--[if lt IE 9]>
<script src="<%=request.getContextPath()%>/page/thirdparty/bootstrap/html5shiv.js"></script>
<script src="<%=request.getContextPath()%>/page/thirdparty/bootstrap/respond.min.js"></script>
 <![endif]-->
<script type="text/javascript">
	var commonutil = commonutil || {};
	commonutil.path = '<%=request.getContextPath()%>';
	commonutil.pagePath = '<%=request.getContextPath()%>/page';
	commonutil.actionPath = '<%=request.getContextPath()%>/do';
</script>