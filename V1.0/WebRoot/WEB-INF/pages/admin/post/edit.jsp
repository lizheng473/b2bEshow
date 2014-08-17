<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="post!view" id="view" executeResult="false" />
<HEAD>
	<TITLE>修改公告${view.post.title}</TITLE>
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
							<img src="<c:url value='/admin/images/app_list_post.gif'/>" />
							修改公告${view.post.title}
						</h2>
					</div>
					<div id="mainTab">
						<ul>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/post'/>">公告列表</a> </span>
							</li>
							<li>
								<span class="txt6"><a>公告修改</a> </span>
							</li>
							<li class="navtxt">
								<a href="<c:url value='/admin/post/add'/>">添加公告</a>
							</li>
						</ul>
					</div>
					<div id="analysisEdit">
						<s:form id="postForm" action="post!update.html" method="post">
							<s:hidden name="id" value="%{#view.post.id}"></s:hidden>
							<p>
								<span class="l">公告标题&nbsp;</span>
								<span class="r">&nbsp; <input name="post.title"
										class="inputtext" style="width: 200px;" maxlength="50"
										type="text" onblur="this.className='inputtext'"
										value="${view.post.title}" /> </span>
							</p>
							<p>
								<span class="l">公告内容&nbsp;</span>
								<span class="r">&nbsp; <textarea class="textarea" style="width: 400px; height: 80px;"
										name="post.content" id="inputBox" onkeyup="keyup(200)" cols="" rows=""
										onblur="this.className='textarea'"
										onfocus="this.className='textarea2'" />${view.post.content}</textarea></span>
							</p>
							<div class="c"></div>
							<div class="c h5"></div>
							<span class="l"></span>
							<div class="c h10"></div>
							<p style="width: 640px; text-align: center;">
								<input type="submit" class="botton" value="发表"
									onmouseout="this.className='botton';"
									onmouseover="this.className='botton2';" />
								<input type="button" class="botton_close1" value="取消"
									onmouseout="this.className='botton_close1';"
									onmouseover="this.className='botton_close2';"
									onclick="javascript:CreateAnalysis.cancelCreate()" />
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

