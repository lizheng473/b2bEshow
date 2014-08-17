<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<style type="text/css">
.STYLE1 {
	color: #FF0000
}
</style>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<HEAD>
	<TITLE>Eshow_后台_新鲜事</TITLE>
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
							留言板
						</h2>
					</div>
					<div id="mainTab">
						<ul>
							<li class="on">
								<span class="txt6"><a
									href="<c:url value='/admin/feedback'/>">大家的留言</a> </span>
							</li>
							<li class="navtxt">
								<a href="<c:url value='/admin/feedback/add'/>" style="text-decoration:none;">我要留言</a>
							</li>
						</ul>
					</div>
					<div id="celebrityList">
						<s:action name="feedback!search" id="feedbackList"
							executeResult="false">
							<s:param name="queryBean.order">addTime</s:param>
							<s:param name="queryBean.desc">true</s:param>
						</s:action>
						<div class="mtop">
							<span class="l">所以留言</span>
						</div>
						<ul>
							<s:iterator value="%{#feedbackList.feedbacks}">
								<li class="list"
									onmouseover="this.style.backgroundColor='#f9f9f9';"
									onmouseout="this.style.backgroundColor='#ffffff';"
									id="feedback${id}">
									<div class="list_content">
										<div>
										<span class="l"><span class="c333"> ${username}</span>
											&nbsp;&nbsp;<s:date name='addTime' format="yyyy-MM-dd HH:mm" /></span>
											<span class="r"><a href="<c:url value='/admin/feedback/edit/${id}'/>">修改</a>&nbsp;&nbsp;|&nbsp;&nbsp;
												<a href="javascript:void(0);"
													onclick="return deleteData('feedback',${id});">删除</a>&nbsp;&nbsp;|&nbsp;&nbsp;
												<a href="<c:url value='/admin/feedback/view/${id}'/>">回复(<span
													id="count2823"> <s:if test="%{reply!=null}">1</s:if>
														<s:else>0</s:else> </span>)</a></span>
											<p class="r">
												
											</p>
										</div>
										<div style="margin: 30px 0px 0px 0px;">
											留言：${content}
										</div>
										<div class="tips">
											<s:if test="%{reply==null}">
												<a href="<c:url value='/admin/feedback/view/${id}'/>"><u>未回复</u>
												</a>
											</s:if>
											<s:else>
												<div class="STYLE1"
													style="color: #23A726; margin-top: 10px;">
													回复：${reply}
												</div>
											</s:else>
										</div>
									</div>
								</li>
							</s:iterator>
						</ul>
						<div class="c"></div>
						<%@ include file="/common/page.jsp"%>
					</div>
				</div>
			</div>
			<div class="c"></div>
		</div>
		<div class="c"></div>
	</div>
</BODY>

