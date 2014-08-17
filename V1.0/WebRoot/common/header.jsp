<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<c:if test="${pageContext.request.remoteUser == null}">
    <div id="switchLocale"><a href="login.jsp">登录</a> <a href="signup.html">注册</a></div>
</c:if>
<c:if test="${pageContext.request.remoteUser != null}">
 <div id="switchLocale">欢迎：<authz:authentication operation="username"/> <a href="logout.jsp">退出</a></div>
</c:if>
<div id="branding">
    <h1><a href="<c:url value='/'/>">到群</a></h1>
    <p>体验群组的时代</p>
</div>
<div>
    <a href="">首页</a> <a href="<c:url value='/event'/>">所有群组(可以下拉)</a> <a href="<c:url value='/event'/>">Group活动</a> <a href="<c:url value='/mini/group'/>">Mini群组</a> <a href="<c:url value='/groupCategory'/>">群组分类</a> <a href="<c:url value='/website'/>">群组网站</a> <a href="<c:url value='/addGroup'/>">收录群组</a> 
</div>
<hr />
<%-- Put constants into request scope --%>
<appfuse:constants scope="request"/>