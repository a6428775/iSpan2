<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserProfile</title>
</head>
<body>
	<h3>Register as a new member</h3>
	<form:form action="createuserprofiles.controller" method="post" modelAttribute="userProfile">
		<table>
			<tr>
				<td><form:label path="name">Name:</form:label></td>
				<td><form:input path="name" /></td>
			</tr>
			<tr>
				<td><form:label path="password">Password:</form:label></td>
				<td><form:input path="password" /></td>
			</tr>
			
			<tr>
				<td><form:label path="emailaddress">Email-address:</form:label></td>
				<td><form:input path="emailaddress" /></td>
			</tr>
			
			<tr>
				<td><form:label path="phone">Phone:</form:label></td>
				<td><form:input path="phone" /></td>
			</tr>
			
			<tr>
				<td colspan="2"><form:button value="Submit">Submit</form:button></td>
			</tr>
		</table>
	</form:form>
</body>
</html>