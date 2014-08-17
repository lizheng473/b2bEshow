<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/common/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="icon" href="<c:url value="/images/favicon.ico"/>" />
		<title><decorator:title />_江苏华权后台管理</title>
		<script type="text/javascript"
			src="<c:url value='/common/scripts/mootools-1.2.4-core-yc.js'/>"></script>
		<script type="text/javascript"
			src="<c:url value='/common/scripts/mootools-1.2.4.2-more.js'/>"></script>
		<script type="text/javascript"
			src="<c:url value='/common/scripts/pngfix.js'/>"></script>
		<script type="text/javascript"
			src="<c:url value='/admin/scripts/admin.js'/>"></script>
		<script type="text/javascript" charset="utf-8"
		src="<c:url value="/components/kindeditor/kindeditor.js"/>"></script>
		<link rel="stylesheet"
			href="<c:url value='/admin/styles/layout.css'/>" type="text/css" />
		<link rel="stylesheet" href="<c:url value='/admin/styles/user.css'/>"
			type="text/css" />
		<decorator:head />
	</head>
	<body
		<decorator:getProperty property="body.id" writeEntireProperty="true"/>
		<decorator:getProperty property="body.class" writeEntireProperty="true"/>>
		<!--header-->
		<div id="header">
			<div class="logo">
				<a href="<c:url value='/admin'/>"></a>
			</div>
			<ul class="menu">
				<li>
					<a href="<c:url value='/admin'/>">管理首页</a>
				</li>
				<li>
					<a href="<c:url value='/'/>" target="_blank">预览前台</a>
				</li>
			</ul>
			<div class="nav_account">
				<a href="<c:url value='/admin/user'/>">用户</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="<c:url value='/admin/user'/>">帮助</a>&nbsp;&nbsp;|&nbsp;&nbsp;
					<a href="<c:url value='/admin/user/view'/>" class="lnk1">欢迎：<authz:authentication operation="nickname" /> </a>	&nbsp;&nbsp;
				<a href="<c:url value='/logout'/>">退出</a>
			</div>
		</div>
		<!--/header-->
		<!--Sub page content start-->
		<decorator:body />
		<!--Sub page content end-->
		<!--footer-->
		<div id="footer">
			<div class="l">
				江苏华权后台管理 &copy; 2009&nbsp;&nbsp;技术支持：
				<a href="http://www.daoqun.net" target="_blank">无锡到群软件科技有限公司</a>
			</div>
			<div class="r">
				<a href="<c:url value='/blog'/>" target="_blank">开发博客</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="<c:url value='/help'/>" target="_blank">帮助中心</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="http://www.miibeian.gov.cn/" target="_blank">网站备案</a>
			</div>
		</div>
		<!--/footer-->
	</body>
</html>
