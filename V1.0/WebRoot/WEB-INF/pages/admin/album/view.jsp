<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="album!view" id="view" executeResult="false">
</s:action>
<HEAD>
	<TITLE>${view.album.name}相册</TITLE>
	<link rel="stylesheet" href="<c:url value='/admin/styles/album.css'/>"
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
							<img src="<c:url value='/admin/images/app_list_album.gif'/>" />
							${view.album.name}相册
						</h2>
					</div>
					<div id="mainTab">
						<ul>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/album'/>">相册</a> </span>
							</li>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/photo'/>">图片列表</a> </span>
							</li>
							<li class="on">
								<span class="txt6"><a
									href="<c:url value='/admin/album/view/${view.album.id}'/>">${view.album.name}相册</a>
								</span>
							</li>
							<li class="navtxt">
								<a href="<c:url value='/admin/photo/add'/>">上传图片</a>
							</li>
						</ul>
					</div>
					<div id="celebrity">
						<div class="subnav">
							<strong>${view.album.name}相册</strong>
						</div>
						<s:action name="photo!search" id="photoList" executeResult="false">
							<s:param name="queryBean.albumId">${view.album.id}</s:param>
							<s:param name="queryBean.order">addTime</s:param>
							<s:param name="queryBean.desc">true</s:param>
							<s:param name="pagesize">12</s:param>
						</s:action>
						<ul>
							<s:iterator value="%{#photoList.photos}" status="rowStatus">
								<li style="background-color: #f9f9f9" id="photo${id}"
									onmouseover="this.style.backgroundColor='#f9e0e0';"
									onmouseout="this.style.backgroundColor='#f9f9f9';">
									<div>
										<a href="<c:url value='/admin/photo/view/${id}'/>"><img
												height="135" width="135"
												src="${pageContext.request.contextPath}/upload/photo/<s:date name='%{addTime}' format='yyyyMMdd' />/${img}"
												alt="${name}" /> </a>
									</div>
									<div class="cont" style="color: #999" align="center">
									     ${name}
									     <br />
										上传于：<s:date name='%{addTime}' format='yyyy-MM-dd' />
										<br />
										<a href="<c:url value='/admin/photo/view/${id}'/>">评论(${commentSize})</a>|
										<a href="<c:url value='/admin/photo/edit/${id}'/>">修改</a>|
										<a href="javascript:void(0);"
											onclick="return deleteData('photo',${id});">删除</a>
									</div>
									<div class="c"></div>
								</li>
							</s:iterator>
						</ul>
						<div class="c"></div>
                          <%@ include file="/common/page.jsp"%>
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

