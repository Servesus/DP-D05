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

<display:table pagesize="5" class="box" name="boxes" 
	requestURI="actor/boxes/list.do" id="row">
	
<display:column> <a href="box/findOne.do?actorkId=${row.id}">
	<spring:message code="box.findOne" /></a> </display:column>
		
	<spring:message code="box.name" var="name" />
	<display:column property="name" title="${name}" sortable="true"/>

	<spring:message code="box.id" var="id" />
	<display:column property="id" title="${id}" sortable="true"/>
	

</display:table>
<input type="button" name="Create" value="<spring:message code="fixUpTask.create" />"
			onclick="javascript: relativeRedir('fixUpTask/customer/create.do');" />
</body>

</html>