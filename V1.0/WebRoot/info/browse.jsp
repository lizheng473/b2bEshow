<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="info!browse" id="view" executeResult="false" />
<head>
	<title>${view.info.title }</title>
	<meta name="keywords" content=${view.info.title } />
</head>
<body>
	<div id="content">

		<div id="contact_banner">
		</div>
		<div id="postpath">
			<strong>当前页面：<a href="<c:url value='/'/>" title="首页">首页</a>
				&raquo; ${view.info.title}</strong>
			<c:if test="${pageContext.request.remoteUser != null}">
				<a href="<c:url value='/admin/info/edit/${view.info.id}'/>">修改</a>
			</c:if>
		</div>

		<div id="post-80" class="page">
			<div class="entry-content">
				${view.info.content}
			</div>

		</div>
		<!-- .post -->

	</div>
	<!-- #content -->

	<div id="sidebar">

		<div class="sidebar_li">
			<ul>
				<li class="page_item ">
					<a href="<c:url value='/info/about'/>" title="公司简介">公司简介</a>
				</li>
				<li class="page_item ">
					<a href="<c:url value='/info/culture'/>" title="企业文化">企业文化</a>
				</li>
				<li class="page_item ">
					<a href="<c:url value='/info/company'/>" title="下属公司">下属公司</a>
				</li>
				<li class="page_item ">
					<a href="<c:url value='/info/contact'/>" title="联系我们">联系我们</a>
				</li>
			</ul>
		</div>
	</div>
	<!-- #sidebar -->
</body>
