<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<s:action name="topic!view" id="view" executeResult="false" />
<HEAD>
	<TITLE>${view.topic.title}</TITLE>
	<link rel="stylesheet" href="<c:url value='/admin/styles/topic.css'/>"
		type="text/css" />
</HEAD>
<BODY>
	<div id="main">
		<s:include value="../left.jsp"></s:include>
		<div id="mainarea">
			<div id="mainarea_bg">
				<div id="content">
					<div id="analysisView">
						<div id="mainUse">
							<div class="avatar">
								<c:if test="${view.topic.user.photo==null}">
									<a
										href="<c:url value="/admin/user/view/${view.topic.user.username}"/>"><img
											src="${pageContext.request.contextPath}/common/images/user50-50.jpg"
											alt="${view.topic.user.nickname}" width="50" height="50" />
									</a>
								</c:if>
								<c:if test="${view.topic.user.photo!=null}">
									<a
										href="<c:url value="/admin/user/view/${view.topic.user.username}"/>"><img
											src="${pageContext.request.contextPath}/upload/user/<s:date name='%{#view.topic.user.addTime}' format='yyyyMMdd' />/${view.topic.user.photo}"
											alt="${view.topic.user.nickname}" width="50" height="50" />
									</a>
								</c:if>
							</div>
							<div class="subtitle">
								<table>
									<tr>
										<td align="left" width="150">
											${view.topic.user.username}
										</td>
										<td width="480"></td>
										<td align="right">
											<a href="javascript:history.go(-1);">返回上一页</a>
										</td>
									</tr>
								</table>
							</div>
							<div class="submenu">
								<a
									href="/eshow/admin/twitter/workmate/${view.topic.user.username}">他的微博</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								<a href="/eshow/admin/blog/workmate/${view.topic.user.username}">他的日志</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								<a
									href="/eshow/admin/topic/workmate/${view.topic.user.username }">他的话题</a>
							</div>
							<div class="upPage">
								<c:if test="${view.topic.state==0}">
									<input type="button" class="botton" value="审核通过"
										onmouseout="this.className='botton';"
										onmouseover="this.className='botton2';"
										onclick="javascript:location.href='<c:url value='/admin/topic/topic!state.html?id=${view.topic.id}&topic.state=1&topic.title=title&topic.content=content'/>'" />
									<input type="button" class="botton_close1" value="审核不通过"
										onmouseout="this.className='botton_close1';"
										onmouseover="this.className='botton_close2';"
										onclick="javascript:location.href='<c:url value='/admin/topic/topic!state.html?id=${view.topic.id}&topic.state=2'/>'" />
								</c:if>
							</div>
						</div>
						<div class="info">
							<h3>
								&nbsp; ${view.topic.title}
							</h3>
							<span class="r" style="color: #999"><s:date
									name='%{#view.topic.updateTime}' format='yyyy-MM-dd HH:mm' />
							</span>
							<div class="c"></div>
							<div class="l">
								发表于
								<s:date name='%{#view.topic.addTime}' format='yyyy-MM-dd HH:mm' />
								&nbsp;&nbsp;&nbsp;&nbsp;(分类：${view.topic.board.name})
							</div>
							<div class="r">
								<a href="/eshow/admin/topic/edit/${view.topic.id}">修改</a>&nbsp;&nbsp;|&nbsp;&nbsp;
								<a href="<c:url value='/admin/topic/view/${view.topic.id}'/>">回复</a>
							</div>
							<div class="c"></div>
						</div>
						<div class="tips">
							<span class="r">评论(<span id="count814">${view.topic.commentSize}</span>)┊浏览(${view.topic.count})
							</span>
							<div class="c"></div>
						</div>
						<div class="conttxt">
							${view.topic.content}
							<br />
						</div>
						<div id="comment0" class="comment"></div>
					</div>
				</div>
				<c:if test="${view.topic.state==1}">
					<s:action name="topicComment!search" id="topicCommentList"
						executeResult="false">
						<s:param name="queryBean.topicId">${view.topic.id }</s:param>
						<s:param name="queryBean.order">addTime</s:param>
						<s:param name="queryBean.desc">true</s:param>
					</s:action>
					<s:iterator value="%{#topicCommentList.topicComments}"
						status="rowStatus">
						<div class="commenta" id="comDiv5244">

							<div class="commenta_avatar">
								<a href="/eshow/admin/topic/workmate/${view.topic.user.id }"><img
										src="${pageContext.request.contextPath}/upload/user/<s:date name='%{user.addTime}' format='yyyyMMdd' />/${user.photo}"
										alt="${user.username }" width="50" height="50" /> </a>
								${user.username }
							</div>
							<div class="commenta_cont">
								<div class="commenta_info">
									<span class="l"><a
										href="<c:url value='/admin/user/view/${user.username }'/>">${name}</a>
										于 <s:date name="addTime" format="yyyy-MM-dd hh:mm"/>回复</span>
									<span class="r">
										<a href="<c:url value='topicComment!delete.html?id=${id}'/>"
										onclick="return window.confirm('真的需要删除该信息吗?');"> 删除</a>
									</span>
								</div>
								<div class="commenta_contxt">
									${content}
								</div>
								<div class="comment_reply">
								</div>
							</div>
						</div>
					</s:iterator>
					<div class="comment_textarea" id="replay">
						<s:form action="topicComment!save.html" id="topicCommentForm"
							method="post">
							<input name="topicId" type="hidden" value="${view.topic.id }" />
							<br />
							<br />
						标题:
						<input name="topicComment.name" class="inputtext"
								style="width: 300px;" maxlength="100" type="text"
								onblur="this.className='inputtext'"
								value="回复:${view.topic.title }" />
							<div>
								&nbsp;
							</div>
							<div>
								<textarea class="textarea" name="topicComment.content"
									onkeyup="javascript:KeyupComment()" id="topicComment.content"
									cols="" rows="" onblur="this.className='textarea'"
									onfocus="this.className='textarea2'"></textarea>
							</div>
							<div class="button">
								<p style="float: left">
									<span style="margin-left: 90px"></span>总共字数：
									<span style="color: Blue; margin-right: 20px">200</span>剩余字数：
									<span id="CommentRestCharCount" style="color: Blue">200</span>
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
				</c:if>
			</div>
			<c:if test="${view.topic.state==1}">
				<div id="articeBottom">
					<%@ include file="/common/page.jsp"%>
				</div>
			</c:if>
		</div>
		<div class="c"></div>
	</div>
</BODY>
