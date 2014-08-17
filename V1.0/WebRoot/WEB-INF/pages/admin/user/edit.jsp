<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="user!view" id="view" executeResult="false">
</s:action>
<HEAD>
	<TITLE>修改资料</TITLE>
	<link rel="stylesheet"
		href="<c:url value='/admin/styles/profile.css'/>" type="text/css" />
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
							<li class="on">
								<span class="txt6"><a>修改资料</a> </span>
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
								<a href="<c:url value='/admin/user/add'/>">添加用户</a>
							</li>
						</ul>
					</div>
					<%@ include file="/common/messages.jsp"%>
					<form action="user!update.html" id="userForm" method="post">
						<input type="hidden" name="user.id" value="${view.user.id}" />
						<div id="profile_form">
							<ul>
								<li>
									<span class="l">注册邮箱：</span><span class="r">${view.user.email
										}</span>
								</li>
								<li>
									<span class="l">姓名：</span><span class="r"><input
											class="inputtext" name="strName" id="strName"
											style="width: 150px" value="${view.user.username}"
											maxlength="20" type="text"
											onblur="this.className='inputtext';"
											onfocus="this.className='inputtext2';" /> </span>
								</li>
								<li>
									<span class="l">昵称：</span><span class="r"><input
											class="inputtext" name="strName" id="strName"
											style="width: 150px" value="${view.user.nickname }"
											maxlength="20" type="text"
											onblur="this.className='inputtext';"
											onfocus="this.className='inputtext2';" /> </span>
								</li>
								<li>
									<span class="l">头像更改：</span><span class="r"> <c:if
											test="${view.user.photo==null}">
											<a
												href="<c:url value="/admin/user/view/${view.user.username}"/>"><img
													src="${pageContext.request.contextPath}/common/images/user50-50.jpg"
													alt="${view.user.nickname}" width="50" height="50" /> </a>
										</c:if> <c:if test="${view.user.photo!=null}">
											<a href="<c:url value='/admin/user/setphoto'/>"><img
													src="${pageContext.request.contextPath}/upload/user/<s:date name='%{#view.user.addTime}' format='yyyyMMdd' />/${view.user.photo}">
											</a>
										</c:if> </span>
								</li>
								<li>
									<span class="l"></span>
								</li>
								<li>
									<span class="l">性别：</span><span class="r"><select
											id="male" style="width: 8em;" name="user.male">
											<option value="true" ${view.user.male?"selected='selected'":" "}>
												男
											</option>
											<option value="false" ${!view.user.male?"selected='selected'":" "}>
												女
											</option>

										</select> </span>
								</li>
								<li>
									<span class="l">出生日期：</span><span class="r"><input
											class="inputtext" name="strBirthday" id="strBirthday"
											style="width: 120px" type="text"
											value="${view.user.birthday }" style="width:183px"
											onblur="this.className='inputtext'"
											onfocus="this.className='inputtext2'" /> </span>
								</li>
								<li>
									<span class="l">年龄：</span><span class="r"><input
											class="inputtext" name="strName" id="strName"
											style="width: 150px" value="${view.user.age }" maxlength="20"
											type="text" onblur="this.className='inputtext';"
											onfocus="this.className='inputtext2';" /> </span>
								</li>
								<li>
									<span class="l">血型：</span><span class="r"> <select
											id="bloodType" style="width: 8em;" name="user.marital">
											<option value="1" ${view.user.marital==1?
												"selected='selected'":""}>
												A型
											</option>
											<option value="2" ${view.user.marital==2?
												"selected='selected'":""}>
												B型
											</option>
											<option value="3" ${view.user.marital==3?
												"selected='selected'":""}>
												AB型
											</option>
											<option value="4" ${view.user.marital==4?
												"selected='selected'":""}>
												O型
											</option>
										</select> </span>
								</li>
								<li>
									<span class="l">星座：</span><span class="r"> <select
											id="constellation" style="width: 8em;"
											name="user.constellation">
											<option value="1" ${view.user.constellation==1?
												"selected='selected'":""}>
												白羊座
											</option>
											<option value="2" ${view.user.constellation==2?
												"selected='selected'":""}>
												金牛座
											</option>
											<option value="3" ${view.user.constellation==3?
												"selected='selected'":""}>
												双子座
											</option>
											<option value="4" ${view.user.constellation==4?
												"selected='selected'":""}>
												巨蟹座
											</option>
											<option value="5" ${view.user.constellation==5?
												"selected='selected'":""}>
												狮子座
											</option>
											<option value="6" ${view.user.constellation==6?
												"selected='selected'":""}>
												处女座
											</option>
											<option value="7" ${view.user.constellation==7?
												"selected='selected'":""}>
												天秤座
											</option>
											<option value="8" ${view.user.constellation==8?
												"selected='selected'":""}>
												天蝎座
											</option>
											<option value="9" ${view.user.constellation==9?
												"selected='selected'":""}>
												射手座
											</option>
											<option value="10" ${view.user.constellation==10?
												"selected='selected'":""}>
												摩羯座
											</option>
											<option value="11" ${view.user.constellation==11?
												"selected='selected'":""}>
												水瓶座
											</option>
											<option value="12" ${view.user.constellation==12?
												"selected='selected'":""}>
												双鱼座
											</option>
										</select> </span>
								</li>
								<li>
									<span class="l">属相：</span><span class="r"> <select
											id="birthAttrib" style="width: 8em;" name="user.birthAttrib">
											<option value="1" ${view.user.birthAttrib==1?
												"selected='selected'":""}>
												鼠
											</option>
											<option value="2" ${view.user.birthAttrib==2?
												"selected='selected'":""}>
												牛
											</option>
											<option value="3" ${view.user.birthAttrib==3?
												"selected='selected'":""}>
												虎
											</option>
											<option value="4" ${view.user.birthAttrib==4?
												"selected='selected'":""}>
												兔
											</option>
											<option value="5" ${view.user.birthAttrib==5?
												"selected='selected'":""}>
												龙
											</option>
											<option value="6" ${view.user.birthAttrib==6?
												"selected='selected'":""}>
												蛇
											</option>
											<option value="7" ${view.user.birthAttrib==7?
												"selected='selected'":""}>
												马
											</option>
											<option value="8" ${view.user.birthAttrib==8?
												"selected='selected'":""}>
												羊
											</option>
											<option value="9" ${view.user.birthAttrib==9?
												"selected='selected'":""}>
												猴
											</option>
											<option value="10" ${view.user.birthAttrib==10?
												"selected='selected'":""}>
												鸡
											</option>
											<option value="11" ${view.user.birthAttrib==11?
												"selected='selected'":""}>
												狗
											</option>
											<option value="12" ${view.user.birthAttrib==12?
												"selected='selected'":""}>
												猪
											</option>
										</select> </span>
								</li>
								<li>
									<span class="l">婚烟状况：</span><span class="r"> <select
											id="marital" style="width: 8em;" name="user.marital">
											<option value="1" ${view.user.marital==1?
												"selected='selected'":""}>
												单身
											</option>
											<option value="2" ${view.user.marital==2?
												"selected='selected'":""}>
												已婚
											</option>
											<option value="3" ${view.user.marital==3?
												"selected='selected'":""}>
												恋爱
											</option>
											<option value="4" ${view.user.marital==4?
												"selected='selected'":""}>
												离异
											</option>
										</select> </span>
								</li>
								<li>
									<span class="l">自我介绍：</span>
									<textarea cols="60" rows="6" id="intro">${view.user.intro}</textarea>

								</li>
								<li>
									<span class="l">现居地址：</span>
									<textarea cols="60" rows="6" id="intro">${view.user.intro}</textarea>

								</li>
								<li>
									<span class="l">爱好：</span>
									<textarea cols="60" rows="6" id="intro">${view.user.hobby }</textarea>

								</li>
								<li>
									<span style="padding-left: 85px;"><input type="submit"
											class="botton" value="保存设置"
											onMouseOut="this.className='botton';"
											onMouseOver="this.className='botton2';" /> </span>
								</li>
							</ul>
						</div>
					</form>
				</div>
				<div class="c"></div>
			</div>
			<div class="c"></div>
		</div>
	</div>
</BODY>

