<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="service!view" id="view" executeResult="false" />
<HEAD>
	<TITLE>服务分类</TITLE>
	<link rel="stylesheet"
		href="<c:url value='/admin/styles/serviceType.css'/>" type="text/css" />
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
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/service'/>">服务列表</a> </span>
							</li>
							<li class="on">
								<span class="txt6"><a
									href="<c:url value='/admin/serviceType'/>">服务分类</a> </span>
							</li>
							<li class="navtxt">
								<a href="<c:url value='/admin/serviceType/add'/>" style="text-decoration:none;">添加分类</a>
							</li>
						</ul>
					</div>
					<div id="celebrityList">
						<div id="securitiesGroup">
							<s:action name="serviceType!search" id="serviceTypeList"
								executeResult="false"></s:action>
							<ul>
								<li style="color: #666; line-height: 14px; background: #f1f1f1;"
									id="serviceType${id}">
									<span class="l">分类名称</span><span class="l">备注</span>
								</li>
								<s:iterator value="%{#serviceTypeList.serviceTypes}"
									status="rowStatus">
									<li onmouseover="this.style.backgroundColor='#f9f9f9';"
										onmouseout="this.style.backgroundColor='#ffffff';"
										id="serviceType${id}">
										<span class="l" style="font-size: 14px;" title="fds">${name}</span><span
											class="l c999" title="fds">${remark}</span><span
											class="r setting"><a
											href="<c:url value='/admin/serviceType/edit/${id}'/>">修改</a>
										</span>

										<span class="r del"> <a href="javascript:void(0);"
											onclick="return deleteData('serviceType',${id});">删除</a> </span>

									</li>

								</s:iterator>
							</ul>
						</div>
						<div class="c"></div>
					</div>
				</div>

				<div class="c"></div>
				<div class="boxs3_rt"></div>
				<div class="boxs3_lb"></div>
				<div class="boxs3_rb"></div>
			</div>
		</div>
	</div>
</BODY>

