<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/common/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="icon" href="<c:url value="/images/favicon.ico"/>" />
		<title><decorator:title />_江苏华权有色炉料有限公司</title>
		<script type="text/javascript"
			src="<c:url value='/common/scripts/mootools-1.2.4-core-yc.js'/>"></script>
		<script type="text/javascript"
			src="<c:url value='/common/scripts/mootools-1.2.4.2-more.js'/>"></script>
		<script type="text/javascript"
			src="<c:url value='/common/scripts/slider.js'/>"></script>
		<link rel="stylesheet" href="<c:url value='/styles/style.css'/>"
			type="text/css" />
		<decorator:head />
	</head>
	<body
		<decorator:getProperty property="body.id" writeEntireProperty="true"/>
		<decorator:getProperty property="body.class" writeEntireProperty="true"/>>
		<div id="wrapper">
			<div id="header">
				<a href="<c:url value='/'/>" title="江苏华权有色炉料有限公司"><div id="logo"></div>
				</a>
				<div class="fixed"></div>
			</div>
			<!--  #header -->

			<div id="menubar">
				<ul id="menus" class="menus">
					<li class="page_item">
						<a href="<c:url value='/'/>" title="首页">首页</a>
					</li>

					<li class="page_item">
						<a href="<c:url value='/blog/categories/1'/>" title="公司新闻">公司新闻</a>
					</li>

					<li class="cat-item">
						<a href="<c:url value='/info/price'/>" title="报价中心">报价中心</a>
					</li>

					<li class="page_item">
						<a href="<c:url value='/album/view/3'/>" title="荣誉证书">荣誉证书</a>
					</li>
					
					<li class="page_item">
						<a href="<c:url value='/album'/>" title="公司相册">公司相册</a>
					</li>

					<li class="cat-item">
						<a href="<c:url value='/info/about'/>" title="公司简介">公司简介</a>
					</li>
					<li class="cat-item">
						<a href="<c:url value='/info/contact'/>" title="联系我们">联系我们</a>
					</li>
				</ul>
			</div>
			<div id="container">

				<decorator:body />
				<div id="about">
					<a href="<c:url value='/info/contact'/>">联系我们</a> |
					<a href="<c:url value='/info/law'/>">免责条款</a> |
					<a href="<c:url value='/'/>">江苏华权</a> |
					技术支持：<a href="http://bangqu.com" target="_blank">帮趣</a><a href="http://www.daoqun.net" target="_blank">到群软件</a> | 
					<a href="<c:url value='/admin'/>" target="_blank">后台管理</a>
				</div>
				<div id="footer">
					版权所有@2010,江苏华权有色炉料有限公司 苏ICP备0001212号 电话：0510-86880100，0510-86891620 
				</div>
				<!-- #footer -->
			</div>
			<!-- container -->
		</div>
		<!-- #wrapper -->
	</body>
</html>
