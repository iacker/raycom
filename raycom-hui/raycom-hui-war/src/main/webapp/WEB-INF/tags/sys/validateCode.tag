<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/core/include/taglib.jsp"%>
<%@ attribute name="name" type="java.lang.String" required="true" description="验证码输入框名称"%>
<%@ attribute name="inputCssStyle" type="java.lang.String" required="false" description="验证框样式"%>
<%@ attribute name="imageCssStyle" type="java.lang.String" required="false" description="验证码图片样式"%>
<%@ attribute name="buttonCssStyle" type="java.lang.String" required="false" description="看不清按钮样式"%>
<div class="row cl">
   <div class="formControls col-xs-8 col-xs-offset-3">
     <input class="input-text size-L required" type="text"  id="${name}" name="${name}" placeholder="验证码" value="" style="width:150px;${inputCssStyle}">
     <img src="${pageContext.request.contextPath}/servlet/validateCodeServlet" onclick="$('.${name}Refresh').click();" class="mid ${name}" style="${imageCssStyle}"/>
     <a href="javascript:" onclick="$('.${name}').attr('src','${pageContext.request.contextPath}/servlet/validateCodeServlet?'+new Date().getTime());" class="mid ${name}Refresh" style="${buttonCssStyle}">看不清</a></div>
</div>