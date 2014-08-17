<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<HEAD>
	<TITLE>网站参数</TITLE>
	<link rel="stylesheet" href="<c:url value='/admin/styles/system.css'/>"
		type="text/css" />
</HEAD>
<BODY>
	<div id="main">
		<s:include value="../left.jsp"></s:include>
	  <div id="mainarea">
			<div id="mainarea_bg">
				<div id="content">
					<%@ include file="/common/messages.jsp"%>
					<div id="mainTop">
						<h2>
							<img src="<c:url value='/admin/images/app_list_system.gif'/>" />
							系统管理
						</h2>
					</div>
					<div id="mainTab">
						<ul>
							<li class="on">
								<span class="txt6"><a>网站参数</a> </span>
							</li>
							<li>
								<span class="txt6"><a href="<c:url value='/admin/role'/>">角色管理</a>
								</span>
							</li>
							<li>
								<span class="txt6"><a href="<c:url value='/admin/thumb'/>">缩略图</a>
								</span>
							</li>
							<li>
								<span class="txt6"><a href="<c:url value='/admin/app'/>">组件管理</a>
								</span>
							</li>
						</ul>
					</div>
					<div id="stockbuy">
						<p>
							<span class="r cf00" style="float: left"> 设置网站前后台基本参数及变量!</span>
						</p>
						<p>
							<span class="l">网站地址：</span><span class="r"><input
									style="width: 150px;" class="inputtext" type="text"
									onblur="this.className='inputtext';sendCode()"
									onfocus="this.className='inputtext2'" id="SecuritiesId"
									name="SecuritiesId" /> </span>
						</p>
						<p>
							<span class="l">网站名称：</span><span class="r"><input
									style="width: 150px;" class="inputtext" type="text"
									onblur="this.className='inputtext';sendCode()"
									onfocus="this.className='inputtext2'" id="SecuritiesId"
									name="SecuritiesId" /> </span>
						</p>
						<p>
							<span class="l">公司名称：</span><span class="r"><input
									style="width: 150px;" class="inputtext" type="text"
									onblur="this.className='inputtext';checkSellPrice()"
									onfocus="this.className='inputtext2'" id="SellPrice"
									name="SellPrice" /> </span>
						</p>
						<p>
							<span class="l">备案号：</span><span class="r"><input
									style="width: 150px;" class="inputtext" type="text"
									onblur="this.className='inputtext';checkSellAmount()"
									onfocus="this.className='inputtext2'" id="SellAmount"
									name="SellAmount" /> </span>
						</p>
						<p>
							<span class="l"></span><span class="r"> <input
									type="button" class="botton" value="设置"
									onmouseout="this.className='botton';"
									onmouseover="this.className='botton2';" /> </span>
						</p>
						<div class="c h20"></div>
						<div class="msgtxt">
							网站参数说明：
							<br />
							1. 此功能正在设计中；
							<br />
							2. 此功能正在设计中；
							<br />
						</div>
					</div>
				</div>
				<div class="c"></div>
			</div>
			<div class="c"></div>
		</div>
	</div>
</BODY>

