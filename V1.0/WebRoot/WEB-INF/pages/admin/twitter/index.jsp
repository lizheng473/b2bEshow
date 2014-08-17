<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<HEAD>
	<TITLE>微博客</TITLE>
	<link rel="stylesheet"
		href="<c:url value='/admin/styles/twitter.css'/>" type="text/css" />
</HEAD>
<BODY>
	<div id="main">
		<s:include value="../left.jsp"></s:include>
		<div id="mainarea">
			<div id="mainarea_bg">
				<div id="content">
					<div id="mainTop">
						<h2>
							<img src="<c:url value='/admin/images/app_list_twitter.gif'/>" />
							微博
						</h2>
					</div>
					<div id="mainTab">
						<ul>
							<li class="on">
								<span class="txt5"><a
									href="<c:url value='/admin/twitter'/>">大家的微博</a> </span>
							</li>
							<li>
								<span class="txt5"><a
									href="<c:url value='/admin/twitter/mine'/>">我的微博</a> </span>
							</li>
							<li class="navtxt">
								<a href="<c:url value='/admin/twitter/add'/>">继续说</a>
							</li>
						</ul>
					</div>
					<s:action name="twitter!search" id="twitterList"
						executeResult="false">
						<s:param name="queryBean.order">addTime</s:param>
						<s:param name="queryBean.desc">true</s:param>
					</s:action>
					<div id="friend">
						<div id="top">
							大家说的什么......
						</div>
						<s:iterator value="%{#twitterList.twitters}">
							<s:if test="%{#twitterList.twitters}==null">
								<div class="mainMsg">
									目前没有记录
								</div>
							</s:if>
							<ul>
								<li id="twitter${id}">
									<div class="info">
									   <span class="msg"><a href="<c:url value="/admin/user/view/${user.id}"/>">${user.nickname}</a>发表于：<s:date name='addTime'
												format="yyyy-MM-dd HH:mm" /> </span>
										<span class="tips"> <a
											href="<c:url value='/admin/twitter/view/${id}'/>">回复(<span	>${commentSize}</span>)</a> </span>
										<c:if test="${user.id==myid}">
											<span class="tips"> <a
												href="<c:url value='/admin/twitter/edit/${id}'/>">修改</a>&nbsp;&nbsp;|&nbsp;&nbsp;
												<a href="javascript:void(0);"
												onclick="return deleteData('twitter',${id});">删除</a>&nbsp;&nbsp;|&nbsp;&nbsp;
											</span>
										</c:if>
									</div>
									<div class="cont">
										<span class="avatar"> <a
											href="<c:url value="/admin/twitter/workmate/${user.id}"/>"> <c:if
													test="${user.photo==null}">
													<img
														src="${pageContext.request.contextPath}/common/images/user50-50.jpg"
														alt="${user.nickname}" width="50" height="50" />
												</c:if> <c:if test="${user.photo!=null}">
													<img
														src="${pageContext.request.contextPath}/upload/user/<s:date name='%{user.addTime}' format='yyyyMMdd' />/${user.photo}"
														alt="${user.nickname}" width="50" height="50" />
												</c:if> </a> </span>
										<span class="contxt">${content}</span>
									</div>
								</li>
							</ul>
						</s:iterator>
						<%@ include file="/common/page.jsp"%>
					</div>
				</div>
			</div>
			<div class="c"></div>
		</div>
		<div class="c"></div>
	</div>
</BODY>

