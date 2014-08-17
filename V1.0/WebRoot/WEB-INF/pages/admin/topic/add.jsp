<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>
<HEAD>
	<TITLE>讨论区</TITLE>
	<link rel="stylesheet" href="<c:url value='/admin/styles/topic.css'/>"
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
			new FormCheck('topicForm');
		});
    </script>
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
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/board'/>">话题板块</a> </span>
							</li>
							<li class="navtxt">
								<a href="<c:url value='/admin/topic/add'/>">发表话题</a>
							</li>
						</ul>
					</div>
					<div id="analysis">
						<div id="analysisEdit">
							<s:form id="topicForm" action="topic!save.html" method="post"
								enctype="multipart/form-data">
								<p>
									<span class="l">标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题</span>
									<span class="r">&nbsp; <input name="topic.title"
									        class="inputtext text-input validate['required']"
											class="inputtext" style="width: 300px;" maxlength="50"
											type="text" onblur="this.className='inputtext'" /> </span>
								</p>
								<p>
									<span class="l">分&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;类&nbsp;</span>
									<span class="r">&nbsp; <s:action name="board!list"
											id="boardList" executeResult="false">
										</s:action> <select id="strClassId" name="boardId">
											<s:iterator value="%{#boardList.boards}" status="rowStatus">
												<option value="${id}">
													${name}
												</option>
											</s:iterator>
										</select> </span>
								</p>
								<p>
									<span class="l">内&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;容&nbsp;</span>
									<textarea id="ke-text" 	name="topic.content" style="width: 600px; height: 300px;">
									</textarea>
								</p>
								<p style="width: 640px; text-align: center;">
									<input type="submit" class="botton" value="发表"
										onmouseout="this.className='botton';"
										onmouseover="this.className='botton2';" />
									<input type="button" class="botton_close1" value="取消"
										onmouseout="this.className='botton_close1';"
										onmouseover="this.className='botton_close2';"
										onclick="javascript:CreateAnalysis.cancelCreate()" />
								</p>
								<div class="c"></div>
								<div class="c h5"></div>
								<span class="l"></span>
								<p>
									<input type="hidden" id="securitiesIds"
										name="listSecuritiesIds" />
								</p>
								<div class="c h10"></div>
							</s:form>
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
		</div>
	</DIV>
</BODY>

