<%--
/**
 * ------------------------------------------------------------------------
 * @source  :  .jsp
 * @desc    : 报表导出
 * ------------------------------------------------------------------------
 * VER  DATE         AUTHOR             DESCRIPTION
 * ---  -----------  -----------------  -----------------------------------
 * 1.0  2011.05.15  csq   	  初次建立
 * ------------------------------------------------------------------------ 
 */
--%>

<%@page import="io.raycom.common.utils.excel.ExportForExcel" %>
<%@page import="io.raycom.common.utils.excel.ExcelExportor" %>
<%@page import="io.raycom.system.framework.collection.RMultiData" %>
<%@page import="io.raycom.system.framework.collection.RData" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Collection" %>
<%
	ExcelExportor exportor = (ExcelExportor)request.getAttribute("exportor");
    RMultiData result = exportor.getM_result();
    ArrayList columnName = exportor.getM_columnName();
    Map headerNameMap = exportor.getM_headerNameMap();
    String target_file = exportor.getM_fileName();
    response.reset();
    response.setContentType("application/vnd.ms-excel");
    response.setHeader("Content-Disposition",
            "attachment;filename=" + target_file + ";");
    
    ExportForExcel.buildExcel(response.getOutputStream(),result,columnName,headerNameMap);
    out.clear();
    pageContext.pushBody();
%>