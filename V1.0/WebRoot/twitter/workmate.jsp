<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<s:action name="user!view" id="view" executeResult="false">
	<s:param name="username">${param.id}</s:param>
</s:action>
<head>
	<title>Eshow_${view.user.nickname}的微博</title>
	<meta name="keywords" content="" />
	<meta name="keywords" content="微博，心情，记事" />
	<meta name="description" content="微博客，上Eshow微博，马上注册" />
	<link rel="stylesheet" href="<c:url value='/styles/twitter.css'/>"
		type="text/css" />
</head>
<body>
	<div id="page-wrapper">
		<img alt="" src="../../images/top-hr.png"
			style="height: 12px; margin-top: 10px; width: 980px;" />
		<table cellspacing="0" cellpadding="0"
			style="background: url(../../images/bg-body.png) repeat-y top; width: 980px;">
			<tr>
				<td width="2"></td>
				<td valign="top"
					style="background: url(../../images/bg-sec-12.png) repeat-x top; padding: 40px 40px; align: center;">
					<div>
						&nbsp;
						<img src="<c:url value='/images/twitter.jpg'/>"
							style="margin: 40px 35px -10px 35px; width: 890px; height: 210px;" />
					</div>
					<div>
						<div id="content">
							<div id="mainTab">
								<ul>
									<li>
										<span><a href="<c:url value='/twitter'/>">大家的微博
										</a> </span>
									</li>
									<li>
										<span class="txt5"><a
											href="<c:url value='/twitter/mine.jsp'/>">我的微博</a> </span>
									</li>
									<li>
										<span class="txt5"><a
											href="<c:url value='/twitter/workmate/${view.user.nickname}'/>"><strong>${view.user.nickname}的微博</strong></a> </span>
									</li>
									<li class="navtxt">
										<a href="<c:url value='/twitter/add.jsp'/>">继续说</a>
									</li>
								</ul>
							</div>
							<s:action name="twitter!search" id="twitterList"
								executeResult="false">
								<s:param name="queryBean.userId">${view.user.id}</s:param>
								<s:param name="queryBean.order">addTime</s:param>
								<s:param name="queryBean.desc">true</s:param>
							</s:action>
							<div id="twittersFriend">
								<div id="twitterTop">
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
												<span class="msg">${user.nickname}&nbsp;于&nbsp;<s:date
														name='addTime' format="yyyy-MM-dd HH:mm" /> </span>
												<span class="tips"> <a href="<c:url value='/twitter/view/${id}'/>" class="lnk1">回复(<span
														id="count2823">${commentSize}</span>)</a> </span>
											</div>
											<div class="cont">
												<span class="avatar"> <c:if
														test="${user.photo == null}">
														<a href="/eshow/user/index/${view.user.id}"><img
																src="${pageContext.request.contextPath}/common/images/user50-50.jpg"
																alt="${user.username}" width="50" height="50" /> </a>
													</c:if> <c:if test="${user.photo != null}">
														<a href="/eshow/user/index/${view.user.id}"><img
																src="${pageContext.request.contextPath}/upload/user/<s:date name='%{user.addTime}' format='yyyyMMdd' />/${user.photo}"
																alt="${user.username}" width="50" height="50" /> </a>
													</c:if> </span>
												<span class="contxt">${content}</span>
											</div>
										</li>
									</ul>
								</s:iterator>
							    <div style="text-align: center;">
								   <%@ include file="/common/page.jsp"%>
								</div>
							</div>
						</div>
					</div>
				</td>
				<td width="3"></td>
			</tr>
		</table>
		<table cellspacing="0" cellpadding="0"
			style="background: url(../../images/bg-btm-hr.png) repeat-y top; width: 980px; height: 9px;">
			<tr>
				<td></td>
			</tr>
		</table>
	</div>
</body>
