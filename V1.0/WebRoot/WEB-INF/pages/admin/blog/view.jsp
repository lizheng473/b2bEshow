<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="blog!view" id="view" executeResult="false">
</s:action>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<HEAD>
	<TITLE>${view.blog.title}日志</TITLE>
	<link rel="stylesheet" href="<c:url value='/admin/styles/blog.css'/>"
		type="text/css" />
	<link media="screen" type="text/css"
		href="<c:url value='/scripts/validate/theme/grey/formcheck.css'/>"
		rel="stylesheet" />
	<script type="text/javascript"
		src="<c:url value='/scripts/validate/lang/zh-CN.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/scripts/validate/formcheck.js'/>"></script>
	<script type="text/javascript">
		window.addEvent('domready', function() {
			new FormCheck('blogCommentForm');
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
							<img class="icon-app app-education"
								src="<c:url value='/admin/images/app_list_blog.gif'/>" />
							日志
						</h2>
					</div>
					<div id="blogView">
						<div id="mainUse">
							<div class="avatar">
								<a href="<c:url value='/admin/user/view/${view.blog.user.id}'/>"><img
										src="${pageContext.request.contextPath}/upload/user/<s:date name='%{#view.blog.user.addTime}' format='yyyyMMdd' />/${view.blog.user.photo}"
										width="50" height="50" /> </a>
							</div>
							<div class="subtitle">
								${view.blog.user.nickname }
							</div>
							<div class="submenu">
								<a href="/eshow/admin/twitter/workmate/${view.blog.user.id}">他的微博</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								<a href="/eshow/admin/blog/workmate/${view.blog.user.id}">他的日志</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								<a href="/eshow/admin/topic/workmate/${view.blog.user.id }">他的话题</a>
							</div>
							<div class="upPage">
								<a href="javascript:history.go(-1);">返回上一页</a>
							</div>
						</div>
						<div class="info">
							${view.blog.title} 
							<div class="r">
							<c:if test="${view.blog.user.id==myid}">
								<a	href="<c:url value='/admin/blog/edit/${view.blog.id}'/>">修改</a>&nbsp;&nbsp;|&nbsp;&nbsp;
									<a href="javascript:void(0);"
									onclick="return deleteData('blog',${view.blog.id});">删除</a>&nbsp;&nbsp;
								</c:if>
							</div>
						</div>
						<div class="tips">
							<span class="1"> 发表于:<s:date
									name='%{#view.blog.addTime}' format='yyyy-MM-dd HH:mm' /> </span>|
							<span  class="2">更新于:<s:date
									name='%{#view.blog.updateTime}' format='yyyy-MM-dd HH:mm' /> </span>
							<span class="3">(分类：
									<c:if test="${view.blog.category.id==null}">[默认分类] </c:if>
									 <c:if test="${view.blog.category.id!=null}">
									<a	href="<c:url value="/admin/blog/c/${view.blog.category.id}"/>">${view.blog.category.name}</a>
									</c:if>)</span>
							<span class="r">评论(<span>${view.blog.commentSize}</span>)┊浏览(<span>${view.blog.count}</span>)
							</span>
						</div>
						<div class="conttxt">
							${view.blog.content}
						</div>
					</div>
				</div>
				<s:action name="blogComment!search" id="blogCommentList"
					executeResult="false">
					<s:param name="queryBean.blogId">${view.blog.id}</s:param>
					<s:param name="queryBean.desc">true</s:param>
				</s:action>
				<s:iterator value="%{#blogCommentList.blogComments}"
					status="rowStatus">
					<div class="commenta" id="blogComment${id}">
						<div class="commenta_avatar">
							<c:if test="${user.photo==null}">
								<a href="<c:url value='/admin/blog/workmate?id=${user.id}'/>">
									<img
										src="${pageContext.request.contextPath}/common/images/user50-50.jpg"
										alt="${user.nickname}" />
								</a>
							</c:if>
							<c:if test="${user.photo!=null}">
								<a href="<c:url value='/admin/blog/workmate?id=${user.id}'/>">
									<img
										src="${pageContext.request.contextPath}/upload/user/<s:date name='%{#view.blog.user.addTime}' format='yyyyMMdd' />/${view.blog.user.photo}"
										alt="${user.nickname}" width="50" height="50"/>
								</a>
							</c:if>
						</div>
						<div class="commenta_cont">
							<div class="commenta_info">
								<span class="l"><a
									href="<c:url value='/admin/user/view/${view.blog.user.id}'/>">${view.blog.user.nickname}</a>
									于 <s:date name='%{addTime}' format='yyyy-MM-dd HH:mm:ss' />回复 </span>
								<c:if test="${user.id==myid}">
									<span class="r"> <a href="javascript:void(0);"
										onclick="return deleteData('blogComment',${id});"> 删除</a> </span>
								</c:if>
							</div>
							<div class="commenta_contxt">
								${content}
							</div>
						</div>
					</div>
				</s:iterator>
				<div class="comment_textarea" id="replay" style="margin-top: 10px;">
					<s:form action="blogComment!save.html" id="blogCommentForm"
						method="post">
						<input name="blogId" type="hidden" value="${view.blog.id }" />
						<span style="font-size: 16px;">标题:</span>
						<input name="blogComment.name" class="inputtext"
							style="width: 300px;" maxlength="100" type="text"
							onblur="this.className='inputtext'"
							value="回复:${view.blog.title }" />
						<div>
							&nbsp;
						</div>
						<div style="margin-left: 37px;">
							<textarea class="inputtext text-input validate['required']"
							    class="textarea" name="blogComment.content"
							    id="inputBox" style="width: 400px; height:70px;"
								onblur="this.className='textarea'"
								onfocus="this.className='textarea2'"></textarea>
							<p style="margin-top: 5px;"><input type="submit" class="botton" value="发表"
								onMouseOut="this.className='botton';"
								onMouseOver="this.className='botton2';" /></p>
						</div>
						<div class="c h5"></div>
					</s:form>
				</div>
			</div>
		</div>
	</div>
</BODY>

