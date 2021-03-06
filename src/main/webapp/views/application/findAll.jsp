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
<security:authorize access="hasRole('CUSTOMER')">
<body>

<display:table pagesize="5" class="application" name="applications" 
	requestURI="application/customer/findAll.do" id="row">
	
<display:column> <a href="application/findOne.do?applicationId=${row.id}">
	<spring:message code="application.findOne" /></a> </display:column>
		
		<spring:message code="application.moment" var="moment" />
	<display:column property="moment" title="${moment}" sortable="true" format="{0,date,dd/MM/yyyy HH:mm}"/>

	<spring:message code="application.price" var="price" />
	<display:column property="price" title="${price}" sortable="true"/>
	
	<spring:message code="application.status" var="status" />
	<display:column property="status" title="${status}" sortable="true"/>

	<spring:message code="application.handyWorker" var="handyWorker" />
	<display:column property="handyWorker" title="${handyWorker.make}" sortable="true"/>

</display:table>
</body>
</security:authorize>
</html>