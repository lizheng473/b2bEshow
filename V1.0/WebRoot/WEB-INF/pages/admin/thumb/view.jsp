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
	<link rel="stylesheet" href="<c:url value='/admin/styles/thumb.css'/>"
		type="text/css" />
</HEAD>
<BODY>
	<div id="main">
		<s:include value="../left.jsp"></s:include>
		<div id="mainarea">
			<div id="mainarea_bg">
				<div id="content">
					<div id="mainTop">
						<h2>
							<img src="<c:url value='/admin/images/app_list_system.gif'/>" />
							系统管理
						</h2>
					</div>
					<div id="mainTab">
						<ul>
							<li>
								<span class="txt6"><a href="<c:url value='/admin/thumb'/>">缩略图规则</a>
								</span>
							</li>
							<li class="navtxt">
								<a href="<c:url value='/admin/thumb/add'/>">添加缩略图规则</a>
							</li>
						</ul>
					</div>
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

