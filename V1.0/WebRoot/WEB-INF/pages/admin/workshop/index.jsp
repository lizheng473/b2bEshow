<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<HEAD>
	<TITLE>Eshow_后台_产品</TITLE>
	<link rel="stylesheet"
		href="<c:url value='/admin/styles/productCategory.css'/>" type="text/css" />
	<style type="text/css">
			#securitiesGroup .l{width:105px;padding-left:10px;font-size:12px;}
	</style>	
		
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
							生产车间
						</h2>
					</div>
					<div id="mainTab">
						<ul>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/workshop'/>">生产车间列表</a> </span>
							</li>
							
							<li class="navtxt">
							<a href="<c:url value='/admin/workshop/add'/>" style="text-decoration:none">添加车间</a>
							</li>
						</ul>
					</div>
					<div id="celebrityList">
						<div id="securitiesGroup">
							<s:action name="workShop!list" id="workShopList"
								executeResult="false"/>
							<ul>
							
								<li style="color: #666; line-height: 14px; background: #f1f1f1;">
									<span class="l">车间名称</span>
									<span class="l">车间主任</span>
									<span class="l">车间电话</span>
									<span class="l">车间QQ</span>
									<span class="l">备注</span>
									<span class="l">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;操作</span>
								</li>
								
								<s:iterator value="%{#workShopList.workShops}"
									status="rowStatus">
									<li id="workShop${id}"
										onmouseover="this.style.backgroundColor='#f9f9f9';"
										onmouseout="this.style.backgroundColor='#ffffff';">
										
										<span class="l" style="font-size: 14px;" title="fds">${name }</span>
										<span class="l" style="font-size: 14px;" title="fds">${managername }</span>
										<span class="l" style="font-size: 14px;" title="fds">${tel }</span>
										<span class="l" style="font-size: 14px;" title="fds">${qq }</span>
										<span class="l c999" title="fds">${remark }</span>
<!-- 											<span class="r del"><a href="<c:url value='product/categoryP/${id}'/>">进入</a></span> -->
										<span class="r setting"><a
											href="<c:url value='/admin/workshop/edit/${id}'/>">修改</a> </span>
										<span class="r del"> <a href="javascript:void(0);"
											onclick="return deleteData('workshop',${id});">删除</a> </span>
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

