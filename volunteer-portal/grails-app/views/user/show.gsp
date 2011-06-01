<%@ page import="au.org.ala.volunteer.User" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
  <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton"><g:link class="list" action="list"><g:message code="default.userlist.label" default="User scores"/></g:link></span>
</div>
<div class="body">
  <h1>User: ${fieldValue(bean: userInstance, field: "displayName")}</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="dialog">
    <table>
      <tbody>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="user.created.label" default="First contribution"/></td>
        <td valign="top" class="value"><g:formatDate date="${userInstance?.created}"/></td>
      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="user.recordsTranscribedCount.label" default="Tasks Completed"/></td>

        <td valign="top" class="value">${fieldValue(bean: userInstance, field: "transcribedCount")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="user.transcribedValidatedCount.label" default="Tasks Validated"/></td>

        <td valign="top" class="value">${fieldValue(bean: userInstance, field: "validatedCount")}</td>

      </tr>

      <tr class="prop">
        <td valign="top" class="name"><g:message code="user.userId.label" default="User Id"/></td>

        <td valign="top" class="value">${fieldValue(bean: userInstance, field: "userId")}</td>

      </tr>

      </tbody>
    </table>
  </div>
</div>
</body>
</html>
