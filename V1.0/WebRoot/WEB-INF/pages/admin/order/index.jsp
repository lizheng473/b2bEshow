<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<HEAD>
	<TITLE>Eshow_后台_产品</TITLE>
	<link rel="stylesheet"
		href="<c:url value='/admin/styles/product.css'/>" type="text/css" />
</HEAD>
<BODY>
	<div id="main">
		<s:include value="../left.jsp"></s:include>
		<div id="mainarea">
			<div id="mainarea_bg">
				<div id="content">
					<div id="mainTop">
						<h2>
							<img src="<c:url value='/admin/images/app_list_product.gif'/>" />
							订单
						</h2>
					</div>
					<div id="mainTab">
						<ul>
							<li class="on">
								<span class="txt6"><a
									href="<c:url value='/admin/product'/>">订单列表</a> </span>
							</li>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/productCategory'/>">产品分类</a> </span>
							</li>
							<li class="navtxt">
								<a href="<c:url value='/admin/product/add'/>" style="text-decoration:none;">添加产品</a>
							</li>
						</ul>
					</div>
					<div id="celebrityList">
						<s:action name="order!search" id="orderFormList"
							executeResult="false">
							<s:param name="queryBean.order">addTime</s:param>
							<s:param name="queryBean.desc">true</s:param>
						</s:action>
						<div class="mtop">
							<span class="l">订单列表</span>
						</div>
						<ul>
							<s:iterator value="%{#orderFormList.orderForms}" status="rowStatus">
								<li class="list"
									onmouseover="this.style.backgroundColor='#f9f9f9';"
									onmouseout="this.style.backgroundColor='#ffffff';"
									id="product${id}">
									<div class="box">
										<div class="avatar">
<!-- 										<c:if test="${photo == null}"> -->
<!-- 											<img  src="${pageContext.request.contextPath}/common/images/user50-50.jpg" -->
<!-- 													  alt="${nickname}" width="50" height="50" /> -->
<!-- 										</c:if> -->
<!-- 										<c:if test="${photo != null}"> -->
<!-- 											<a href="<c:url value='product/view/${id}'/>"><img -->
<!-- 													src="${pageContext.request.contextPath}/upload/product/<s:date name='%{addTime}' format='yyyyMMdd' />/${img}" -->
<!-- 													width="50" height="50" /> </a> -->
<!-- 										</c:if> -->
										<a href="<c:url value='order/view/${id}'/>"><img
													src="${pageContext.request.contextPath}/upload/product/<s:date name='%{addTime}' format='yyyyMMdd' />/view/${img}"
													width="50" height="50" /> </a>
										</div>
<!-- 										<div class="name"> -->
<!-- 											<a href="/StockMatch/Stock?MatchId=2&uid=100397">${user.username}</a> -->
<!-- 										</div> -->
										
									</div>
									<div class="list_content">
									
										<div>
											名称：
											<span class="c333">${customeraddress}</span>
										</div>
										<div class="time">
											分类:
											<c:if test="${productCategory.name != null}">
											${productCategory.name}&nbsp;&nbsp;|&nbsp;&nbsp;
											</c:if>
											${customername}&nbsp;&nbsp;订购于
											<s:date name='%{addTime}' format='yyyy-MM-dd HH:mm:ss' />
											
										</div>
										<div class="tips">
											<a href="<c:url value='/admin/order/edit/${id }'/>">订单处理</a>
											&nbsp;&nbsp;|&nbsp;&nbsp;
											<a href="javascript:void(0);"
												onclick="return deleteData('order',${id});">删除</a>
										</div>

										<div class="contxt">
											${util:preview(content,100)}
											<p class="r">
												<a href="<c:url value='/admin/order/view/${id}'/>">订单详情</a>
											</p>
										</div>
									</div>
								</li>
							</s:iterator>
						</ul>
						<div class="c"></div>
						<%@ include file="/common/page.jsp"%>
					</div>
					<div class="c"></div>
				</div>
			</div>
			<div class="c"></div>
		</div>
		<div class="c"></div>
	</div>
</BODY>

