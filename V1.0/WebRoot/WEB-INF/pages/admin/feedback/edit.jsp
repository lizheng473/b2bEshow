<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="feedback!view" id="view" executeResult="false" />
<HEAD>
	<TITLE>修改新鲜事--${view.feedback.title}</TITLE>
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
							修改信息--${view.feedback.title}
						</h2>
					</div>
					<div id="mainTab">
						<ul>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/feedback/index'/>">留言列表</a> </span>
							</li>
							<li class="on">
								<span class="txt6"><a>信息修改</a> </span>
							</li>
							<li class="navtxt">
								<a href="<c:url value='/admin/feedback/add'/>"  style="text-decoration:none;">留言</a>
							</li>
						</ul>
					</div>
					<div id="edit">
					   <s:form id="feedbackForm" action="feedback!update" method="post">
					     <s:hidden name="id" value="%{#view.feedback.id}"></s:hidden>
					         <p>
								<span class="l">留言人:&nbsp;</span>
								<span class="r">&nbsp; <input name="feedback.username"
										class="inputtext" style="width: 200px;" maxlength="50"
										type="text" onblur="this.className='inputtext'"  value="${view.feedback.username}"/> </span>
							</p>
							<p>
								<span class="l">留言标题:&nbsp;</span>
								<span class="r">&nbsp; <input name="feedback.title"
										class="inputtext" style="width: 200px;" maxlength="50"
										type="text" onblur="this.className='inputtext'"  value="${view.feedback.title}"/> </span>
							</p>
							<p>
								<span class="l">留言内容:&nbsp;</span>
								<span class="r">&nbsp;&nbsp;<textarea style="width: 400px; height: 80px;"
										name="feedback.content" id="inputBox" onkeyup="keyup(200)" cols="" rows=""
										onblur="this.className='textarea'"
										onfocus="this.className='textarea2'" >${view.feedback.content}</textarea></span>
							</p>
							<div class="c"></div>
							<div class="c h5"></div>
							<p style="margin-left: 100px;">
								<input type="submit" class="botton" value="发表"
									onmouseout="this.className='botton';"
									onmouseover="this.className='botton2';" />
								<input type="button" class="botton_close1" value="取消"
									onmouseout="this.className='botton_close1';"
									onmouseover="this.className='botton_close2';"
									onclick="javascript:history.back();" />
							</p>
						</s:form>
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

