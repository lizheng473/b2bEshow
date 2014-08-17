<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<s:action name="category!view" id="categoryList" executeResult="false" />
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>新闻中心</title>
		<meta name="keywords" content="新闻中心" />
		<meta name="description" content="新闻中心" />
	</head>
	<body>
		<div id="content">

			<div id="products_banner"></div>

			<div id="postpath">
				<strong>当前页面：<a href="<c:url value='/'/>" title="首页">首页</a>
					&raquo; 新闻中心</strong>
			</div>
			<div class="bd">
				<ul>
					<s:action name="blog!search" id="blogList" executeResult="false">
						<s:param name="queryBean.categoryId">${param.id}</s:param>
						<s:param name="queryBean.order">addTime</s:param>
						<s:param name="queryBean.desc">true</s:param>
						<s:param name="pagesize">10</s:param>
					</s:action>
					<s:iterator value="%{#blogList.blogs}" status="rowStatus">
						<li>
							<span class="time"><s:date name='%{addTime}'
									format='yyyy-MM-dd' /> </span><a
								href="<c:url value='/blog/view/${id}'/>" rel="bookmark">
								${title}</a>
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
					<s:action name="category!list" id="categoryList"
						executeResult="false">
					</s:action>
					<s:iterator value="%{#categoryList.categories}" status="rowStatus">
						<li class="page_item">
							<a href="<c:url value='/blog/categories/${id}'/>" title="${name}">${name}</a>
						</li>
					</s:iterator>
				</ul>
			</div>
		</div>
		<!-- #sidebar -->
	</body>
</html>