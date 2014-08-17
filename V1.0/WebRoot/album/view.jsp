<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<s:action name="album!view" id="view" executeResult="false"></s:action>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>${view.album.name}</title>
		<meta name="keywords" content="${view.album.name}" />
		<meta name="description" content="${view.album.name}" />
	</head>
	<body>
		<div id="content">
			<div id="postpath">
				<strong>当前页面：<a href="<c:url value='/'/>" title="首页">首页</a>
					&raquo; <a href="<c:url value='/album'/>" title="公司相册">公司相册</a>
					&raquo; ${view.album.name}</strong>
				<c:if test="${pageContext.request.remoteUser != null}">
					<a href="<c:url value='/admin/album/edit/${view.album.id}'/>">修改</a>
				</c:if>
			</div>

			<div id="block-content">
				<s:action name="photo!search" id="photoList" executeResult="false">
					<s:param name="queryBean.albumId">${view.album.id}</s:param>
					<s:param name="queryBean.order">addTime</s:param>
					<s:param name="queryBean.desc">true</s:param>
					<s:param name="pagesize">12</s:param>
				</s:action>
				<ul>
					<s:iterator value="%{#photoList.photos}" status="rowStatus">
						<li>
							<a href="<c:url value='/photo/view/${id}'/>"><img
									src="${pageContext.request.contextPath}/upload/photo/<s:date name='%{addTime}' format='yyyyMMdd' />/${img}"
									alt="${name}" /> </a>
							<p>
								${name}
							</p>
						</li>
					</s:iterator>
				</ul>
			</div>

			<div id="post-80" class="page">
				<div class="entry-content">
					相册描述：${view.album.description}
				</div>
			</div>
			<!-- .post -->

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