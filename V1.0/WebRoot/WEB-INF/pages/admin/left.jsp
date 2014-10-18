<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div id="appSide">
	<div id="appSideBg">
		<ul class="appList">
		
		
			<li>
				<img src="<c:url value='/admin/images/app_list_blog.gif'/>">
				<a href="<c:url value='/admin/product'/>">产品</a>
				<em><a href="<c:url value='/admin/product/add'/>">发布产品</a> </em>
			</li>
			
			
			<li>
				<img src="<c:url value='/admin/images/app_list_blog.gif'/>">
				<a href="<c:url value='/admin/blog'/>">新闻</a>
				<em><a href="<c:url value='/admin/blog/add'/>">发布</a> </em>
			</li>
			<li>
				<img src="<c:url value='/admin/images/app_list_album.gif'/>">
				<a href="<c:url value='/admin/album'/>">相册</a>
				<em><a href="<c:url value='/admin/photo/add'/>">上传图片</a> </em>
			</li>
			<li>
				<img src="<c:url value='/admin/images/app_list_info.gif'/>">
				<a href="<c:url value='/admin/info'/>">信息页</a>
			</li>
			<li>
				<img src="<c:url value='/admin/images/app_list_info.gif'/>">
				<a href="<c:url value='/admin/order'/>">订单查询</a>
			</li>
			<li>
				<img src="<c:url value='/admin/images/app_list_info.gif'/>">
				<a href="<c:url value='/admin/workshop'/>">生产车间维护</a>
			</li>
		</ul>
		<div class="appPix"></div>
		<div class="appAdd">
			<ul>
				<li class="addapp">
					<a href="<c:url value='/admin/app/add'/>">添加组件</a>
				</li>
				<li class="setapp">
					<a href="<c:url value='/admin/app'/>">管理组件</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="c"></div>
	<div class="boxs2_lt"></div>
	<div class="boxs2_lb"></div>
</div>