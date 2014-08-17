<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<HEAD>
	<TITLE>服务</TITLE>
	<link rel="stylesheet"
		href="<c:url value='/admin/styles/service.css'/>" type="text/css" />
</HEAD>
<BODY>
	<div id="main">
		<s:include value="../left.jsp"></s:include>
		<div id="mainarea">
			<div id="mainarea_bg">
				<div id="content">
					<div id="mainTop">
						<h2>
							<img src="<c:url value='/admin/images/app_list_service.gif'/>" />
							服务
						</h2>
					</div>
					<div id="mainTab">
						<ul>
							<li class="on">
								<span class="txt6"><a>服务列表</a> </span>
							</li>
							<li>
								<span class="txt6"><a href="/eshow/admin/serviceType">服务分类</a>
								</span>
							</li>
							<li class="navtxt">
								<a href="<c:url value='/admin/service/add'/>" style="text-decoration:none;">添加服务</a>
							</li>
						</ul>
					</div>
					<div style="width:500px;">
						<div id="analysis"  style="width:780px;">
							<s:action name="service!search" id="serviceList"
								executeResult="false">
								<s:param name="queryBean.order">addTime</s:param>
								<s:param name="queryBean.desc">true</s:param>
							</s:action>
							<div class="subtitle">
								<span class="l">最新服务</span><span class="r"> </span>
							</div>
							<ul class="flist">
								<s:iterator value="%{#serviceList.services}" status="rowStatus">
									<li onmouseover='this.style.backgroundColor ="#f9f9f9"'
										onmouseout='this.style.backgroundColor =""' id="service${id}">
										<div class="avatar">
											<a href="<c:url value='service/view/${id}'/>"><img
													src="${pageContext.request.contextPath}/upload/service/<s:date name='%{addTime}' format='yyyyMMdd'/>/${img}"
													width="50" height="50" /> </a>
										</div>
										<div class="cont">
											<div class="title">
												<a href="<c:url value='/admin/service/view/${id}'/>">${title}</a>&nbsp;&nbsp;&nbsp;&nbsp;
											</div>
											<div class="tips">
												<a href="<c:url value='/admin/service/edit/${id }'/>">修改</a>
												&nbsp;&nbsp;|&nbsp;&nbsp;
												<a href="javascript:void(0);"
													onclick="return deleteData('service',${id});">删除</a>
											</div>
											<div class="time">
												分类:${serviceType.name}&nbsp;&nbsp;|&nbsp;&nbsp;${user.username}&nbsp;发表于
												<s:date name='%{addTime}' format='yyyy-MM-dd HH:mm:ss' />

											</div>
											<div class="contxt" style="margin-top:-5px;">
												${util:preview(content,100)}
												<p class="r">
													<a href="<c:url value='/admin/service/view/${id}'/>">查看全文</a>
												</p>
											</div>
										</div>
										<div class="c"></div>
									</li>
								</s:iterator>
							</ul>
						</div>
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

