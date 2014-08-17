<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>公司相册</title>
		<meta name="keywords" content="公司相册" />
		<meta name="description" content="公司相册" />
	</head>
	<body>
		<div id="content">

			<div id="postpath">
				<strong>当前页面：<a href="<c:url value='/'/>" title="首页">首页</a>
					&raquo; 公司相册</strong>
			</div>
			<div id="block-content">
				<s:action name="album!search" id="albumList" executeResult="false">
					<s:param name="queryBean.order">addTime</s:param>
					<s:param name="queryBean.desc">true</s:param>
					<s:param name="pagesize">12</s:param>
				</s:action>
				<ul>
					<s:iterator value="%{#albumList.albums}" status="rowStatus">
						<li>
							<a href="<c:url value='/album/view/${id}'/>"><img
									src="${pageContext.request.contextPath}/upload/photo/${photo}"
									alt="${name}" /> </a>
							<p>
								${name}相册
							</p>
							<p>
								<br />
								<a href="<c:url value='/album/view/${id}'/>">${photoSize}张图片</a>
								|
								<s:date name='%{addTime}' format='yyyy-MM-dd' />
							</p>
						</li>
					</s:iterator>
				</ul>
			</div>

			<div id="navigation">
			</div>

		</div>
		<!-- #content -->

		<div id="sidebar">

			<div class="sidebar_li">
				<ul>
					<s:action name="album!list" id="albumList" executeResult="false">
					</s:action>
					<s:iterator value="%{#albumList.albums}" status="rowStatus">
						<li class="page_item">
							<a href="<c:url value='/album/view/${id}'/>" title="${name}">${name}</a>
						</li>
					</s:iterator>
				</ul>
			</div>
		</div>
		<!-- #sidebar -->
	</body>
</html>