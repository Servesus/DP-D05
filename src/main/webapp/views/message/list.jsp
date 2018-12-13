<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

</head>

<body>
<display:table pagesize="5" class="displaytag" name="messages" 
	requestURI="box/messages/list.do" id="row">
		
	<spring:message code="message.sender" var="sender" />
	<display:column property="sender" title="${sender}"/>
	
	<spring:message code="message.subject" var="subject" />
	<display:column property="subject" title="${subject}"/>

	
	
	<spring:message code="message.sendDate" var="sendDate" />
	<display:column property="sendDate" title="${sendDate}"/>
	
	

	<display:column>
	<jstl:if test="${box.id != 0 && box.isSystem ==false}">
		<a href="actor/boxes/list.do?boxId=${row.id}">
  	 	<spring:message code="box.edit" /> </a>
  	 </jstl:if>
	</display:column>	

	<display:column>
		<a href="actor/message/list.do">
  	 		<spring:message code="box.view" /> </a>
	</display:column>	

</display:table>

<input type="button" name="Create" value="<spring:message code="box.create" />"
			onclick="javascript: relativeRedir('actor/box/create.do');" />
</body>

</html>