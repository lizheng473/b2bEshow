<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="thumb!view" id="view" executeResult="false" />
<HEAD>
	<TITLE>修改缩略图规则${view.thumb.name}</TITLE>
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
							系统管理
						</h2>
					</div>
					<div id="mainTab">
						<ul>
							<li>
								<span class="txt6"><a href="<c:url value='/admin/thumb'/>">缩略图规则</a>
								</span>
							</li>
							<li class="on">
								<span class="txt6"><a href="">缩略图规则修改</a> </span>
							</li>
							<li class="navtxt">
								<a href="<c:url value='/admin/thumb/add'/>">添加缩略图规则</a>
							</li>
						</ul>
					</div>
					<div id="thumbEdit">
						<s:form id="thumbForm" action="thumb!update" method="post"
							enctype="multipart/form-data">
							<s:hidden name="id" value="%{#view.thumb.id}"></s:hidden>
							<p>
								<span class="l">名称&nbsp;</span>
								<span class="r">&nbsp; <input name="thumb.name"
										class="inputtext" style="width: 200px;" maxlength="50"
										type="text" onblur="this.className='inputtext'"
										value="${view.thumb.name}" /> </span>
							</p>
							<p>
								<span class="l">宽x高</span>
								<input name="thumb.width" class="inputtext" style="width: 95px;"
									maxlength="50" type="text" onblur="this.className='inputtext'"
									value="${view.thumb.width}" />x<input name="thumb.height" class="inputtext" style="width: 95px;"
									maxlength="50" type="text" onblur="this.className='inputtext'"
									value="${view.thumb.height}" />
							</p>
							<p>
								<span class="l">类型</span>
								<input name="thumb.model" class="inputtext" style="width: 200px;"
									maxlength="50" type="text" onblur="this.className='inputtext'"
									value="${view.thumb.model}" />
							</p>
							<p>
								<span class="l">描述</span>
								<input name="thumb.description" class="inputtext" style="width: 200px;"
									maxlength="50" type="text" onblur="this.className='inputtext'"
									value="${view.thumb.description}" />
							</p>
							<p style="margin-left: 90px;">
								<input type="submit" class="botton" value="修改"
									onmouseout="this.className='botton';"
									onmouseover="this.className='botton2';" />
								<input type="button" class="botton_close1" value="取消"
									onmouseout="this.className='botton_close1';"
									onmouseover="this.className='botton_close2';"
									onclick="javascript:history.back();" />
							</p>
						</s:form>
					</div>
				</div>
				<div class="c"></div>
			</div>
		</div>
	</div>
	
</BODY>

