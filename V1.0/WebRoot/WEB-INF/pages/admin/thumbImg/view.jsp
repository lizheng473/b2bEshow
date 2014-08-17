<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="thumb!view" id="view" executeResult="false">
</s:action>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<HEAD>
	<TITLE>${view.thumb.name}</TITLE>
	<link rel="stylesheet" href="<c:url value='/admin/styles/blog.css'/>"
		type="text/css" />
</HEAD>
<BODY>
	<DIV id=main>
		<!--应用导航-->
		<s:include value="../left.jsp"></s:include>
		<!--/应用导航-->
		<div id="mainarea">
			<div id="mainarea_bg">
				<div id="content">
					<!--栏目导航-->
					<div id="mainTop">
						<h2>
							<img class="icon-app app-education"
								src="/content/images/space.gif" />
							缩略图规则
						</h2>
					</div>
					<!-- 文章页面导航 -->
					<div id="mainTab">
						<ul>
							<li>
								<span class="txt6"><a href="<c:url value='/admin/thumb'/>">缩略图规则</a>
								</span>
							</li>
						</ul>
					</div>
					<!-- 文章页面导航 -->
					<!--/栏目导航-->
					<div id="educationView">
						<s:form action="thumb!view.html" method="post"
							cssClass="creat_form clearfix">
							<input type="hidden" name="id" value="${view.thumb.id}" />
							<br />
							<div class="contxt">
								名称： &nbsp;&nbsp;${view.thumb.name}
							</div>
							<div class="contxt">
								类型： &nbsp;&nbsp;${view.thumb.model}
							</div>
							<div class="contxt">
								宽x高： &nbsp;&nbsp;${view.thumb.width}&nbspx&nbsp${view.thumb.height}
							</div>
							<div class="c"></div>
							<div class="contxt">
							 描述: &nbsp;&nbsp;${view.thumb.description}
							</div>
						</s:form>
					</div>
				</div>
				<div class="c"></div>
			</div>
		</div>
	</DIV>
</BODY>

