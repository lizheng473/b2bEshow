<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="twitter!view" id="view" executeResult="false"></s:action>
<HEAD>
	<TITLE>微博客</TITLE>
	<link rel="stylesheet"
		href="<c:url value='/admin/styles/twitter.css'/>" type="text/css" />
</HEAD>
<BODY>
	<div id="main">
		<s:include value="../left.jsp"></s:include>
		<div id="mainarea">
			<div id="mainarea_bg">
				<div id="content">
					<div id="mainTop">
						<h2>
							<img src="<c:url value='/admin/images/app_list_twitter.gif'/>" />
							微博
						</h2>
					</div>
					<div id="mainTab">
						<ul>
							<li>
								<span class="txt5"><a
									href="<c:url value='/admin/twitter'/>">大家的微博</a> </span>
							</li>
							<li>
								<span class="txt5"><a
									href="<c:url value='/admin/twitter/mine'/>">我的微博</a> </span>
							</li>
							<li class="navtxt">
								<a href="<c:url value='/admin/twitter/add'/>">继续说</a>
							</li>
						</ul>
					</div>
					<div id="content">
						<s:form action="twitter!update.html" id="twitterForm"
							method="post">
							<input type="hidden" name="id" value="${view.twitter.id}" />
							<div id="top">
									心情点滴，我要记录...（200字内）
								</div>
								<div style="padding-top: 10px;">
									<textarea class="textarea" style="width: 400px; height: 80px;"
										name="twitter.content" id="inputBox" onkeyup="keyup(200)"
										onblur="this.className='textarea'"
										onfocus="this.className='textarea2'" />${view.twitter.content}</textarea>
								</div>
								<div style="padding: 5px 0;">
									<span><input type="submit" class="botton"
											value="修改" onMouseOut="this.className='botton';"
											onMouseOver="this.className='botton2';" />
									</span>
								</div>
						</s:form>
					</div>
				</div>
				<div class="c"></div>
			</div>
			<div class="c"></div>
		</div>
	</div>
</BODY>

