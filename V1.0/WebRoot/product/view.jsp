<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<s:action name="product!view" id="view" executeResult="false"></s:action>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>${view.product.name}</title>
		<meta name="keywords" content="${view.product.name}" />
		<meta name="description" content="${view.product.name}" />
	</head>
	<body>
		<div id="content">
			<div id="postpath">
				<strong>当前页面：<a href="<c:url value='/'/>" title="首页">首页</a>
					&raquo; ${view.product.name}</strong>
				<c:if test="${pageContext.request.remoteUser != null}">
<!-- 					<a href="<c:url value='/admin/blog/edit/${view.product.id}'/>">修改</a> -->
				</c:if>
			</div>

			<!-- .post -->
			<s:form action="product!view.html" method="post" cssClass="creat_form clearfix">
			<div>
				<input type="hidden" name="id" value="${view.product.id}" /> <br />
				<table>
				<tr>
					<td>
							<img
								src="${pageContext.request.contextPath}/upload/product/<s:date name='%{#view.product.addTime}' format='yyyyMMdd' />/${view.product.img}"
								width="200" height="200" />
					</td>
					<td>
						${view.product.name}
					<input type="submit" class="botton" value="购买"/>
					</td>
				</tr>
				<tr>
					<td colspan=2>
					
					<div class="contxt">规格参数</div>
					</td>
				</tr>
					<tr>
					<td colspan=2>
					<div class="contxt">&nbsp;&nbsp;${view.product.content}</div>
					</td>
				</tr>
				</table>				
			</div>
		</s:form>
		</div>
		<!-- #content -->

		<div id="sidebar">

			<div class="sidebar_li">
				<ul>
				<s:action name="productCategory!list" id="productCategoryList"
						executeResult="false">
					</s:action>
					<s:iterator value="%{#productCategoryList.productCategories}" status="rowStatus">
						<li class="page_item">
							<a href="<c:url value='/product/categories/${id}'/>" title="${name}">${name}</a>

						</li>
					</s:iterator>
				</ul>
			</div>
		</div>
		<!-- #sidebar -->
	</body>
</html>