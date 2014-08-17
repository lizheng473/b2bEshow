<br><%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<s:action name="user!view" id="view" executeResult="false">
</s:action>
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<HEAD>
	<TITLE>查看${view.user.nickname}的信息</TITLE>
	<link rel="stylesheet"
		href="<c:url value='/admin/styles/profile.css'/>" type="text/css" />
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
								<span class="txt6"><a
									href="<c:url value='/admin/user/edit'/>">
									<c:if test="${view.user.id !=myid}">${view.user.nickname}的信息</c:if>
									<c:if test="${view.user.id ==myid}">我的信息</c:if>
									</a> </span>
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
					<div id="profile_form" algin="center">
						<%@ include file="/common/messages.jsp"%>
						<br />
						<table border="1" bordercolor="red">
							<tr>
								<td rowspan="13" align="top">
									<span class="l">头像更改：</span><span class="r">
										<c:if test="${view.user.photo==null}">
											<a
												href="<c:url value="/admin/user/view/${view.user.id}"/>"><img
													src="${pageContext.request.contextPath}/common/images/user50-50.jpg"
													alt="${view.user.nickname}" /> </a>
										</c:if>
										<c:if test="${view.user.photo!=null}">
											<a href="<c:url value="/admin/user/view/${view.user.id}"/>"><img
													src="${pageContext.request.contextPath}/upload/user/<s:date name='%{#view.user.addTime}' format='yyyyMMdd' />/${view.user.photo}"
													alt="${view.user.nickname}"  width="50" height="50"/> </a>
										</c:if> 
									</span>
								</td>
								<td width="300">
									<span class="l">注册邮箱：</span><span class="r">${view.user.email}</span>
								</td>
								<td width="300">
									<span class="l">姓名：</span><span class="r">${view.user.username
										}</span>
								</td>
							</tr>
							<tr>
								<td>
									<span class="l">昵称：</span><span class="r">${view.user.nickname
										} </span>
								</td>
								<td>
									<span class="l">性别：</span><span class="r">
										<s:if test="%{#view.user.male==true}">男</s:if>
											<s:elseif test="%{#view.user.male==false}">女</s:elseif></span>
								</td>
							</tr>
							<tr>
								<td>
									<span class="l">出生日期：</span><span class="r">${view.user.birthday
										}</span>
								</td>
								<td>
									<span class="l">年龄：</span><span class="r">${view.user.age
										}</span>
								</td>
							</tr>
							<tr>
								<td>
									<span class="l">血型：</span><span class="r"><s:if
											test="%{#view.user.bloodType==1}">A型</s:if> <s:elseif
											test="%{#view.user.bloodType==2}">B型</s:elseif> <s:elseif
											test="%{#view.user.bloodType==3}">AB型</s:elseif> <s:elseif
											test="%{#view.user.bloodType==4}">O型</s:elseif> </span>
								</td>
								<td>
									<span class="l">星座：</span><span class="r"> <s:if
											test="%{#view.user.constellation==1}">白羊座</s:if> <s:elseif
											test="%{#view.user.constellation==2}">金牛座</s:elseif> <s:elseif
											test="%{#view.user.constellation==3}">双子座</s:elseif> <s:elseif
											test="%{#view.user.constellation==4}">巨蟹座</s:elseif> <s:elseif
											test="%{#view.user.constellation==5}">狮子座</s:elseif> <s:elseif
											test="%{#view.user.constellation==6}">处女座</s:elseif> <s:elseif
											test="%{#view.user.constellation==7}">天秤座</s:elseif> <s:elseif
											test="%{#view.user.constellation==8}">天蝎座</s:elseif> <s:elseif
											test="%{#view.user.constellation==9}">射手座</s:elseif> <s:elseif
											test="%{#view.user.constellation==10}">摩羯座</s:elseif> <s:elseif
											test="%{#view.user.constellation==11}">水瓶座</s:elseif> <s:elseif
											test="%{#view.user.constellation==12}">双鱼座</s:elseif> </span>
								</td>
							</tr>
							<tr>
								<td>
									<span class="l">属相：</span><span class="r"> <s:if
											test="%{#view.user.birthAttrib==1}">鼠</s:if> <s:elseif
											test="%{#view.user.birthAttrib==2}">牛</s:elseif> <s:elseif
											test="%{#view.user.birthAttrib==3}">虎</s:elseif> <s:elseif
											test="%{#view.user.birthAttrib==4}">兔</s:elseif> <s:elseif
											test="%{#view.user.birthAttrib==5}">龙</s:elseif> <s:elseif
											test="%{#view.user.birthAttrib==6}">蛇</s:elseif> <s:elseif
											test="%{#view.user.birthAttrib==7}">马</s:elseif> <s:elseif
											test="%{#view.user.birthAttrib==8}">羊</s:elseif> <s:elseif
											test="%{#view.user.birthAttrib==9}">猴</s:elseif> <s:elseif
											test="%{#view.user.birthAttrib==10}">鸡</s:elseif> <s:elseif
											test="%{#view.user.birthAttrib==11}">狗</s:elseif> <s:elseif
											test="%{#view.user.birthAttrib==12}">猪</s:elseif> </span>
								</td>
								<td>
									<span class="l">婚烟状况：</span><span class="r"> 单身</span>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									&nbsp;
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<span class="l">自我介绍：</span><span>${view.user.intro }</span>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									&nbsp;
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<span class="l">现居地址：</span><span>江苏无锡</span>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									&nbsp;
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<span class="l">爱好：</span><span>${view.user.hobby }</span>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									&nbsp;
								</td>
							</tr>
						</table>
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

