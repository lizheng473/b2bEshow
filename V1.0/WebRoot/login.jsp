<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="Content-Language" content="zh-CN" />
		<meta name="descriptions" content="登录" />
		<meta name="keywords" content="登录" />
		<title>登录</title>
		<link rel="stylesheet" href="<c:url value='/styles/user.css'/>"
			type="text/css" />
	</head>
	<body>
		<div id="page-wrapper">
			<table cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td width="2"></td>
					<td valign="top">

						<div>
							<form method="post" id="loginForm"
								action="<c:url value='/j_security_check'/>"
								onsubmit="saveUsername(this);return validateForm(this)">
								<c:if test="${param.error != null}">
									<li class="error">
										<img src="${ctx}/images/iconWarning.gif"
											alt="<fmt:message key='icon.warning'/>" class="icon"
											width="264" height="17" />
										<fmt:message key="errors.password.mismatch" />
										<%--${sessionScope.ACEGI_SECURITY_LAST_EXCEPTION.message}--%>
									</li>
								</c:if>
								<br />
								<div class="sc_mian">
									<div class="sc_left">
										<div class="BigMian">
											<div class="jiaojiao"></div>
											<div class="ContentBai">
												<div class="BookSub" align="center">
													<h3>
														登陆
													</h3>
												</div>
												<div align="center">
													<label for="j_username">
														<font color="#00000">用户名</font>
													</label>
													<input id="j_username" name="j_username"
														style="width: 10em;" type="text" />
												</div>
												<br />
												<div align="center">
													<label for="j_password">
														<font color="#00000">密码</font>
													</label>
													&nbsp; &nbsp;
													<input type="password" name="j_password" id="j_password"
														style="width: 10em;" />
												</div>
												<br />
												<c:if test="${appConfig['rememberMeEnabled']}">
													<div align="center" style="margin-right: 90px;">
														<label for="rememberMe">
															<font color="#00000">让系统记住我</font>
														</label>
														<input type="checkbox" name="rememberMe" id="rememberMe"
															checked="checked" />
													</div>
												</c:if>
												<div  >
													<input type="submit" name="login" style="margin-left:120px; "
														value="<fmt:message key='button.login'/>" />
												</div>
											</div>
											<div class="mianmbot"></div>
											
										</div>
									</div>
								</div>
							</form>
						</div>
					</td>
					<td width="3"></td>
				</tr>
			</table>
			<table cellspacing="0" cellpadding="0">
				<tr>
					<td></td>
				</tr>
			</table>
		</div>
	</body>
</html>
<script type="text/javascript" src="<c:url value='/scripts/global.js'/>"></script>
<script type="text/javascript" src="<c:url value='/scripts/minmax.js'/>"></script>
<script type="text/javascript" src="<c:url value='/scripts/login.js'/>"></script>