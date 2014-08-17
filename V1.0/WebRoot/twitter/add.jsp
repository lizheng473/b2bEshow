<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<HEAD>
	<title>微博</title>
	<link rel="stylesheet" href="<c:url value='/styles/twitter.css'/>"
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
			new FormCheck('twitterForm');
		});
    </script>
	<script type="text/javascript">
　　function checkLength(which) {
　　var maxChars = 200;
　　if (which.value.length > maxChars)
　　which.value = which.value.substring(0,maxChars);
　　var curr = maxChars - which.value.length;
　　document.getElementById("chLeft").innerHTML = curr.toString();
    }
　　</script>
</head>
<body>
	<div id="page-wrapper">
		<img alt="" src="../images/top-hr.png"
			style="height: 12px; margin-top: 10px; width: 980px;" />
		<table cellspacing="0" cellpadding="0"
			style="background: url(../images/bg-body.png) repeat-y top; width: 980px;">
			<tr>
				<td width="2"></td>
				<td valign="top"
					style="background: url(../images/bg-sec-12.png) repeat-x top; padding: 40px 40px; align: center;">
					<div>
						&nbsp;
						<img src="<c:url value='/images/twitter.jpg'/>"
							style="margin: 40px 35px -10px 35px; width: 890px; height: 210px;" />
					</div>
					<div>
						<div id="content">
							<div id="mainTab">
								<ul>
									<li>
										<span class="txt5"><a href="<c:url value='/twitter'/>">大家的微博</a>
										</span>
									</li>
									<li>
										<span class="txt5"><a
											href="<c:url value='/twitter/mine'/>">我的微博</a> </span>
									</li>
									<li class="navtxt">
										<a href="<c:url value='/twitter/add'/>">继续说</a>
									</li>
								</ul>
							</div>
							<div id="content">
								<s:form action="twitter!save.html" id="twitterForm"
									method="post">
										<div id="twitterCreate" style="margin: -30px 0px 0px -10px;">
										<div id="twitterTop" style="margin-left:0px;">
											心情点滴，我要记录...（200字内）
										</div>
										<div style="padding-top: 10px;">
											<textarea class="inputtext text-input validate['required']"
												class="textarea" style="width: 500px; height: 100px;"
												name="twitter.content" id="inputBox" cols="" rows=""
												onkeyup="checkLength(this);"
												onblur="this.className='textarea'"
												onfocus="this.className='textarea2'" /></textarea>
											<br />
										</div>
										<div style="padding: 5px 0;">
											<span><input type="submit" class="botton" value="提交"
													onMouseOut="this.className='botton';"
													onMouseOver="this.className='botton2';" /> </span>
										</div>
										</div>
								</s:form>
							</div>
						</div>
					</div>
				</td>
				<td width="3"></td>
			</tr>
		</table>
		<table cellspacing="0" cellpadding="0"
			style="background: url(../images/bg-btm-hr.png) repeat-y top; width: 980px; height: 9px;">
			<tr>
				<td></td>
			</tr>
		</table>
	</div>
</body>
