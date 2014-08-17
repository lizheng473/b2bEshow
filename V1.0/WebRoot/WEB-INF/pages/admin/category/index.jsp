<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<HEAD>
	<TITLE>日志分类</TITLE>
	<link rel="stylesheet"
		href="<c:url value='/admin/styles/category.css'/>" type="text/css" />
</HEAD>
<BODY>
	<div id="main">
		<s:include value="../left.jsp"></s:include>
		<div id="mainarea">
			<div id="mainarea_bg">
				<div id="content">
					<div id="mainTop">
						<h2>
							<img src="<c:url value='/admin/images/app_list_blog.gif'/>" />
							分类管理
						</h2>
					</div>
					<div id="mainTab">
						<ul>
							<li>
								<span class="txt6"><a href="<c:url value='/admin/blog'/>">日志列表</a>
								</span>
							</li>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/blog/mine'/>">我的日志</a> </span>
							</li>
							<li class="on">
								<span class="txt6"><a
									href="<c:url value='/admin/category'/>">分类管理</a> </span>
							</li>
							<li class="navtxt">
								<a href="<c:url value='/admin/category/add'/>">添加分类</a>
							</li>

							<li class="bnt1">
								<span class="txt6"><a
									href="<c:url value='/admin/topic'/>">讨论区</a> </span>
							</li>
						</ul>
					</div>
					<div id="categoryGroup">
						<s:action name="category!list" id="categoryList"
							executeResult="false">
						</s:action>
						<ul>
							<li style="color: #666; line-height: 14px; background: #f1f1f1;">
								<span class="l">分类名称</span><span class="l">备注</span>
							</li>
							<s:iterator value="%{#categoryList.categories}"	status="rowStatus">
								<li id="category${id}">
									<span class="l" style="font-size: 14px;" title="fds"><a href="<c:url value="/admin/blog/c/${id}"/>">${name}</a></span><span
										class="l c999" title="fds">${remark}</span><span
										class="r setting"><a
										href="<c:url value='/admin/category/edit/${id}'/>">修改</a> </span>
									<span class="r del"> <a href="javascript:void(0);"
										onclick="return deleteData('category',${id});">删除</a> </span>
								</li>
							</s:iterator>
						</ul>
					</div>
					<div class="c"></div>
				</div>
				<div class="c"></div>
			</div>
		</div>
	</div>
</BODY>

