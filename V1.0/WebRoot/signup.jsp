<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<meta name="description" content="注册" />
		<meta name="keywords" content="注册" />
		<title>注册帐号</title>
		<link rel="stylesheet" href="<c:url value='/styles/user.css'/>"
			type="text/css" />
		<link media="screen" type="text/css"
			href="<c:url value='/scripts/validate/theme/grey/formcheck.css'/>"
			rel="stylesheet" />
		<script type="text/javascript"
			src="<c:url value='/scripts/validate/lang/zh-CN.js'/>"></script>
		<script type="text/javascript"
			src="<c:url value='/scripts/validate/formcheck.js'/>"></script>
		<script type="text/javascript">
				window.addEvent('domready', function(){
					new FormCheck('signupForm');
				});
		</script>
	</head>
	
	<body>
		<div id="page-wrapper">
			<img alt="" src="images/top-hr.png"
				style="height: 12px; margin-top: 10px; width: 980px;" />
			<table cellspacing="0" cellpadding="0"
				style="background: url(images/bg-body.png) repeat-y top; width: 980px;">
				<tr>
					<td width="2"></td>
					<td valign="top"
						style="background: url(images/bg-sec-12.png) repeat-x top; padding: 40px 40px; align: center;">
						<div>
							<div id="mainTop">
								<h2 style="margin-left: 10px;">
									注册帐号
									<br />
									<hr />
								</h2>
							</div>
							<s:form name="signupForm" action="signup" method="post"
								validate="true" theme="xhtml">
								<div id="register" style="width:800px;">
									<ul class="txtul">
										<li>
											<span class="l">用户账户：</span><span class="r"> <s:textfield
													name="user.username"
													cssClass="inputtext text-input validate['required']"
													onblur="this.className='inputtext';"
													onfocus="this.className='inputtext2';" maxlength="16" /> </span>
												<div class="c" style="margin: 4px 0 0 70px; color: #999">
													&nbsp;请使用英文和数字组合!
												</div>
										</li>
										<li>
											<span class="l">登录密码：</span><span class="r"> <s:password
													name="user.password"
													cssClass="inputtext text-input validate['required']"
													onblur="this.className='inputtext';"
													onfocus="this.className='inputtext2';" maxlength="16" /> </span>
												<div class="c" style="margin: 4px 0 0 70px; color: #999">
													&nbsp;请输入密码!
												</div>
										</li>
										<li>
											<span class="l">重复密码：</span><span class="r"> <s:password
													name="user.confirmPassword"
													cssClass="inputtext text-input validate['required']"
													onblur="this.className='inputtext';"
													onfocus="this.className='inputtext2';" maxlength="16" /> </span>
												<div class="c" style="margin: 4px 0 0 70px; color: #999">
													&nbsp;请再次输入密码!
												</div>
										</li>
										<li>
											<span class="l">用户昵称：</span><span class="r"><s:textfield
													name="user.nickname"
													cssClass="inputtext text-input validate['required']"
													onblur="this.className='inputtext';"
													onfocus="this.className='inputtext2';" maxlength="64" /> </span>
												<div class="c" style="margin: 4px 0 0 70px; color: #999">
													&nbsp;对外显示，例如“帅锅”!
												</div>
										</li>
										<li>
											<span class="l">注册邮箱：</span><span class="r"><s:textfield
													id="email" name="user.email"
													cssClass="inputtext text-input validate['required','email']"
													onblur="this.className='inputtext';"
													onfocus="this.className='inputtext2';" maxlength="64" /> </span>
											<div class="c" style="margin: 4px 0 0 70px; color: #999">
												&nbsp;请填写真实邮箱，方便您及时找回密码!
											</div>
										</li>
										<li>
											<span style="padding-left: 70px;"><input
													type="checkbox" id="read" style="border: 0;"
													checked="checked" /> 我已阅读同意遵守，<a
												href="<c:url value="/info/terms"/>" target="_blank">Eshow服务条款</a>
											</span>
										</li>
										<li>
											<span style="padding-left: 70px;"><input type="submit"
													class="botton submit" value="注册"
													onmouseout="this.className='botton';"
													onmouseover="this.className='botton2';" /> </span>
										</li>
									</ul>
								</div>
							</s:form>
						</div>
					</td>
					<td width="3"></td>
				</tr>
			</table>
			<table cellspacing="0" cellpadding="0"
				style="background: url(images/bg-btm-hr.png) repeat-y top; width: 980px; height: 9px;">
				<tr>
					<td></td>
				</tr>
			</table>
		</div>
	</body>
</html>
