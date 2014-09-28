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
			<s:form action="order!view" method="post" cssClass="creat_form clearfix">
			<div>
				<input type="hidden" name="id" value="${view.product.id}" /> <br />
				<table>
				<tr>
					<td>
							<img
								src="${pageContext.request.contextPath}/upload/product/<s:date name='%{#view.product.addTime}' format='yyyyMMdd' />/view/${view.product.img}"
								width="200" height="200" />
					</td>
					
				<td>
					<p>
							<span class="l">产品名称:&nbsp;</span>
									<span class="r">&nbsp; <input name="product.material"
											class="inputtext text-input validate['required']"  style="width: 300px;" maxlength="50"
											type="text" onblur="this.className='inputtext'" 
											value = "${view.product.name}" readOnly
											/> </span>
					</p>
					<p>
								<span class="l">产品类别:&nbsp;</span>
								<span class="r">&nbsp; <s:action
										name="productCategory!list" id="productCategoryList"
										executeResult="false" /> <select name="productCategoryId" readOnly>
										<s:iterator value="%{#productCategoryList.productCategories}"
											status="rowStatus">
											<option value="${id}">
												${name}
											</option>
										</s:iterator>
									</select> </span>
							</p>
							<p>
								<span class="l">产品材质:&nbsp;</span>
								<span class="r">&nbsp; <input name="product.material"
										class="inputtext text-input validate['required']"  style="width: 300px;" maxlength="50"
										type="text" onblur="this.className='inputtext'" 
										value = "${view.product.material}" readOnly
										/> </span>
							</p>
							<p>
								<span class="l">产品产地:&nbsp;</span>
								<span class="r">&nbsp; <input name="product.origin"
										class="inputtext text-input validate['required']"  style="width: 300px;" maxlength="50"
										type="text" onblur="this.className='inputtext'" 
										value = "${view.product.origin}" readOnly
										/> </span>
							</p>
							<p>
								<span class="2">产品尺寸:&nbsp;</span>
								<span class="r">&nbsp; <input name="product.size"
										class="inputtext text-input validate['required']"  style="width: 300px;" maxlength="50"
										type="text" onblur="this.className='inputtext'" 
										value = "${view.product.size}" readOnly
										/> </span>
							</p>
							<p>
								<span class="2">产品售价:&nbsp;</span>
								<span class="r">&nbsp; <input name="product.price"
										class="inputtext text-input validate['required']"  style="width: 300px;" maxlength="50"
										type="text" onblur="this.className='inputtext'" 
										value = "${view.product.price}" readOnly
										/> </span>
							</p>
							<p>
							
								<input type="submit" class="botton" value="购买"/>
								
								<a	href="<c:url value='/order/prepareAddOrder/${view.product.id}'/>"> 购买</a>
								
							</p>
					
				</td>
				</tr>
				<tr>
				<td>
				
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