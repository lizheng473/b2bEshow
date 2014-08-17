<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<HEAD>
	<TITLE>Eshow_后台_产品</TITLE>
	<link rel="stylesheet" href="<c:url value='/admin/styles/product.css'/>"
		type="text/css" />
	<link media="screen" type="text/css"
		href="<c:url value='/scripts/validate/theme/grey/formcheck.css'/>"
		rel="stylesheet" />
	<script type="text/javascript"
		src="<c:url value='/scripts/validate/lang/zh-CN.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/scripts/validate/formcheck.js'/>"></script>
	<script type="text/javascript">
	 	window.addEvent('domready', function() {
			new FormCheck('productForm');
		});
    </script>
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
							<li class="navtxt">
								<a href="<c:url value='/admin/productCategory/add'/>" style="text-decoration:none;">添加产品</a>
							</li>
						</ul>
					</div>
					<div id="productEdit">
						<s:form id="productForm" action="product!save.html" method="post"
							enctype="multipart/form-data">
							<p>
								<span class="l">产品名称:&nbsp;</span>
								<span class="r">&nbsp; <input name="product.name"
										class="inputtext text-input validate['required']"  style="width: 300px;" maxlength="50"
										type="text" onblur="this.className='inputtext'" /> </span>
							</p>
							<p>
								<span class="l">选择分类:&nbsp;</span>
								<span class="r">&nbsp; <s:action
										name="productCategory!list" id="productCategoryList"
										executeResult="false" /> <select name="productCategoryId">
										<s:iterator value="%{#productCategoryList.productCategories}"
											status="rowStatus">
											<option value="${id}">
												${name}
											</option>
										</s:iterator>
									</select> </span>
							</p>
							<p>
								<span class="l">选择图片:&nbsp;</span>
								<span class="r">&nbsp; <input type="file" name="file"
										size="38" class="inputtext text-input validate['required']" /> </span>
							</p>
							<script language="javascript">
							$(document).addEvent(function() {
							    window.onbeforeunload = function() {
							        if (getContentLength() >0)
							        {
							            return "文章还没发表，离开将丢失当前的内容";
							        }
							    };
							});
							</script>
							<p>
								<span class="l">内&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;容:&nbsp;</span>
								<span class="r"> <script type="text/javascript">
								    KE.show({
								        id : 'ke-text'
								    });
								 </script> <textarea id="ke-text" name="product.content"
										style="width: 600px; height: 300px;"></textarea> </span>
							</p>
							<p style="width: 640px; text-align: center;">
								<input type="submit" class="botton" value="提交"
									onmouseout="this.className='botton';"
									onmouseover="this.className='botton2';" />
								<input type="button" class="botton_close1" value="取消"
									onmouseout="this.className='botton_close1';"
									onmouseover="this.className='botton_close2';"
									onclick="javascript:history.back();"/>
							</p>
							<p>
								<input type="hidden" id="securitiesIds" name="listSecuritiesIds" />
							</p>
							<div class="c h10"></div>
						</s:form>
					</div>
				</div>
				<div class="c"></div>
			</div>
			<div class="c"></div>
		</div>
	</div>
</BODY>

