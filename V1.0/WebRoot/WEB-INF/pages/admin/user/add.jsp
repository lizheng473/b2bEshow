<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<HEAD>
	<TITLE>日志</TITLE>
	<link rel="stylesheet"
		href="<c:url value='/admin/styles/profile.css'/>" type="text/css" />
	<link rel="stylesheet" type="text/css" media="all"
			href="<c:url value='/scripts/calendar/calendar-blue.css'/>"
			title="calendar-win2k-1" />
	<script type="text/javascript"
		src="<c:url value='/scripts/calendar/calendar.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/scripts/calendar/lang/calendar-zh_utf8.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/scripts/calendar/calendar-setup.js'/>"></script>
</HEAD>
<BODY>
	<div id="main">
		<s:include value="../left.jsp"></s:include>
		<div id="mainarea">
			<div id="mainarea_bg">
				<div id="content">
					<div id="mainTop">
						<h2>
							<img src="<c:url value='/admin/images/app_list_user.gif'/>" />
							用户管理
						</h2>
					</div>
					<div id="mainTab">
						<ul>
							<li>
								<span class="txt6"><a href="<c:url value='/admin/user'/>">用户列表</a>
								</span>
							</li>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/user/edit'/>">修改资料</a> </span>
							</li>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/user/password'/>">修改密码</a> </span>
							</li>
							<li>
								<span class="txt6"><a
									href="<c:url value='/admin/user/setphoto'/>">修改头像</a> </span>
							</li>
							<li class="navtxt">
								<a>添加用户</a>
							</li>
						</ul>
					</div>
					<div id="profile_form">
						<%@ include file="/common/messages.jsp"%>
						<s:form id="userForm" action="user!save.html" method="post">
							<div id="profile_form">
								<ul>
									<li>
										<span class="l">登录名称：</span><span class="r"><input
												style="width: 150px;" class="inputtext" type="text"
												onblur="this.className='inputtext'"
												onfocus="this.className='inputtext2'" id="username"
												name="user.username" /> </span><span class="t">必填，填写后不能修改</span>
									</li>
									<li>
										<span class="l">Email &nbsp;&nbsp;&nbsp;&nbsp;： </span><span
											class="r"><input style="width: 280px;"
												class="inputtext" type="text"
												onblur="this.className='inputtext'"
												onfocus="this.className='inputtext2'" id="email"
												name="user.email" /> </span><span class="t">必填</span>
									</li>
									<li>
										<span class="l">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</span><span
											class="r"><input style="width: 280px;"
												class="inputtext" type="password"
												onblur="this.className='inputtext'"
												onfocus="this.className='inputtext2'" id="password" 
												name="user.password" /> </span>
									</li>
									<li>
										<span class="l">确认密码：</span><span class="r"><input
												style="width: 280px;" class="inputtext" type="password"
												onblur="this.className='inputtext'"
												onfocus="this.className='inputtext2'" id="password"
												name="user.confirmPassword" /> </span><span class="t">和密码一致</span>
									</li>
									<li>
										<span class="l">昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</span><span
											class="r"><input style="width: 280px;"
												class="inputtext" type="text"
												onblur="this.className='inputtext'"
												onfocus="this.className='inputtext2'" id="nickname"
												name="user.nickname" /> </span><span class="t">必填</span>
									</li>
									<li>
										<span class="l">真实姓名：</span><span class="r"><input
												style="width: 280px;" class="inputtext" type="text"
												onblur="this.className='inputtext'"
												onfocus="this.className='inputtext2'" id="realname"
												name="user.realname" /> </span><span class="1">必填</span>
									</li>
									<li>
										<span class="l">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</span><span
											class="r"><select id="user.male" style="width: 8em;"
												name="user.male">
												<option value="1" ${view.user.male?"selected='selected'":" "}>
													男
												</option>
												<option value="0" ${!view.user.male?"selected='selected'":" "}>
													女
												</option>

											</select> </span>
									</li>
									<li>
										<span class="l">出生日期：</span><span class="r">
											<input
												class="inputtext" name="user.birthday" id="birthday"
												style="width: 120px" type="text"
												value="${view.user.birthday }" style="width:183px"
												onblur="this.className='inputtext'"
												onfocus="this.className='inputtext2'" />&nbsp; 
												<a
													href="javascript:;"><img
														id="triggerBirthdayTime"
														src="<c:url value='/scripts/calendar/img.gif'/>" border="0"
														align="middle"></a> 
										</span>
									</li>
									<li>
										<span class="l">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：</span><span
											class="r"><input class="inputtext" name="user.age"
												id="age" style="width: 120px" value="${view.user.age }"
												maxlength="20" type="text"
												onblur="this.className='inputtext';"
												onfocus="this.className='inputtext2';" /> </span>
									</li>
									<li>
										<span class="l">血&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型：</span><span
											class="r"> <select id="bloodType" style="width: 8em;"
												name="user.bloodType">
												<option value="1">
													A型
												</option>
												<option value="2">
													B型
												</option>
												<option value="3">
													AB型
												</option>
												<option value="4">
													O型
												</option>
											</select> </span>
									</li>
									<li>
										<span class="l">星&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;座：</span><span
											class="r"> <select id="user.constellation"
												style="width: 8em;" name="user.constellation">
												<option value="1">
													白羊座
												</option>
												<option value="2">
													金牛座
												</option>
												<option value="3">
													双子座
												</option>
												<option value="4">
													巨蟹座
												</option>
												<option value="5">
													狮子座
												</option>
												<option value="6">
													处女座
												</option>
												<option value="7">
													天秤座
												</option>
												<option value="8">
													天蝎座
												</option>
												<option value="9">
													射手座
												</option>
												<option value="10">
													摩羯座
												</option>
												<option value="11">
													水瓶座
												</option>
												<option value="12">
													双鱼座
												</option>
											</select> </span>
									</li>
									<li>
										<span class="l">属&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;相：</span><span
											class="r"> <select id="birthAttrib"
												style="width: 8em;" name="user.birthAttrib">
												<option value="1">
													鼠
												</option>
												<option value="2">
													牛
												</option>
												<option value="3">
													虎
												</option>
												<option value="4">
													兔
												</option>
												<option value="5">
													龙
												</option>
												<option value="6">
													蛇
												</option>
												<option value="7">
													马
												</option>
												<option value="8">
													羊
												</option>
												<option value="9">
													猴
												</option>
												<option value="10">
													鸡
												</option>
												<option value="11">
													狗
												</option>
												<option value="12">
													猪
												</option>
											</select> </span>
									</li>
									<li>
										<span class="l">婚烟状况：</span><span class="r"> <select
												id="marital" style="width: 8em;" name="user.marital">
												<option value="1">
													单身
												</option>
												<option value="2">
													已婚
												</option>
												<option value="3">
													恋爱
												</option>
												<option value="4">
													离异
												</option>
											</select> </span>
									</li>
									<li>
										<span class="l">自我介绍：</span>
										<textarea cols="60" rows="6" id="intro" name="user.intro">${view.user.intro}</textarea>

									</li>
									<li>
										<span class="l">现居地址：</span>
										<textarea cols="60" rows="6" id="intro">${view.user.intro}</textarea>

									</li>
									<li>
										<span class="l">爱&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;好：</span>
										<textarea cols="60" rows="6" id="intro" name="user.hobby">${view.user.hobby }</textarea>

									</li>
									<li>
										<span class="l"></span><span class="r"><input
												type="submit" class="botton" value="添加"
												onmouseout="this.className='botton';"
												onmouseover="this.className='botton2';" /> </span>
									</li>
								</ul>
							</div>
						</s:form>
					</div>
					<div class="c"></div>
				</div>
				<div class="c"></div>
			</div>
			<script type="text/javascript">
	var MINUTE = 60 * 1000;
	var HOUR = 60 * MINUTE;
	var DAY = 24 * HOUR;

	Calendar.setup( {
		inputField : "birthday",
		button : "triggerBirthdayTime"
	});
	
</script>
		</div>
	</DIV>
</BODY>
