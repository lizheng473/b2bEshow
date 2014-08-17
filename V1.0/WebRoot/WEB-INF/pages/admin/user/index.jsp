<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<HEAD>
	<TITLE>用户列表</TITLE>
	<link rel="stylesheet"
		href="<c:url value='/admin/styles/profile.css'/>" type="text/css" />
</HEAD>
<BODY>
	<div id="main">
		<s:include value="../left.jsp"></s:include>
		<div id="mainarea">
			<div id="mainarea_bg">
				<div id="content">
					<div id="mainTop">
						<h2>
							<img src="<c:url value='/admin/images/app_list_user.gif'/>" />
							用户管理
						</h2>
					</div>
					<div id="mainTab">
						<ul>
							<li>
								<span class="on"><a href="<c:url value='/admin/user'/>">用户列表</a>
								</span>
							</li>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/user/edit'/>">修改资料</a> </span>
							</li>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/user/password'/>">修改密码</a> </span>
							</li>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/user/setphoto'/>">修改头像</a> </span>
							</li>
							<li class="navtxt">
								<a href="<c:url value='/admin/user/add'/>">添加用户</a>
							</li>
						</ul>
					</div>
					<div id="celebrityList">
					<%@ include file="/common/messages.jsp"%>
						<div id="securitiesGroup">
							<s:action name="user!search" id="userList" executeResult="false">
								<s:param name="userQueryBean.pagesize">10</s:param>
							</s:action>
							<ul>
								<li style="color: #666; line-height: 14px; background: #f1f1f1;">
									<span class="l">用户ID</span><span class="l">用户名</span><span
										class="l">账户状态</span>
								</li>
								<s:iterator value="%{#userList.users}" status="rowStatus">
									<li id="user${id}"
										onmouseover="this.style.backgroundColor = '#f9f9f9';" onmouseout="this.style.backgroundColor = '#ffffff';">
										<span class="l" style="font-size: 14px;"><a
											href="<c:url value='/admin/user/view/${id}'/>" class="">${id}</a>
										</span>
										<span class="l c999"><a
											href="<c:url value='/admin/user/view/${id}'/>">${username}</a></span>
										<span class="l c999"><s:if test="%{enabled}">可用</s:if><s:else>不可用</s:else></span>
										<a href="<c:url value='/admin/user/edit/${id}'/>">修改</a>&nbsp;|&nbsp;
										<a  href="javascript:void(0);"
											onclick="return deleteData('user',${id});">删除</a>
									</li>
								</s:iterator>
							</ul>
						</div>
						<div class="pager">
							<div id="articeBottom">
								<%@ include file="/common/page.jsp"%>
							</div>
						</div>
						<div class="c"></div>
					</div>
				</div>
				<div class="c"></div>
			</div>
		</div>
	</div>
</BODY>

