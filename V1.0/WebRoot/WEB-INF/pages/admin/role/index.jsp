<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<HEAD>
	<TITLE>角色管理</TITLE>
	<link rel="stylesheet" href="<c:url value='/admin/styles/role.css'/>"
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
								<span class="txt6"><a
									href="<c:url value='/admin/system'/>">网站参数</a> </span>
							</li>
							<li class="on">
								<span class="txt6"><a>角色管理</a> </span>
							</li>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/thumb'/>">缩略图</a> </span>
							</li>
							<li>
								<span class="txt6"><a href="<c:url value='/admin/app'/>">组件管理</a>
								</span>
							</li>
						</ul>
					</div>
					<div id="celebrityList">
						<div id="securitiesGroup">
							<s:action name="role!list" id="roleList" executeResult="false">
							</s:action>
							<ul>
								<li style="color: #666; line-height: 14px; background: #f1f1f1;">
									<span class="l">分类名称</span><span class="l">备注</span>
								</li>
								<s:iterator value="%{#roleList.roles}" status="rowStatus">
									<li onmouseover="this.style.backgroundColor='#f9f9f9';"
										onmouseout="this.style.backgroundColor='#ffffff';">
										<span class="l" style="font-size: 14px;" title="fds">${name}</span><span
											class="l c999" title="fds">${description}</span><span
											class="r setting"><a
											href="<c:url value='/admin/role/edit/${id}'/>" class="">修改</a>
										</span>
										<span class="r del"><a href="javascript:void(0)"
											onclick="DeleteBoard(1550)">删除</a> </span>
									</li>

								</s:iterator>
							</ul>
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

