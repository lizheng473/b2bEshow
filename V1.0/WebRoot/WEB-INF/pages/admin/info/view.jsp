<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="info!view" id="view" executeResult="false" />
<HEAD>
	<TITLE>${view.info.title}</TITLE>
	<link rel="stylesheet" href="<c:url value='/admin/styles/info.css'/>"
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
							<img src="<c:url value='/admin/images/app_list_info.gif'/>" />
							信息中心
						</h2>
					</div>
					<div id="mainTab">
						<ul>
							<li class="on">
								<span class="txt6"><a href="<c:url value='/admin/info'/>">信息列表</a>
								</span>
							</li>
							<li class="navtxt">
								<a href="<c:url value='/admin/info/add'/>">添加信息</a>
							</li>
						</ul>
					</div>
					<div id="accContent">
						<div class="title" style="margin-top: 10px;">
							${view.info.title}
							<div class="navtxt">
								<a href="javascript:window.history.back()">返回上一级</a>
							</div>
						</div>
						<div class="contxt">
							${view.info.content}
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</BODY>

