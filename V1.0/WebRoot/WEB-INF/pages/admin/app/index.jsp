<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<HEAD>
	<TITLE>日志</TITLE>
	<link rel="stylesheet"
		href="<c:url value='/admin/styles/app.css'/>" type="text/css" />
</HEAD>
<BODY>
	<div id="main">
		<s:include value="../left.jsp"></s:include>
		<div id="mainarea">
			<div id="mainarea_bg">
				<div id="content">
					<div id="mainTop">
						<h2>
							<img src="<c:url value='/admin/images/app_m_set.gif'/>" />
							管理组件
						</h2>
					</div>
					<div id="mainTab">
						<ul>
							<li>
								<span class="txt6"><a href="<c:url value='/admin/system'/>">网站参数</a>
								</span>
							</li>
							<li>
								<span class="txt6"><a href="<c:url value='/admin/role'/>">角色管理</a>
								</span>
							</li>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/thumb'/>">缩略图</a> </span>
							</li>
							<li class="on">
								<span class="txt6"><a>组件管理</a> </span>
							</li>
						</ul>
					</div>
					<div class="mainMsg">
						系统组件稍后开放
					</div>
				</div>
				<div class="c"></div>
			</div>
			<div class="c"></div>
		</div>
	</div>
</BODY>

