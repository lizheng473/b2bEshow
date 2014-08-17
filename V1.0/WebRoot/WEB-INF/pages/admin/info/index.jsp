<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<HEAD>
	<TITLE>信息</TITLE>
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
					<div id="celebrityList">
						<div id="securitiesGroup">
							<s:action name="info!search" id="infoList" executeResult="false">
							</s:action>
							<ul>
								<li style="color: #666; line-height: 14px; background: #f1f1f1;">
									<span class="l">标题</span><span class="l">URL</span>
								</li>
								<s:iterator value="%{#infoList.infos}" status="rowStatus">
									<li id="info${id}"
										onmouseover="this.style.backgroundColor='#f9f9f9'"
										onmouseout="this.style.backgroundColor='#ffffff';">
										<span class="l" style="font-size: 14px;" title="fds"><a
											href="<c:url value='/admin/info/view/${id}'/>" class="">${title}</a>
										</span>
										<span class="l c999" title="fds">${url}</span>
										<a href="<c:url value='/admin/info/edit/${id}'/>">修改</a>&nbsp;|&nbsp;
										<a href="javascript:void(0);"
											onclick="return deleteData('info',${id});">删除</a>
									</li>
								</s:iterator>
							</ul>
							<%@ include file="/common/page.jsp"%>
						</div>
						<div class="c"></div>
					</div>
				</div>
				<div class="c"></div>
			</div>
			<div class="c"></div>
			<div class="boxs3_rt"></div>
			<div class="boxs3_lb"></div>
			<div class="boxs3_rb"></div>
		</div>
	</div>
</BODY>

