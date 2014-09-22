<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="product!view" id="view" executeResult="false">
</s:action>
<HEAD>
	<TITLE>${view.product.name}</TITLE>
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
							产品
						</h2>
					</div>
					<div id="mainTab">
						<ul>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/product'/>">产品列表</a> </span>
							</li>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/productCategory'/>">产品分类</a> </span>
							</li>

							<li class="on">
								<span class="txt6"><a>产品详细</a> </span>
							</li>
							<li class="navtxt">
								<a href="<c:url value='/admin/product/add'/>" style="text-decoration:none;">添加产品</a>
							</li>
						</ul>
					</div>
					<div id="productView">
						<s:form action="product!view.html" method="post"
							cssClass="creat_form clearfix">
							<input type="hidden" name="id" value="${view.product.id}" />
							<div class="title">
								<span>${view.product.name}<br/></span><span class="r" style=" color: #999; font-size: 12px;"><a href="<c:url value='/admin/product/edit/${view.product.id}'/>">修改</a>
								</span>
								<span style="font-weight: bold; color: #999; font-size: 12px;">&nbsp;&nbsp;${view.product.user.username}&nbsp;&nbsp;&nbsp;发布于${view.product.addTime}</span>
							</div>
							<br />
							<div align="center">
								<img
									src="${pageContext.request.contextPath}/upload/product/<s:date name='%{#view.product.addTime}' format='yyyyMMdd' />/view/${view.product.img}"
									width="200" height="200" />

							</div>
							<div class="c"></div>
							<div class="contxt">
								&nbsp;&nbsp;${view.product.content}
							</div>
						</s:form>
					</div>
				</div>
				<div class="c"></div>
			</div>
		</div>
	</div>
</BODY>

