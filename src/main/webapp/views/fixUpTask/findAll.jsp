<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Browser Fix-Up Task</title>
</head>
<body>
<security:authorize access="hasRole('CUSTOMER')">
<input type="submit" name="Search“ value="<spring:message code="fixUpTask/findOne.do?fixUpTaskId={id}" /> /> 
<display:table name="fixUpTasks" id="row"
	requestURI="fixUpTask/customer/findAll.do" pagesize="5"
		class="FixUpTask">
	
	<display:column property="url" 
		<spring:url value=“fixUpTask/findOne.do?fixUpTaskId={id}"> 
			<spring:param name=“id" value=“${id}" /> </spring:url> />
	<display:column property="date" titleKey="fixUpTask.startDate" />
	<display:column property="description" titleKey="fixUpTask.description" />
	<display:column property="id" titleKey="fixUpTask.id" />

</display:table>
<input type="submit" name="Create“ value="<spring:message code="fixUpTask/create.do" /> />
</security:authorize>

</body>
</html>