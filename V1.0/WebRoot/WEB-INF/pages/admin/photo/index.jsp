<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
	<title>相册</title>
	<link rel="stylesheet" href="<c:url value='/admin/styles/album.css'/>"
		type="text/css" />
</head>
<BODY>
	<div id="main">
		<s:include value="../left.jsp"></s:include>
		<div id="mainarea">
			<div id="mainarea_bg">
				<div id="content">
					<div id="mainTop">
						<h2>
							<img src="<c:url value='/admin/images/app_list_album.gif'/>" />
							相册
						</h2>
					</div>
					<div id="mainTab">
						<ul>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/album'/>">相册</a> </span>
							</li>
							<li class="on">
								<span class="txt6"><a
									href="<c:url value='/admin/photo'/>">图片列表</a> </span>
							</li>
							<li class="navtxt">
								<a href="<c:url value='/admin/photo/add'/>">上传图片</a>
							</li>
						</ul>
					</div>
					<div id="celebrity">
						<div class="subnav" >
							<strong>全部图片</strong>
						</div>
						<s:action name="photo!search" id="photoList" executeResult="false">
							<s:param name="queryBean.order">addTime</s:param>
							<s:param name="queryBean.desc">true</s:param>
							<s:param name="pagesize">20</s:param>
						</s:action>
						<ul>
							<s:iterator value="%{#photoList.photos}" status="rowStatus">
								<li style="background-color: #f9f9f9"
									onmouseover="this.style.backgroundColor='#f9e0e0';"
									onmouseout="this.style.backgroundColor='#f9f9f9';"
									id="photo${id}">
									<div align="center">
										<a href="<c:url value='/admin/photo/view/${id}'/>"><img height="120" width="120"
												src="${pageContext.request.contextPath}/upload/photo/<s:date name='%{addTime}' format='yyyyMMdd' />/${img}"
												alt="${name}" /> </a>
									</div>
									<div class="cont" style="color: #999;" align="center">
										<s:date name='%{addTime}' format='yyyy-MM-dd' />
										<br />
										${name}
										<br />
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

