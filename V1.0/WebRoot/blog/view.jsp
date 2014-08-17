<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<s:action name="blog!view" id="view" executeResult="false"></s:action>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>${view.blog.title}</title>
		<meta name="keywords" content="${view.blog.title}" />
		<meta name="description" content="${view.blog.title}" />
	</head>
	<body>
		<div id="content">
			<div id="postpath">
				<strong>当前页面：<a href="<c:url value='/'/>" title="首页">首页</a>
					&raquo; ${view.blog.title}</strong>
				<c:if test="${pageContext.request.remoteUser != null}">
					<a href="<c:url value='/admin/blog/edit/${view.blog.id}'/>">修改</a>
				</c:if>
			</div>

			<div id="post-80" class="page">
				<div class="entry-content">
					${view.blog.content}
				</div>
			</div>
			<!-- .post -->

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