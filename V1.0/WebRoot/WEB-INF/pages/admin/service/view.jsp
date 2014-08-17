<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="service!view" id="view" executeResult="false">
</s:action>
<HEAD>
	<TITLE>${view.service.title}</TITLE>
	<link rel="stylesheet"
		href="<c:url value='/admin/styles/service.css'/>" type="text/css" />	
</HEAD>
<BODY>
	<div id="main">
		<s:include value="../left.jsp"></s:include>
		<div id="mainarea">
			<div id="mainarea_bg">
				<div id="content">
					<div id="mainTop">
						<h2>
							<img src="<c:url value='/admin/images/app_list_service.gif'/>" />
							服务
						</h2>
					</div>
					<div id="mainTab">
						<ul>
							<li >
								<span class="txt6"><a href="/eshow/admin/service">服务列表</a> </span>
							</li>
							<li class="on">
								<span class="txt6"><a>服务详细</a> </span>
							</li>
							<li>
								<span class="txt6"><a href="/eshow/admin/serviceType">服务分类</a> </span>
							</li>
							<li class="navtxt">
								<a href="<c:url value='/admin/service/add'/>" style="text-decoration:none;">添加服务</a>
							</li>
						</ul>
					</div>
					<div id="serviceView">
						<s:form action="service!view.html" method="post"
							cssClass="creat_form clearfix">
							<input type="hidden" name="id" value="${view.service.id}" />
							<div class="title">
								<span>${view.service.title}<br/></span><span class="r" style=" color: #999; font-size: 12px;"><a href="<c:url value='/admin/service/edit/${view.service.id}'/>">修改</a>
								</span>
								<span style="font-weight: bold; color: #999; font-size: 12px;">分类:${view.service.serviceType.name}&nbsp;&nbsp;${view.service.user.username}&nbsp;&nbsp;&nbsp;发布于${view.service.addTime}</span>
							</div><br/>
							<div  align="center">
							<c:if test="${view.service.img == null}">
								<img src="${pageContext.request.contextPath}/common/images/user50-50.jpg" width="200" height="200"/>
							</c:if>
							<c:if test="${view.service.img != null}">
								<img src="${pageContext.request.contextPath}/upload/service/<s:date name='%{#view.service.addTime}' format='yyyyMMdd' />/${view.service.img}" width="200" height="200"/>
							</c:if>
							</div>
							<div class="c"></div>
							<div class="contxt">
								&nbsp;&nbsp;${view.service.content}
							</div>
						</s:form>
					</div>
				</div>
				<div class="c"></div>
			</div>
		</div>
	</div>
</BODY>

