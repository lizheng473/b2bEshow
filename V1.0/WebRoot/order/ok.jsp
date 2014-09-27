<%@ page language="java" isErrorPage="true" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<title><fmt:message key="errorPage.title" />
		</title>
	</head>

	<body id="error">
		<div id="page">
			<div id="content" class="clearfix">
				<div id="main">
						订单提交成功
						<a href="<c:url value='/admin/order/'/>" target="_blank">查看订单</a>
				</div>
			</div>
		</div>
	</body>
</html>
