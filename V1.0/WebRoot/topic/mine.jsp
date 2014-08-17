<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<head>
	<title>我的话题</title>
	<link rel="stylesheet" href="<c:url value='/styles/topic.css'/>"
		type="text/css" />
	<script type="text/javascript"
		src="<c:url value='/scripts/delete.js'/>"></script>
</head>
<body>
	<div id="page-wrapper">
		<img alt="" src="../images/top-hr.png"
			style="height: 12px; margin-top: 10px; width: 980px;" />
		<table cellspacing="0" cellpadding="0"
			style="background: url(../images/bg-body.png) repeat-y top; width: 980px;">
			<tr>
				<td width="2"></td>
				<td valign="top"
					style="background: url(../images/bg-sec-12.png) repeat-x top; padding: 40px 40px; align: center;">
					<div>
						<div class="fullWidth">
							<div class="pagehead clearit">
								<h1 class="noImage">
									网站技术支持
								</h1>
							</div>
							<div class="skyWrap">
								<div id="forumsearch">
									<a href="<c:url value='/topic/add'/>" class="lnk1">新话题</a>
								</div>
								<div id="forumheaderthing">
									<div id="forumhelplinks">
										<a href="<c:url value='/topic'/>"
											style="color: #0187c5; text-decoration: none;">全部话题
										</a> |
										<s:action name="board!list" id="boardList"
											executeResult="false">
											<s:param name="boardQueryBean.order">addTime</s:param>
											<s:param name="boardQueryBean.desc">true</s:param>
										</s:action>
										<s:iterator value="%{#boardList.boards}" status="rowStatus">
											<a href="<c:url value="/topic/board/${id}"/>"
												style="color: #0187c5; text-decoration: none;">${name}
											</a> |
										</s:iterator>
										<a href="<c:url value='/topic/mine'/>"
											style="color: #0187c5; text-decoration: none;"><strong>我的话题</strong></a>
									</div>
								</div>
								<div class="forumview">
									<table cellpadding="0" cellspacing="0" class="forumtable"
										width="100%">
										<tr>
											<th>
												主题
											</th>
											<th>
												分类
											</th>
											<th>
												回复
											</th>
											<th>
												发表时间
											</th>
											<th>
												浏览
											</th>
											<th>
												操作
											</th>
										</tr>
										<s:action name="topic!search" id="topicList" executeResult="false">
											<s:param name="queryBean.userId">${myid}</s:param>
											<s:param name="queryBean.order">addTime</s:param>
											<s:param name="queryBean.desc">true</s:param>
										</s:action>
										<s:iterator value="%{#topicList.topics}" status="rowStatus">
											<tr
												class="<s:if test="#rowStatus.odd == true ">alt</s:if><s:else>1</s:else>" id="topic${id}">
												<td class="threadTitle">
													<a href="view/${id }"
														style="color: #0187c5; text-decoration: none;">${util:preview(title,50)}
													</a> &nbsp;
												</td>
												<td class="numReplies">
													${board.name}
												</td>
												<td class="numReplies">
													${commentSize}
												</td>
												<td class="threadAuthor">
													<s:date name="addTime" format="yyyy-MM-dd"/>
												</td>
												<td class="numViews">
													${count}
												</td>
												<td class="lastPost">
													<a href="<c:url value='/topic/edit/${id}'/>" style="text-decoration:none;">修改</a> |
													<a
														href="javascript:void(0);"
														onclick="return deleteData('topic',${id});" style="text-decoration:none;">删除</a>
												</td>
											</tr>
										</s:iterator>
									</table>
									<div style="text-align: center;">
								       <%@ include file="/common/page.jsp"%>
								     </div>
									<div id="bottombarForum">
										<a href="<c:url value='/topic/add'/>" class="lnk1">新话题</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</td>
				<td width="3"></td>
			</tr>
		</table>
		<table cellspacing="0" cellpadding="0"
			style="background: url(../images/bg-btm-hr.png) repeat-y top; width: 980px; height: 9px;">
			<tr>
				<td></td>
			</tr>
		</table>
	</div>
</body>
