<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<s:action name="twitter!view" id="view" executeResult="false"></s:action>
<HEAD>
	<title>微博详情_</title>
	<meta name="keywords" content="微博，心情，记事" />
	<meta name="description" content="微博客，上Eshow微博，马上注册" />
	<link rel="stylesheet" href="<c:url value='/styles/twitter.css'/>"
		type="text/css" />
	<link rel="stylesheet"
		href="<c:url value='/components/moofacebox/moofacebox.css'/>"
		type="text/css" />
	<script type="text/javascript"
		src="<c:url value='/scripts/delete.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/components/moofacebox/moofacebox.js'/>"></script>
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
					<div id="content">
						<div id="mainTab">
							<ul>
								<li>
									<span><a href="<c:url value='/twitter'/>">大家的微博</a> </span>
								</li>
								<li>
									<span class="txt5"><a
										href="<c:url value='/twitter/mine'/>">我的微博</a> </span>
								</li>
								<li class="navtxt">
									<a href="<c:url value='/twitter/add'/>">继续说</a>
								</li>
							</ul>
						</div>
						<div id="twitter${view.twitter.id}">
							<div id="twittersUser" style="margin-left: -40px">
								<div id="twitterTop" style="margin-left: 30px">
									微博详细
								</div>
								<ul>
									<li>
										<div class="info">
											<span style="float: left; color: #999; padding-right: 20px;">${view.twitter.user.nickname}&nbsp;于&nbsp;<s:date
													name='%{#view.twitter.addTime}' format="yyyy-MM-dd HH:mm" />
											</span>
											<span class="tips"> <c:if
													test="${view.twitter.commentSize == null}">&nbsp;</c:if> <c:if
													test="${view.twitter.commentSize != null}">
													<a href="<c:url value='/twitter/view/${view.twitter.id}'/>"
														class="lnk1"> <c:if
															test="${view.twitter.user.id == myid}">&nbsp;&nbsp;|&nbsp;&nbsp;</c:if>回复(<span
														id="count2823">${view.twitter.commentSize}</span>)</a>
												</c:if> </span>
											<c:if test="${view.twitter.user.id==myid}">
												<span class="tips" id="twitter${view.twitter.id}"> <a
													href="<c:url value='/twitter/edit/${view.twitter.id}'/>"
													class="lnk1">修改</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
													href="javascript:void(0);"
													onclick="return deleteData('twitter',${view.twitter.id});"
													class="lnk1">删除</a> </span>
											</c:if>
										</div>
										<div class="contxt">
											${view.twitter.content}
										</div>
									</li>
								</ul>
								<s:action name="twitterComment!search" id="twitterCommentList"
									executeResult="false">
									<s:param name="queryBean.twitterId">${view.twitter.id }</s:param>
									<s:param name="queryBean.order">addTime</s:param>
									<s:param name="queryBean.desc">true</s:param>
								</s:action>
								<s:iterator value="%{#twitterCommentList.twitterComments}"
									status="rowStatus">
									<div class="commenta" id="twitterComment${id}"
										style="margin-left: 25px;">
										<div class="commenta_avatar">
											<c:if test="${user.photo == null}">
												<a
													href="/eshow/admin/twitter/workmate/${view.twitter.user.id }"><img
														src="${pageContext.request.contextPath}/common/images/user50-50.jpg"
														alt="${user.username }" width="50" height="50" /> </a>
											</c:if>
											<c:if test="${user.photo != null}">
												<a
													href="/eshow/admin/twitter/workmate/${view.twitter.user.id }"><img
														src="${pageContext.request.contextPath}/upload/user/<s:date name='%{user.addTime}' format='yyyyMMdd' />/${view.twitter.user.photo}"
														alt="${user.username }" width="50" height="50" /> </a>
											</c:if>
										</div>
										<div class="commenta_cont">
											<div class="commenta_info">
												<span class="l"><a
													href="<c:url value='/admin/user/view/${user.username }'/>"
													class="lnk1">${user.nickname}</a> 于 <s:date name='addTime'
														format="yyyy-MM-dd HH:mm" /> </span>
												<c:if
													test="${view.twitter.user.id == myid || user.id == myid}">
													<span class="tips" style="margin-top: -20px;"> <a
														href="javascript:void(0);"
														onclick="return deleteData('twitterComment',${id});"
														class="lnk1"> 删除</a> </span>
												</c:if>
											</div>
											<div class="commenta_contxt">
												${content}
											</div>
										</div>
									</div>
								</s:iterator>
								<div class="comment_textarea" id="replay"
									style="margin: -30px 0px 0px 15px;">
									<s:form action="twitterComment!save.html"
										id="twitterCommentForm" method="post">
										<input type="hidden" name="twitterId"
											value="${view.twitter.id}" />
										<br />
											回复:
											<div>
											<textarea class="textarea" name="twitterComment.content"
												onkeyup="keyup(200)" id="inputBox" cols="60" rows="10"
												onblur="this.className='textarea'"
												onfocus="this.className='textarea2'"></textarea>
										</div>
										<div class="button">
											<p style="float: left">
												<span></span>总共字数：
												<span style="color: red; margin-right: 20px">200</span>
											</p>
											<div style="padding: 5px 0;">
												<span class="r"><input type="submit" class="botton"
														value="发表" onMouseOut="this.className='botton';"
														onMouseOver="this.className='botton2';" /> </span>
											</div>
										</div>
										<div class="c h5"></div>
									</s:form>
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
