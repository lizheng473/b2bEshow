<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="role!view" id="view" executeResult="false" />
<HEAD>
	<TITLE>修改角色${view.role.name}</TITLE>
	<link rel="stylesheet" href="<c:url value='/admin/styles/role.css'/>"
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
							系统管理
						</h2>
					</div>
					<div id="mainTab">
						<ul>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/system'/>">网站参数</a> </span>
							</li>
							<li class="on">
								<span class="txt6"><a
									href="<c:url value='/admin/role'/>">角色管理</a> </span>
							</li>
						</ul>
					</div>
					<div id="analysisEdit">
						<s:form id="roleForm" action="role!update.html" method="post">
							<s:hidden name="id" value="%{#view.role.id}"></s:hidden>
							<p>
								<span class="l">角色代码&nbsp;</span>
								<span class="r">&nbsp; <input name="role.name"
										class="inputtext" style="width: 200px;" maxlength="50"
										type="text" onblur="this.className='inputtext'"
										value="${view.role.name}" /> </span>
							</p>
							<p>
								<span class="l">角色描述&nbsp;</span>
								<span class="r">&nbsp; <input name="role.description"
										class="inputtext" style="width: 200px;" maxlength="50"
										type="text" onblur="this.className='inputtext'"
										value="${view.role.description}" /> </span>
							</p>
							<div class="c"></div>
							<div class="c h5"></div>
							<p style="margin-left: 98px;">
								<input type="submit" class="botton" value="修改"
									onmouseout="this.className='botton';"
									onmouseover="this.className='botton2';" />
								<input type="button" class="botton_close1" value="取消"
									onmouseout="this.className='botton_close1';"
									onmouseover="this.className='botton_close2';"
									onclick="javascript:CreateAnalysis.cancelCreate()" />
							</p>
						</s:form>
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

