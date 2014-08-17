<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<HEAD>
	<TITLE>添加服务分类</TITLE>
	<link rel="stylesheet"
		href="<c:url value='/admin/styles/serviceType.css'/>" type="text/css" />
	<link media="screen" type="text/css"
		href="<c:url value='/scripts/validate/theme/grey/formcheck.css'/>"
		rel="stylesheet" />
	<script type="text/javascript"
		src="<c:url value='/scripts/validate/lang/zh-CN.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/scripts/validate/formcheck.js'/>"></script>
	<script type="text/javascript">
	 	window.addEvent('domready', function() {
			new FormCheck('serviceTypeForm');
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
							<img src="<c:url value='/admin/images/app_list_service.gif'/>" />
							服务
						</h2>
					</div>
					<div id="mainTab">
						<ul>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/service'/>">服务</a> </span>
							</li>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/serviceType'/>">服务分类</a> </span>
							</li>
							<li class="navtxt">
								<a href="<c:url value='/admin/serviceType/add'/>" style="text-decoration:none;">添加分类</a>
							</li>
						</ul>
					</div>
					<div id="serviceTypeEdit">
						<form id="serviceTypeForm" action="serviceType!save.html" method="post">
							<p>
								<span class="l">分类名称：</span><span class="r"><input
										style="width: 150px;" class="inputtext text-input validate['required']"  type="text"
										onblur="this.className='inputtext'"
										onfocus="this.className='inputtext2'" id="name"
										name="serviceType.name" /> </span><span class="t"><font
									color="red">*</font>必填</span>
							</p>
							<p>
								<span class="l">备注：</span><span class="r"><textarea
										class="inputtext text-input validate['required']"  style="width: 400px; height: 60px;"
										name="serviceType.remark" id="inputBox"
										onblur="this.className='textarea'"
										onfocus="this.className='textarea2'" /></textarea> </span><span class="t"><font
									color="red">*</font>必填</span>
							</p>
							<div class="c"></div>
							<div class="c h5"></div>
							<span class="l"></span>
							<span class="l"></span>
							<div class="c h10"></div>
							<div class="c h10"></div>
							<p style="text-align: center">
							<input type="submit" class="botton" value="提交"
										onMouseOut="this.className='botton';"
										onMouseOver="this.className='botton2';" />
							<input type="button" class="botton_close1" value="取消"
									onmouseout="this.className='botton_close1';"
									onmouseover="this.className='botton_close2';"
									onclick="javascript:history.back();"/>
							</p>
						</form>
						<div class="c"></div>
					</div>
					<div class="c"></div>
					<div class="boxs3_rt"></div>
					<div class="boxs3_lb"></div>
					<div class="boxs3_rb"></div>
				</div>
				<div class="c"></div>
			</div>
		</div>
	</div>
</BODY>

