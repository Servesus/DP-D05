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
<security:authorize access="hasRole('HANDYWORKER')">
<form:form action="handyWorker/edit.do" modelAttribute="handyWorker">

	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="profiles" />
	<form:hidden path="boxes" />
	<form:hidden path="applications" />
	<form:hidden path="phases" />
	<form:hidden path="curricula" />
	<form:hidden path="finder" />
 
	<form:label path="name">
		<spring:message code="handyWorker.name" />:
	</form:label>
	<form:input path="name" />
	<form:errors cssClass="error" path="name" />
	<br />
	
	<form:label path="middleName">
		<spring:message code="handyWorker.middleName" />:
	</form:label>
	<form:input path="middleName" />
	<form:errors cssClass="error" path="middleName" />
	<br />
	
	<form:label path="surname">
		<spring:message code="handyWorker.surname" />:
	</form:label>
	<form:input path="surname" />
	<form:errors cssClass="error" path="surname" />
	<br />
	
	<form:label path="make">
		<spring:message code="handyWorker.make" />:
	</form:label>
	<form:input path="make" />
	<form:errors cssClass="error" path="make" />
	<br />
	
	<form:label path="photo">
		<spring:message code="handyWorker.photo" />:
	</form:label>
	<form:input path="photo" />
	<form:errors cssClass="error" path="photo" />
	<br />
	
	<form:label path="email">
		<spring:message code="handyWorker.email" />:
	</form:label>
	<form:input path="email" />
	<form:errors cssClass="error" path="email" />
	<br />
	
	<form:label path="phoneNumber">
		<spring:message code="handyWorker.phoneNumber" />:
	</form:label>
	<form:input path="phoneNumber" />
	<form:errors cssClass="error" path="phoneNumber" />
	<br />
	
	<form:label path="address">
		<spring:message code="handyWorker.address" />:
	</form:label>
	<form:input path="address" />
	<form:errors cssClass="error" path="address" />
	<br />
	
	<input type="submit" name="Save"
		value="<spring:message code="handyWorker.save" />" />&nbsp; 
	
		<input type="button" name="Back"
		value="<spring:message code="handyWorker.back" />"
		onclick="javascript: relativeRedir('master-page');" />
	<br />
 	
</form:form>
</security:authorize>
</body>
</html>