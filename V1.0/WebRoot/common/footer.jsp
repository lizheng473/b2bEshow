<%@ include file="/common/taglibs.jsp" %>
    <div id="divider"><div></div></div>
    <span class="left"><fmt:message key="webapp.version"/> |
        <span id="validators">
            <a href="http://validator.w3.org/check?uri=referer">XHTML Valid</a> |
            <a href="http://jigsaw.w3.org/css-validator/validator-uri.html">CSS Valid</a>
        </span>
        <c:if test="${pageContext.request.remoteUser != null}">
        | <fmt:message key="user.status"/> <authz:authentication operation="username"/>
        </c:if>
    </span>
    <span class="right">
        &copy; 2008 <a href="http://www.56logo.com">56logo</a>
    </span>