<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="user!view" id="view" executeResult="false">
</s:action>
<HEaD>
	<TITLE>后台</TITLE>
	<link rel="stylesheet" href="<c:url value='/admin/styles/user.css'/>"
		type="text/css" />
</HEaD>
<BODY>
	<div id="main">
		<s:include value="left.jsp"></s:include>
		<div id="mainarea">
			<div id="mainarea_bg">
				<div id="content2">
					<div id="column">
						<div class="subTab">
							<span class="l on">快速操作</span>
						</div>
						<div id="friendfeed" class="feed">
							<ul>
								<li class="feed1">
									<a href="<c:url value='/admin/info/edit/15'/>">修改首页报价</a>
								</li>
								<li class="feed1">
									<a href="<c:url value='/admin/info/edit/1'/>">修改公司简介</a>
								</li>
								<li class="feed1">
									<a href="<c:url value='/admin/info/edit/3'/>">修改招贤纳士</a>
								</li>
								<li class="feed1">
									<a href="<c:url value='/admin/blog/add'/>">发布新闻</a>
								</li>
							</ul>
							<div class="c h15"></div>
						</div>
					</div>
					<div id="sidebar">
						<div class="c h5"></div>
						<div id="notify">
							<div class="top">
								<a href="<c:url value='/admin/post'/>">内部公告</a>
							</div>
							<s:action name="post!search" id="postList" executeResult="false"></s:action>
							<ul>
								<s:iterator value="%{#postList.posts}" status="rowStatus">
									<LI>
										<a href="<c:url value='/admin/post/view/${id}'/>"><B>${title}</B>
										</a> [
										<s:date name='%{addTime}' format='yyyy-MM-dd' />
										]
									</LI>
								</s:iterator>
							</ul>
							<div class="clear"></div>
						</div>
						<div id="notify">
							<div class="top topmessage">
								消息中心
							</div>
							<ul>
								<LI>
									系统消息：
									<span class="c999">0&nbsp;条新</span>
								</LI>
								<LI>
									站内消息：
									<span class="c999">0&nbsp;条新</span>
								</LI>
							</ul>
							<div class="clear"></div>
						</div>
					</div>
					<div class="c"></div>
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

