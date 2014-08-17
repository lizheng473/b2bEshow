<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<s:action name="feedback!view" id="view" executeResult="false"></s:action>
<HEAD>
	<TITLE>新鲜事</TITLE>
	<link rel="stylesheet"
		href="<c:url value='/admin/styles/feedback.css'/>" type="text/css" />
</HEAD>
<BODY>
	<div id="main">
		<s:include value="../left.jsp"></s:include>
		<div id="mainarea">
			<div id="mainarea_bg">
				<div id="content">
					<div id="mainTop">
						<h2>
							<img src="<c:url value='/admin/images/app_list_feedback.gif'/>" />
							留言
						</h2>
					</div>
					<div id="feedback${view.feedback.id}">
					<div id="mainTab">
						<ul>
							<li class="text">
								<span><a href="<c:url value='/admin/feedback'/>">大家的留言</a> </span>
							</li>
							<li class="navtxt">
								详细留言
							</li>
						</ul>
					</div>
						<div id="view">
						  <ul>
								<li>
									<div class="info">
										<span class="msg">${view.feedback.username}于<s:date
												name='%{#view.feedback.addTime}' format="yyyy-MM-dd HH:mm" />留言
										</span>
										<span class="tips"> <a
											href="<c:url value='/admin/feedback/view/${view.feedback.id}'/>">回复(<span
												id="count2823">1</span>)</a> </span>
										
											<span class="tips"> <a
												href="<c:url value='/admin/feedback/edit/${view.feedback.id}'/>">修改</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
												href="javascript:void(0);"
												onclick="return deleteData('feedback',${view.feedback.id});">删除</a>&nbsp;&nbsp;|&nbsp;&nbsp;
											</span>
									</div>
									<div class="contxt">
										${view.feedback.content}
									</div>
								</li>
							</ul>
							<s:action name="feedback!search" id="feedbackList"
								executeResult="false">
								<s:param name="queryBean.feedbackId">${view.feedback.id }</s:param>
								<s:param name="queryBean.order">addTime</s:param>
								<s:param name="queryBean.desc">true</s:param>
							</s:action>
								<ul>
								<li>
									<div class="info">
											<span>回复：</span>
									</div>
									<div class="contxt">
										${view.feedback.reply}
									</div>
								</li>
							</ul>
							<div class="comment_textarea" id="replay">
								<s:form action="feedback!reply.html"
									id="feedbackForm" method="post">
									<input type="hidden" name="id"
										value="${view.feedback.id}" />
									<br />
									<br />
									<div>
										<textarea class="textarea" name="feedback.reply"
											onkeyup="keyup(200)" id="inputBox" cols="" rows=""
											onblur="this.className='textarea'"
											onfocus="this.className='textarea2'"></textarea>
									</div>
									<div class="button">
										<p style="float: left">
											<span style="margin-left: 90px"></span>总共字数：
											<span style="color: Blue; margin-right: 20px">200</span>
										</p>
										<div style="padding: 5px 0;">
											<span class="r"><input type="submit" class="botton"
													value="回复" onMouseOut="this.className='botton';"
													onMouseOver="this.className='botton2';" /> </span>
										</div>
									</div>

									<div class="c h5"></div>
								</s:form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="c"></div>
		</div>
		<div class="c"></div>
	</DIV>
</BODY>

