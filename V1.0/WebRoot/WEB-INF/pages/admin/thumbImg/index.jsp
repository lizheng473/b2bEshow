<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<HEAD>
	<TITLE>新缩略图</TITLE>
	<link rel="stylesheet" href="<c:url value='/admin/styles/thumb.css'/>"
		type="text/css" />
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
							系统设置
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
							<a href="<c:url value='/admin/thumb'/>">缩略图规则</a>&nbsp;&nbsp;|&nbsp;&nbsp;
							<strong>新缩略图</strong>
						</div>
						<div id="analysis">
							<div class="subtitle">
								<span class="l">新缩略图</span>
							</div>
							<s:action name="thumbImg!search" id="thumbImglist"
								executeResult="false">
								<s:param name="queryBean.order">addTime</s:param>
								<s:param name="queryBean.desc">true</s:param>
							</s:action>
							<ul class="flist">
								<s:iterator value="%{#thumbImglist.thumgImgs}"
									status="rowStatus">
									<li id="thumbImg${id}"
										onmouseover='this.style.backgroundColor ="#f9f9f9"'
										onmouseout='this.style.backgroundColor =""'>
										<div class="avatar">
											<a href="<c:url value='/admin/thumbImg/view/${id}'/>"><img
													src="${pageContext.request.contextPath}/upload/thumbImg/<s:date name='%{addTime}' format='yyyyMMdd' />/${img}"
													width="50" height="50" /> </a>
										</div>
										<div class="cont">
											<div class="time">
												<a href="<c:url value='/admin/thumbImg/view/${id}'/>">${name}1</a>&nbsp;&nbsp;|&nbsp;&nbsp;更新于
												<s:date name='%{addTime}' format='yyyy-MM-dd HH:mm:ss' />
												<span>&nbsp;&nbsp;&nbsp;&nbsp;(<a
													href="javascript:if(confirm('确定要删除吗？')){location.href='<c:url value='/thumbImg!delete.html?id=${id}'/>'};">删除</a>)</span>
											</div>
											<div class="contxt">
												<p class="r">
													<a href="<c:url value='/admin/thumbImg/view/${id}'/>">${type}</a>
												</p>
											</div>
										</div>
										<div class="c"></div>
									</li>
								</s:iterator>
							</ul>
						</div>
					</div>

					<div class="c"></div>
					<div class="pager">
						<div id="articeBottom">
							<%@ include file="/common/page.jsp"%>
						</div>
					</div>
				</div>
				<div class="c"></div>
			</div>
			<div class="c"></div>
			<div class="boxs3_rt"></div>
			<div class="boxs3_lb"></div>
			<div class="boxs3_rb"></div>
		</div>
	</div>
</BODY>

