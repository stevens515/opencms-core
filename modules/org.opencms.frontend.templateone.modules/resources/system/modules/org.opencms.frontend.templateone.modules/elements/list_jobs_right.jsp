<%@ page session="false" import="org.opencms.frontend.templateone.modules.*" %><%--
--%><%@ taglib prefix="cms" uri="http://www.opencms.org/taglib/cms" %><%--
--%><%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %><%--
--%><%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %><%

CmsTemplateModules cms = new CmsTemplateModules(pageContext, request, response);

// get currently active locale to initialize message bundle
String locale = cms.getRequestContext().getLocale().toString();
pageContext.setAttribute("locale", locale);

%><fmt:setLocale value="${locale}" /><%--
--%><fmt:bundle basename="org/opencms/frontend/templateone/modules/workplace"><%--

--%><div class="sidelist"><p class="sidelisthead"><fmt:message key="jobs.headline" /></p><cms:contentload collector="${param.collector}" param="${param.folder}job_${number}.html|45|${param.count}" editable="true">

<p class="sidelistitem"><a class="sidelistitemhead" href="<cms:link><cms:contentshow element="${opencms.filename}" /></cms:link>"><cms:contentshow element="Title" /></a><br>
<cms:contentcheck ifexists="Date">
<c:set var="dateString">
	<cms:contentshow element="Date" />
</c:set>
<%
	cms.setDate("dateString");
%>
<fmt:formatDate value="${date}" type="date" dateStyle="short" /> - </cms:contentcheck><cms:contentshow element="ShortDescription" />
</p>

</cms:contentload></div><%--
--%></fmt:bundle>