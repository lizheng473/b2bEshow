<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<HEAD>
	<TITLE>内部公告</TITLE>
	<link rel="stylesheet" href="<c:url value='/admin/styles/post.css'/>"
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
							<img src="<c:url value='/admin/images/app_list_system.gif'/>" />
							内部公告
						</h2>
					</div>
					<div id="mainTab">
						<ul>
							<li class="on">
								<span class="txt6"><a>公告列表</a> </span>
							</li>
							<li class="navtxt">
								<a href="<c:url value='/admin/post/add'/>">添加公告</a>
							</li>
						</ul>
					</div>
					<s:action name="post!search" id="postList" executeResult="false">
						<s:param name="queryBean.order">addTime</s:param>
						<s:param name="queryBean.desc">true</s:param>
					</s:action>
						<ul class="flist">
								<s:iterator value="%{#postList.posts}" status="rowStatus">
									<li id="post${id}" onmouseover='this.style.backgroundColor ="#f9f9f9"'
										onmouseout='this.style.backgroundColor =""'>
										<div class="cont">
											<div class="title">
												<a href="<c:url value='/admin/post/view/${id}'/>">${title}</a>&nbsp;&nbsp;&nbsp;&nbsp;
											</div>
											<div class="time">
												发表于
												<s:date name='%{addTime}' format='yyyy-MM-dd HH:mm:ss' />
											</div>
											<div class="contxt">
												${content }
												<p class="r">
													<a href="<c:url value='/admin/post/view/${id}'/>">查看全文</a>
												</p>
											</div>
										</div>
										<div class="c"></div>
									</li>
								</s:iterator>
							</ul>
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

