<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>
<s:action name="workShop!view" id="view" executeResult="false" />
<HEAD>
	<title>Eshow_后台_产品</title>
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
							<li class="on">
								<span class="txt6"><a
									href="<c:url value='/admin/product'/>">车间信息维护</a> </span>
							</li>
							
						</ul>
					</div>
					<div id="productEdit">
						<s:form id="productForm" action="workShop!update.html"
							method="post" enctype="multipart/form-data">
							<s:hidden name="id" value="%{#view.orderForm.id}"></s:hidden>
							<p>
								<span class="l">车间名称:&nbsp;</span>
								 <input name="workShop.name" style="width: 300px;" maxlength="50"
										type="text" onblur="this.className='inputtext'" 
										class="inputtext text-input validate['required']" 
										value="${view.workShop.name}" />
							</p>
							<p>
								<span class="l">车间主任：</span><span class="r"><input
									style="width: 150px;" class="inputtext text-input validate['required']" type="text"
									onblur="this.className='inputtext'"
									onfocus="this.className='inputtext2'" id="name"
									name="workShop.managername" value="${view.workShop.managername}"/> </span><span class="t"><font
								color="red">*</font>必填</span>
							</p>
							<p>
								<span class="l">车间电话：</span><span class="r"><input
									style="width: 150px;" class="inputtext text-input validate['required']" type="text"
									onblur="this.className='inputtext'"
									onfocus="this.className='inputtext2'" id="name"
									name="workShop.tel"  value="${view.workShop.tel}"/> </span><span class="t"><font
								color="red">*</font>必填</span>	
									
							</p>
							<p>
								<span class="l">车间QQ：</span><span class="r"><input
								style="width: 150px;" class="inputtext text-input validate['required']" type="text"
								onblur="this.className='inputtext'"
								onfocus="this.className='inputtext2'" id="name"
								name="workShop.qq"  value="${view.workShop.qq}"/> </span><span class="t"><font
								color="red">*</font>必填</span>	
							</p>
							<p>
								<span class="l">车间备注：</span><span class="r"><textarea
										class="inputtext text-input validate['required']"  style="width: 400px; height: 60px;"
										name="workShop.remark" id="inputBox"
										onblur="this.className='textarea'"
										onfocus="this.className='textarea2'"  />${view.workShop.remark}</textarea> </span><span class="t"><font
									color="red">*</font>必填</span>
							</p>
							<p align="center">
								<input type="submit" class="botton" value="提交"
									onmouseout="this.className='botton';"
									onmouseover="this.className='botton2';"/>
								<input type="button" class="botton_close1" value="取消"
									onmouseout="this.className='botton_close1';"
									onmouseover="this.className='botton_close2';"
									onclick="javascript:history.back();"/>
							</p>
						</s:form>
					</div>
				</div>
				<div class="c"></div>
			</div>
		</div>
	</div>
</BODY>

