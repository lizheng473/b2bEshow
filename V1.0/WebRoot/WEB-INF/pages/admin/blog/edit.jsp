<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="blog!view" id="view" executeResult="false" />
<HEAD>
	<TITLE>修改日志_${view.blog.title}</TITLE>
	<link rel="stylesheet" href="<c:url value='/admin/styles/blog.css'/>"
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
		new FormCheck('blogForm');
	});
</script>
	<script type="text/javascript" charset="utf-8"
		src="<c:url value="/components/kindeditor/kindeditor.js"/>"></script>
	<script type="text/javascript">
    KE.show({
        id : 'ke-text'
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
							<img src="<c:url value='/admin/images/app_list_blog.gif'/>" />
							日志
						</h2>
					</div>
					<div id="mainTab">
						<ul>
							<li class="txt6">
								<span class="txt6"><a href="<c:url value='/admin/blog'/>">日志列表</a>
								</span>
							</li>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/blog/our'/>">我的日志</a> </span>
							</li>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/category'/>">分类管理</a> </span>
							</li>
							<li class="navtxt">
								<a href="<c:url value='/admin/blog/add'/>">发表文章</a>
							</li>
							<li class="bnt1">
								<span class="txt6"><a
									href="<c:url value='/admin/topic'/>">讨论区</a> </span>
							</li>
						</ul>
					</div>
					<div id="blogEdit">
						<s:form action="blog!update.html" method="post"
							cssClass="creat_form clearfix">
							<input type="hidden" name="id" value="${view.blog.id}" />
							<p>
								<span class="l">日志标题:&nbsp;</span>
								<span class="r">&nbsp;<input type="text" id="title"
								        class="inputtext text-input validate['required']"
										name="blog.title" value="${view.blog.title}"
										style="width: 300px;" maxlength="50"> </span>
							</p>
							<br />
							<p>
								<span class="l"> 选择分类:&nbsp;</span>
								<s:action name="category!list" id="categoryList"
									executeResult="false" />
								<select name="categoryId">
									<s:iterator value="%{#categoryList.categories}"
										status="rowStatus">
										<option value="${id}"
											<c:if test="${view.blog.category.id==id}">selected="selected"</c:if>>
											${name}
										</option>
									</s:iterator>
								</select>
							</p>
							<p>
								<span class="l">内&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;容:&nbsp;</span>
								<span class="l"><textarea id="ke-text" class="textarea text-input validate['required']"
										name="blog.content" style="width: 600px; height: 300px;">${view.blog.content}</textarea>
								</span>
							</p>
							<p style="width: 640px; text-align: center;">
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
			<div class="c"></div>
			<div class="boxs3_rt"></div>
			<div class="boxs3_lb"></div>
			<div class="boxs3_rb"></div>
		</div>
	</div>
</BODY>

