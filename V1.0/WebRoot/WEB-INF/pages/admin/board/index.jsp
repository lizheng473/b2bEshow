<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<HEAD>
	<TITLE>话题板块</TITLE>
	<link rel="stylesheet"
		href="<c:url value='/admin/styles/board.css'/>" type="text/css" />
</HEAD>
<BODY>
	<div id="main">
		<s:include value="../left.jsp"></s:include>
		<div id="mainarea">
			<div id="mainarea_bg">
				<div id="content">
					<div id="mainTop">
						<h2>
						<img src="<c:url value='/admin/images/app_list_topic.gif'/>" />
							基本设置
						</h2>
					</div>
					<div id="mainTab">
						<ul>
								<li>
								<span class="txt6"><a
									href="<c:url value='/admin/topic'/>">讨论区</a> </span>
							</li>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/topic/audit'/>">未审核</a> </span>
							</li>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/topic/mine'/>">我发表的话题</a> </span>
							</li>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/topic/replied'/>">我参与的话题</a> </span>
							</li>
							<li class="on">
								<span class="txt6"><a
									href="<c:url value='/admin/board'/>">话题板块</a> </span>
							</li>
							<li class="navtxt">
								<a href="<c:url value='/admin/board/add'/>">添加话题板块</a>
							</li>
						</ul>
					</div>
					<div id="celebrityList">
						<div id="securitiesGroup">
							<s:action name="board!list" id="boardList" executeResult="false"></s:action>
							<ul>
								<li style="color: #666; line-height: 14px; background: #f1f1f1;" >
									<span class="l">分类名称</span><span class="l">备注</span>
								</li>
								<s:iterator value="%{#boardList.boards}" status="rowStatus">
									<li onmouseover="this.style.backgroundColor='#f9f9f9';"
										onmouseout="this.style.backgroundColor='#ffffff';" id="board${id}">
										<span class="l" style="font-size: 14px;" title="${name}">${name}</span>
										<span class="l c999" title="${description}">${description}</span>
										<span class="r setting">
										<a href="<c:url value='/admin/board/edit/${id}'/>" class="">修改</a>
										</span>
										<span class="r del">	<a href="javascript:void(0);"
											onclick="return deleteData('board',${id});">删除</a> </span>
									</li>

								</s:iterator>
							</ul>
						</div>
						<div class="c"></div>
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

