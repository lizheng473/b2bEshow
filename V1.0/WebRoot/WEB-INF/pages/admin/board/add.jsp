<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<HEAD>
	<TITLE>日志分类</TITLE>
	<link rel="stylesheet"
		href="<c:url value='/admin/styles/board.css'/>" type="text/css" />
</HEAD>
<BODY>
	<div id="main">
		<s:include value="../left.jsp"></s:include>
		<div id="mainarea">
			<div id="mainarea_bg">
				<div id="content">
					<div id="mainTop">
						<h2>
							<img src="<c:url value='/admin/images/app_list_topic.gif'/>" />
							基本设置
						</h2>
					</div>
					<div id="mainTab">
						<ul>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/topic'/>">讨论区</a> </span>
							</li>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/topic/mine'/>">我发表的话题</a> </span>
							</li>
							<li >
								<span class="txt6"><a
									href="<c:url value='/admin/topic/replied'/>">我参与的话题</a> </span>
							</li>
							<li >
								<span class="txt6"><a
									href="<c:url value='/admin/board'/>">话题板块</a> </span>
							</li>
							<li class="navtxt">
								<a href="<c:url value='/admin/board/add'/>">添加话题板块</a>
							</li>
						</ul>
					</div>
					<div id="securitiesTxt">
						<form action="board!save.html" method="post">
							<p>
								<span class="l">话题板块：</span><span class="r"><input
										style="width: 150px;" class="inputtext" type="text"
										onblur="this.className='inputtext'"
										onfocus="this.className='inputtext2'" id="name"
										name="board.name" /> </span><span class="t"><font color="red">*</font>必填</span>
							</p>
							<p>
								<span class="l">描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述：</span><span class="r"><textarea
										class="textarea" style="width: 400px; height: 60px;"
										name="board.description" id="description"
										onblur="this.className='textarea'"
										onfocus="this.className='textarea2'" /></textarea> </span><span class="t"><font color="red">*</font>必填</span>
							</p>
							<div class="c"></div>
							<div class="c h5"></div>
							<span class="l"></span>
							<span class="l"></span>
							<div class="c h10"></div>
							<div class="c h10"></div>
							<p>
								<span class="l"></span><span class="r"><input
										type="submit" class="botton" value="提交"
										onMouseOut="this.className='botton';"
										onMouseOver="this.className='botton2';" /> </span>
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

