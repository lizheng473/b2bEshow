<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<s:action name="category!view" id="view" executeResult="false" />
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<HEAD>
	<TITLE>_日志</TITLE>
	<link rel="stylesheet" href="<c:url value='/admin/styles/blog.css'/>"
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
							<img src="<c:url value='/admin/images/app_list_blog.gif'/>" />
							日志
						</h2>
					</div>
					<div id="mainTab">
						<ul>
							<li class="txt6">
								<span class="txt6"><a href="<c:url value='/admin/blog'/>">日志列表</a>
								</span>
							</li>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/blog/mine'/>">我的日志</a> </span>
							</li>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/category'/>">分类管理</a> </span>
							</li>
							<li class="navtxt">
								<a href="<c:url value='/admin/blog/add'/>">发表日志</a>
							</li>
							<li class="bnt1">
								<span class="txt6"><a
									href="<c:url value='/admin/topic'/>">讨论区</a> </span>
							</li>
						</ul>
					</div>
					<div id="column">
						<div id="analysis">
							<div class="subtitle">
								<span class="l">${view.category.name}</span>
							</div>
							<s:action name="blog!search" id="newsBlogList"
								executeResult="false">
								<s:param name="queryBean.order">addTime</s:param>
								<s:param name="queryBean.categoryId">${view.category.id}</s:param>
								<s:param name="queryBean.desc">true</s:param>
								<s:param name="queryBean.pagesize">9</s:param>
							</s:action>
							<ul class="flist">
								<s:iterator value="%{#newsBlogList.blogs}" status="rowStatus">
									<li id="blog${id}" onmouseover='this.style.backgroundColor ="#f9f9f9"'
										onmouseout='this.style.backgroundColor =""'>
										<div class="avatar">
											<a href="<c:url value="/admin/user/view/${user.id}"/>">
												<c:if test="${user.photo==null}">
													<img  src="${pageContext.request.contextPath}/common/images/user50-50.jpg"
														  alt="${user.nickname}" width="50" height="50" />
												</c:if> <c:if test="${user.photo!=null}">
													<img  src="${pageContext.request.contextPath}/upload/user/<s:date name='%{user.addTime}' format='yyyyMMdd' />/${user.photo}"
														  alt="${user.nickname}" width="50" height="50" />
												</c:if>
											 </a>
										</div>
										<div class="name">
											<a href="<c:url value='/user/view/${user.id}'/>">${user.nickname}</a>
										</div>
										<div class="cont">
											<div class="tips">
												评论(${commentSize })&nbsp;&nbsp;|&nbsp;&nbsp;浏览(${count})&nbsp;&nbsp;|&nbsp;&nbsp;
												<c:if test="${user.id==myid}">
													<span> <a
														href="<c:url value='/admin/blog/edit/${id}'/>">修改</a>&nbsp;&nbsp;|&nbsp;&nbsp;
														<a href="javascript:void(0);"
														onclick="return deleteData('blog',${id});">删除</a>&nbsp;&nbsp;
													</span>
												</c:if>
											</div>
											<div class="title">
												<a href="<c:url value='/admin/blog/view/${id}'/>">${title}</a>&nbsp;&nbsp;&nbsp;&nbsp;
											</div>
											<div class="time">
												${category.name}&nbsp;&nbsp;|&nbsp;&nbsp;发表于
												<s:date name='%{addTime}' format='yyyy-MM-dd HH:mm:ss' />
											</div>
											<div class="contxt">
												${util:preview(content,100)}
												<p class="r">
													<a href="<c:url value='/admin/blog/view/${id}'/>">查看全文</a>
												</p>
											</div>
										</div>
										<div class="c"></div>
									</li>
								</s:iterator>
									<%@ include file="/common/page.jsp"%>
							</ul>
						</div>
					</div>
					<div id="sidebar">
						<div class="sideAvatar">
							<div class="subtitle">
								用户日志
							</div>
							<s:action name="user!search"  id="userList" executeResult="false">
								<s:param name="queryBean.order">addTime</s:param>
						        <s:param name="queryBean.desc">true</s:param>
						        <s:param name="pagesize">9</s:param>
							</s:action>
							<ul>
								<s:iterator value="%{#userList.users}" status="rowStatus">
									<li>
										<div class="avatar">
											<a href="<c:url value='/admin/blog/workmate/${id}'/>">
											<c:if test="${photo==null}">
												<img  src="${pageContext.request.contextPath}/common/images/user50-50.jpg"
													  alt="${nickname}" width="50" height="50" />
											</c:if> <c:if test="${photo!=null}">
												<img  src="${pageContext.request.contextPath}/upload/user/<s:date name='%{addTime}' format='yyyyMMdd' />/${photo}"
													  alt="${nickname}" width="50" height="50" />
											</c:if>
											</a>
										</div>
										<div class="name">
											<a href="<c:url value='/admin/blog/user/${id}'/>">${nickname}</a>
										</div>
									</li>
								</s:iterator>
							</ul>
							<div class="c"></div>
						</div>
						<div class="blogHot">
							<div class="subtitle">
								热门日志
							</div>
							<s:action name="blog!search" id="hotBlogList"
								executeResult="false">
								<s:param name="queryBean.order">count</s:param>
								<s:param name="queryBean.desc">true</s:param>
								<s:param name="pagesize">5</s:param>
							</s:action>
							<ul>
								<s:iterator value="%{#hotBlogList.blogs}" status="rowStatus">
									<li>
										<a href="<c:url value='/admin/blog/view/${id}'/>"
											title="${title}"> ${util:preview(title,15)}</a>
									</li>
								</s:iterator>
							</ul>
						</div>
						<div class="blogHot">
							<div class="subtitle">
								最新评论
							</div>
							<s:action name="blogComment!search" id="blogCommentList"
								executeResult="false">
								<s:param name="queryBean.order">addTime</s:param>
								<s:param name="queryBean.desc">true</s:param>
								<s:param name="pagesize">9</s:param>
							</s:action>
							<ul>
								<s:iterator value="%{#blogCommentList.blogComments}"
									status="rowStatus">
									<li>
										<a href="<c:url value='/admin/blog/view/${blog.id}'/>"
											title="${name}">${util:preview(name,13)}</a>
									</li>
								</s:iterator>
							</ul>
						</div>
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

