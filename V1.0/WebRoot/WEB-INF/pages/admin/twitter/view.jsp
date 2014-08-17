<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<s:action name="twitter!view" id="view" executeResult="false"></s:action>
<c:if test="${view.twitter.id==null}">
	<script>location.href="<c:url value='/admin/twitter'/>";</script>
</c:if>
<HEAD>
	<TITLE>微博客</TITLE>
	<link rel="stylesheet"
		href="<c:url value='/admin/styles/twitter.css'/>" type="text/css" />
	<link media="screen" type="text/css"
		href="<c:url value='/scripts/validate/theme/grey/formcheck.css'/>"
		rel="stylesheet" />
	<script type="text/javascript"
		src="<c:url value='/scripts/validate/lang/zh-CN.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/scripts/validate/formcheck.js'/>"></script>
	<script type="text/javascript">
		window.addEvent('domready', function() {
			new FormCheck('twitterCommentForm');
		});
    </script>
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
							<li>
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
					<div id="twitter${view.twitter.id}">
						<div id="workmate">
							<div id="top">
								微博详细
							</div>
							<ul>
								<li>
								   <span>
									<a href="/eshow/admin/twitter/workmate/${view.twitter.user.id}">
										<c:if test="${view.twitter.user.photo==null}">
											<img
												src="${pageContext.request.contextPath}/common/images/user50-50.jpg"
												alt="${user.nickname}" width="50" height="50" />
										</c:if> <c:if test="${view.twitter.user.photo!=null}">
											<img
												src="${pageContext.request.contextPath}/upload/user/<s:date name='%{#view.twitter.user.addTime}' format='yyyyMMdd' />/${view.twitter.user.photo}"
												alt="${view.twitter.user.nickname}" width="50" height="50" />
										</c:if> </a>
									</span>
									<div class="info">
										<span class="msg"> <a
											href="<c:url value='/admin/user/view/${user.id }'/>">${view.twitter.user.nickname}</a>&nbsp;&nbsp;于
											<s:date name='%{#view.twitter.addTime}'
												format="yyyy-MM-dd HH:mm" />&nbsp;&nbsp;发表 </span>
										<span class="tips"> <a
											href="<c:url value='/admin/twitter/view/${view.twitter.id}'/>">回复(<span
												id="count2823">${view.twitter.commentSize}</span>)</a> </span>
										<c:if test="${view.twitter.user.id==myid}">
											<span class="tips"> <a
												href="<c:url value='/admin/twitter/edit/${view.twitter.id}'/>">修改</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
												href="javascript:void(0);"
												onclick="return deleteData('twitter',${view.twitter.id});">删除</a>&nbsp;&nbsp;|&nbsp;&nbsp;
											</span>
										</c:if>
									</div>
									<div class="contxt1">
										${view.twitter.content}
									</div>
								</li>
							</ul>
							<s:action name="twitterComment!search" id="twitterCommentList"
								executeResult="false">
								<s:param name="queryBean.twitterId">${view.twitter.id }</s:param>
								<s:param name="queryBean.desc">true</s:param>
							</s:action>
							<s:iterator value="%{#twitterCommentList.twitterComments}"
								status="rowStatus">
								<div class="commenta" id="twitterComment${id}">
									<div class="commenta_avatar">
										<a href="/eshow/admin/twitter/workmate/${user.id }"> <c:if
												test="${user.photo==null}">
												<img
													src="${pageContext.request.contextPath}/common/images/user50-50.jpg"
													alt="${user.nickname}" width="50" height="50" />
											</c:if> <c:if test="${user.photo!=null}">
												<img
													src="${pageContext.request.contextPath}/upload/user/<s:date name='%{user.addTime}' format='yyyyMMdd' />/${user.photo}"
													alt="${user.nickname}" width="50" height="50" />
											</c:if> </a>
									</div>
									<div class="commenta_cont">
										<div class="commenta_info">
											<span class="l"><a
												href="<c:url value='/admin/user/view/${user.id}'/>">${user.nickname}</a>
												于 <s:date name='addTime' format="yyyy-MM-dd HH:mm" /> 回复</span>
											<c:if test="${view.twitter.user.id==myid || user.id==myid}">
												<span class="r"> <a href="javascript:void(0);"
													onclick="return deleteData('twitterComment',${id});">
														删除</a> </span>
											</c:if>
										</div>
										<div class="commenta_contxt">
											${content}
										</div>
									</div>
								</div>
							</s:iterator>
						    <div style="margin-left:80px;">
								<s:form action="twitterComment!save.html"
									id="twitterCommentForm" method="post">
									<input type="hidden" name="twitterId" value="${view.twitter.id}" />
									<div>
										<textarea class="inputtext text-input validate['required']"
											      name="twitterComment.content" onblur="this.className='textarea'"
											      onfocus="this.className='textarea2'"
											      id="inputBox" style="width: 400px; height: 80px;"></textarea>
										 <p style="margin-top: 5px;"><input type="submit" class="botton"
											value="发表" onMouseOut="this.className='botton';"
											onMouseOver="this.className='botton2';" /></p>
									</div>
								</s:form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="c"></div>
		</div>
		<div class="c"></div>
	</div>
</BODY>

