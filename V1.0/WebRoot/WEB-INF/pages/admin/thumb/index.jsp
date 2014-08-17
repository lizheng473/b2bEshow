<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<HEAD>
	<TITLE>缩略图规则</TITLE>
	<link rel="stylesheet"
		href="<c:url value='/admin/styles/thumb.css'/>" type="text/css" />
</HEAD>
<BODY>
	<div id="main">
		<s:include value="../left.jsp"></s:include>
		<div id="mainarea">
			<div id="mainarea_bg">
				<div id="content">
					<div id="mainTop">
						<h2>
							<img src="<c:url value='/admin/images/app_list_system.gif'/>" />
							系统管理
						</h2>
					</div>
					<div id="mainTab">
						<ul>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/system'/>">网站参数</a> </span>
							</li>
							<li>
								<span class="txt6"><a href="<c:url value='/admin/role'/>">角色管理</a>
								</span>
							</li>
							<li class="on">
								<span class="txt6"><a
									href="<c:url value='/admin/thumb'/>">缩略图</a> </span>
							</li>
							<li>
								<span class="txt6"><a href="<c:url value='/admin/app'/>">组件管理</a>
								</span>
							</li>
							<li class="navtxt">
								<a href="<c:url value='/admin/thumb/add'/>">添加缩略图</a>
							</li>
						</ul>
					</div>
					<div>
						<div id="subnav">
							<strong>缩略图规则</strong>&nbsp;&nbsp;|&nbsp;&nbsp;
							<a href="<c:url value='/admin/thumbImg'/>">新缩略图</a>
						</div>
						<div id="thumbGroup">
							<s:action name="thumb!search" id="thumbList"
								executeResult="false">
							</s:action>
							<ul>
								<li style="color: #666; line-height: 14px; background: #f1f1f1;">
									<span class="l">名称</span><span class="l">模型</span><span
										class="l">宽x高</span><span class="l">描述</span>
								</li>
								<s:iterator value="%{#thumbList.thumbs}" status="rowStatus">
									<li id="thumb${id}" onmouseover="this.style.backgroundColor
										= '#f9f9f9';" onmouseout="this.style.backgroundColor='#ffffff';">
										<span class="l" style="font-size: 14px;" title="fds"><a
											href="<c:url value='/admin/thumb/view/${id}'/>" class="">${name}</a>
										</span>
										<span class="l c999" title="fds">${model}</span>

										<span class="l c999" title="fds">${width}&nbsp;x&nbsp;${height}</span>
										<span class="l c999" title="fds">${description}</span>

										<a href="<c:url value='/admin/thumb/edit/${id}'/>">修改</a>&nbsp;|&nbsp;
										<a
											href="javascript:if(confirm('确定要删除吗？')){location.href='<c:url value='/thumb!delete.html?id=${id}'/>'};">删除</a>
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

