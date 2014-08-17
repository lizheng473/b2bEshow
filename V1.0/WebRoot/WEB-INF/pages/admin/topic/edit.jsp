<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>
<s:action name="topic!view" id="view" executeResult="false" />
<HEAD>
	<TITLE>讨论区</TITLE>
	<link rel="stylesheet"
		href="<c:url value='/admin/styles/topic.css'/>" type="text/css" />
	<script type="text/javascript" charset="utf-8"
		src="<c:url value="/components/kindeditor/kindeditor.js"/>"></script>
	<script type="text/javascript">
    KE.show({
        id : 'ke-text'
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
							<img src="<c:url value='/admin/images/app_list_topic.gif'/>" />
							讨论区
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
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/board'/>">话题板块</a> </span>
							</li>

							<li class="navtxt">
								<a href="<c:url value='/admin/topic/add'/>">发表话题</a>
							</li>
						</ul>
					</div>
					<div id="analysisEdit">
						<s:form action="topic!update.html" method="post"
							cssClass="creat_form clearfix">
							<input type="hidden" name="id" value="${view.topic.id}" />
							<p>
								<span class="l">
									话题标题：
								</span>
								<input type="text" id="title" name="topic.title"
									value="${view.topic.title}" maxlength="80" />
							</p>
							<br>
							<p>
								<span class="l">
									话题分类：
								</span>
								<s:action name="board!search" id="boardList"
									executeResult="false"/>
								<select id="boardId" name="boardId">
									<s:iterator value="%{#boardList.boards}"
										status="rowStatus">
										<option value="${id}"
											<c:if test="${view.topic.board.id==id}">selected="selected"</c:if>>
											${name}
										</option>
									</s:iterator>
								</select>
							</p>	
							<br>
							<p>
								<span class="l">话题内容：</span>
								<span class="l">
									<textarea id="ke-text" class="textarea text-input validate['required']"
										name="topic.content" style="width: 600px; height: 300px;">${view.topic.content}</textarea>
								</span>
							</p>
							<br>
							<p style="width: 640px; text-align: center;">
								<input name="submit1" class="bt_sub3w" type="submit"
									value="修改成功" />
							</p>
						</s:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="c"></div>
	<div class="boxs3_rt"></div>
	<div class="boxs3_lb"></div>
	<div class="boxs3_rb"></div>
</BODY>

