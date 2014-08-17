<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<HEAD>
	<TITLE>Eshow_后台_产品</TITLE>
	<link rel="stylesheet"
		href="<c:url value='/admin/styles/productCategory.css'/>" type="text/css" />
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
							<li  class="on">
								<span class="txt6"><a href="<c:url value='/admin/productCategory'/>">产品分类</a>
								</span>
							</li>
							<li class="navtxt">
							<a href="<c:url value='/admin/productCategory/add'/>" style="text-decoration:none">添加分类</a>
							</li>
						</ul>
					</div>
					<div id="celebrityList">
						<div id="securitiesGroup">
							<s:action name="productCategory!list" id="productCategoryList"
								executeResult="false"/>
							<ul>
								<li style="color: #666; line-height: 14px; background: #f1f1f1;">
									<span class="l">分类名称</span><span class="l">备注</span><span class="l">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;搜索</span>
								</li>
								
								<s:iterator value="%{#productCategoryList.productCategories}"
									status="rowStatus">
									<li id="productCategory${id}"
										onmouseover="this.style.backgroundColor='#f9f9f9';"
										onmouseout="this.style.backgroundColor='#ffffff';">
										<span class="l" style="font-size: 14px;" title="fds">${name }</span><span
											class="l c999" title="fds">${description }</span>
											<span class="r del"><a href="<c:url value='product/categoryP/${id}'/>">进入</a></span>
											<span
											class="r setting"><a
											href="<c:url value='/admin/productCategory/edit/${id}'/>">修改</a> </span>
										<span class="r del"> <a href="javascript:void(0);"
											onclick="return deleteData('productCategory',${id});">删除</a> </span>
									</li>
								</s:iterator>
							</ul>
						</div>
						<div class="c"></div>
					</div>
				</div>
				<div class="c"></div>
			</div>
		</div>
	</div>
</BODY>

