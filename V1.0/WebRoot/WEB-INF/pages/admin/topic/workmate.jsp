<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="user!view" id="view" executeResult="false">
	<s:param name="id">${param.id}</s:param>
</s:action>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<HEAD>
	<TITLE>${view.user.nickname}的话题</TITLE>
	<link rel="stylesheet" href="<c:url value='/admin/styles/topic.css'/>"
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
							<img src="<c:url value='/admin/images/app_list_topic.gif'/>" />
							我发表的话题
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
									href="<c:url value='/admin/topic/mine'/>">我发表的话题</a> </span>
							</li>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/topic/replied'/>">我参与的话题</a> </span>
							</li>
							<li class="on">
								<span class="txt6"><a
									href="<c:url value='/admin/topic/replied'/>">${view.user.nickname}的话题</a>
								</span>
							</li>
							<li>
								<span class="txt5"> <a
									href="<c:url value='/admin/board'/>">话题板块</a> </span>
							</li>

							<li class="navtxt">
								<a href="<c:url value='/admin/topic/add'/>">发表话题</a>
							</li>
						</ul>
					</div>
					<div id="analysis">
						<div class="subnav">
							<strong>全部</strong>
							<s:action name="board!list" id="boardList" executeResult="false"></s:action>
							<s:iterator value="%{#boardList.boards}" status="rowStatus">
								<a
									href="<c:url value='/admin/topic/workmate?queryBean.boardId=${id}'/>">${name}</a>
							</s:iterator>
						</div>
						<table class="forum-table">
							<colgroup>
								<col width="17" />
								<col width="85" />
								<col />
								<col width="40" />
								<col width="100" />
								<col width="90" />
								<col width="70" />
								<col width="70" />
								<col width="90" />
							</colgroup>
							<tbody>
								<tr>
									<th></th>
									<th align="left">
										分类
									</th>
									<th align="left" width="200">
										标题
									</th>
									<th align="center" width="130">
										更新时间
									</th>
									<th align="center" width="90">
										浏览/回复
									</th>
									<th align="center" width="90">
										推荐/收藏
									</th>
									<th align="center" width="110">
										发表时间
									</th>
								</tr>
								<s:action name="topic!search" id="topicList"
									executeResult="false">
									<s:param name="queryBean.userId">${param.id}</s:param>
									<s:param name="queryBean.order">addTime</s:param>
									<s:param name="queryBean.desc">true</s:param>
								</s:action>
								<s:iterator value="%{#topicList.topics}" status="rowStatus">

									<tr onmouseover='this.style.backgroundColor ="#f9f9f9"'
										onmouseout='this.style.backgroundColor =""'>
										<td>
											<img src="<c:url value='/admin/images/icon_page.gif'/>" />
										</td>
										<td align="left">
											<em>${board.name}</em>
										</td>
										<td style="with:200;">
											<a href="<c:url value='/admin/topic/view/${id}'/>"
												title="${title}">${util:preview(title,22)}</a>
										</td>
										<td align="center" style="with:130;">
											<s:date name="updateTime" format="yyyy-MM-dd HH:mm"/>
										</td>
										<td align="center" style="with:90;">
											${count}/${commentSize}
										</td>
										<td align="center" style="with:90;">
											6/0
										</td>
										<td align="center" style=with:110;">
											<s:date name="addTime" format="yyyy-MM-dd"/>
										</td>
									</tr>
								</s:iterator>
							</tbody>
						</table>
						<%@ include file="/common/page.jsp"%>
					</div>
				</div>
				<input type="hidden" id="stype" value="" />
				<div class="c"></div>
			</div>
			<div class="c"></div>
			<div class="boxs3_rt"></div>
			<div class="boxs3_lb"></div>
			<div class="boxs3_rb"></div>
		</div>
	</div>
</BODY>

