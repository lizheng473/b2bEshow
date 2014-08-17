<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="photo!view" id="view" executeResult="false" />
<HEAD>
	<TITLE>修改图片</TITLE>
	<link rel="stylesheet" href="<c:url value='/admin/styles/album.css'/>"
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
		new FormCheck('photoForm');
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
							<img src="<c:url value='/admin/images/app_list_album.gif'/>" />
							修改图片${view.photo.name}
						</h2>
					</div>
					<div id="mainTab">
						<ul>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/album'/>">相册</a> </span>
							</li>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/photo'/>">图片列表</a> </span>
							</li>
							<li class="navtxt">
								<a href="<c:url value='/admin/photo/add'/>">上传图片</a>
							</li>
						</ul>
					</div>
					<div id="photoEdit">
						<s:form id="photoForm" action="photo!update.html" method="post"
							enctype="multipart/form-data">
							<s:hidden name="id" value="%{#view.photo.id}"></s:hidden>
							<p>
								<span class="l">图片名称&nbsp;</span><span class="r">&nbsp; <input
										class="inputtext text-input validate['required']"
										style="width: 150px;" class="inputtext" type="text"
										onblur="this.className='inputtext'"
										onfocus="this.className='inputtext2'" id="username"
										name="photo.name" value="${view.photo.name}" /> </span><span class="t"><font color="red">*</font>必填</span>
							</p>
							<p>
								<span class="l">图片描述&nbsp;</span>
								<span class="r">&nbsp; <textarea name="photo.description"
										cols="40" rows="4" id="description">${view.photo.description}</textarea>
								</span>
							</p>
							<p>
								<span class="l">选择相册&nbsp;</span>
								<span class="r">&nbsp; <s:action name="album!search"
										id="albumList" executeResult="false">
									</s:action> <select id="albumId" name="albumId">
										<s:iterator value="%{#albumList.albums}" status="rowStatus">
											<option value="${id}"
												<c:if test="${view.photo.album.id==id}">selected='selected'</c:if>>
												${name}
											</option>
										</s:iterator>
									</select> </span>
							</p>
							<p>
								<span class="l">选择图片&nbsp;</span>
								<span class="r">&nbsp; <input type="file" name="file"
										size="38" /> </span>
							</p>
							<div>
								<span class="l"><c:if test="${view.photo.id!=null}">
										<img
											src="${pageContext.request.contextPath}/upload/photo/<s:date name='%{#view.photo.addTime}' format='yyyyMMdd' />/${view.photo.img}" />
									</c:if> </span>
							</div>
							<p>
								<span class="l"></span><span class="r"><input
										type="submit" class="botton" value="修改"
										onMouseOut="this.className='botton';"
										onMouseOver="this.className='botton2';" /> <input
										type="button" class="botton_close1" value="取消"
										onmouseout="this.className='botton_close1';"
										onmouseover="this.className='botton_close2';"
										onclick="javascript:history.back();" /> </span>
							</p>
						</s:form>
					</div>
				</div>
				<div class="c"></div>
			</div>
			<div class="c"></div>
		</div>
	</div>
</BODY>
