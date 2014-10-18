<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<HEAD>
	<TITLE>日志分类</TITLE>
	<link rel="stylesheet"
		href="<c:url value='/admin/styles/productCategory.css'/>"
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
			new FormCheck('productCategoryForm');
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
							基本设置
						</h2>
					</div>
					<div id="mainTab">
						<ul>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/workshop'/>">生产车间列表</a> </span>
							</li>
							
							<li class="navtxt">
								<a href="<c:url value='/admin/workshop/add'/>">添加车间</a>
							</li>
						</ul>
					</div>
					<div id="securitiesTxt">
						<form id="workShopForm" action="workShop!save.html" method="post">
							<p>
								<span class="l">车间名称：</span><span class="r"><input
										style="width: 150px;" class="inputtext text-input validate['required']" type="text"
										onblur="this.className='inputtext'"
										onfocus="this.className='inputtext2'" id="name"
										name="workShop.name" /> </span><span class="t"><font
									color="red">*</font>必填</span>
							</p>
							<p>
								<span class="l">车间主任：</span><span class="r"><input
									style="width: 150px;" class="inputtext text-input validate['required']" type="text"
									onblur="this.className='inputtext'"
									onfocus="this.className='inputtext2'" id="name"
									name="workShop.managername" /> </span><span class="t"><font
								color="red">*</font>必填</span>
							</p>
							<p>
								<span class="l">车间电话：</span><span class="r"><input
									style="width: 150px;" class="inputtext text-input validate['required']" type="text"
									onblur="this.className='inputtext'"
									onfocus="this.className='inputtext2'" id="name"
									name="workShop.tel" /> </span><span class="t"><font
								color="red">*</font>必填</span>	
									
							</p>
							<p>
								<span class="l">车间QQ：</span><span class="r"><input
								style="width: 150px;" class="inputtext text-input validate['required']" type="text"
								onblur="this.className='inputtext'"
								onfocus="this.className='inputtext2'" id="name"
								name="workShop.qq" /> </span><span class="t"><font
								color="red">*</font>必填</span>	
							</p>
							<p>
								<span class="l">车间备注：</span><span class="r"><textarea
										class="inputtext text-input validate['required']"  style="width: 400px; height: 60px;"
										name="workShop.remark" id="inputBox"
										onblur="this.className='textarea'"
										onfocus="this.className='textarea2'" /></textarea> </span><span class="t"><font
									color="red">*</font>必填</span>
							</p>
							<div class="c"></div>
							<div class="c h5"></div>
							<span class="l"></span>
							<div class="c h10"></div>
							<p>
								<span class="l"></span><span class="r"><input
										type="submit" class="botton" value="提交"
										onMouseOut="this.className='botton';"
										onMouseOver="this.className='botton2';" /> </span>
							</p>
						</form>
						<div class="c"></div>
					</div>
					<div class="c"></div>
				</div>
				<div class="c"></div>
			</div>
		</div>
	</div>
</BODY>

