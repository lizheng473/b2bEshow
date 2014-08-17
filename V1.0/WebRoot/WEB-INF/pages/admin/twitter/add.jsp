<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<HEAD>
	<TITLE>微博</TITLE>
	<link rel="stylesheet"
		href="<c:url value='/admin/styles/twitter.css'/>" type="text/css" />
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
</HEAD>
<BODY>
	<div id="main">
		<s:include value="../left.jsp"></s:include>
		<div id="mainarea">
			<div id="mainarea_bg">
				<div id="content">
					<div id="mainTop">
						<h2>
							<img src="<c:url value='/admin/images/app_list_twitter.gif'/>" />
							微博
						</h2>
					</div>
					<div id="mainTab">
						<ul>
							<li>
								<span class="txt5"><a
									href="<c:url value='/admin/twitter'/>">大家的微博</a></span>
							</li>
							<li>
								<span class="txt5"><a
									href="<c:url value='/admin/twitter/mine'/>">我的微博</a> </span>
							</li>
							<li class="navtxt">
								<a href="<c:url value='/admin/twitter/add'/>">继续说</a>
							</li>
						</ul>
					</div>
					<div id="content">
					   <s:form action="twitter!save.html" id="twitterForm" method="post">
							    <div id="top">
									心情点滴，我要记录...(<span id="chLeft">200</span>/200字内)
								</div>
								<div style="padding-top: 10px;">
									<textarea class="inputtext text-input validate['required']"
									    class="textarea" style="width: 400px; height: 80px;"
										name="twitter.content" id="inputBox" 
										cols="" rows=""  onkeyup="checkLength(this);"
										onblur="this.className='textarea'"
										onfocus="this.className='textarea2'" /></textarea>
										<br/>
								</div>
								<div style="padding: 5px 0;">
									<span><input type="submit" class="botton"
											value="提交" onMouseOut="this.className='botton';"
											onMouseOver="this.className='botton2';" /> </span>
								</div>
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

