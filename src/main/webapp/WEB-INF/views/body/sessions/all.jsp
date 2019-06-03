<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Session List</title>
 <link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
 <script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
 <script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
</head>
<body>
 <div class="container">
  <h2>Session List</h2>
  <table class="table table-striped">
   <thead>
   	<th scope="row">Course Title</th>
    <th scope="row">Start Date</th>
    <th scope="row">End Date</th>
    <th scope="row">Max</th>
    <th scope="row">Apply</th>
   </thead>
   <tbody>
    <c:forEach items="${sessions}" var="session" >
     <tr>
      <td>${session.startDate}</td>
      <td>${session.endDate}</td>
      <td>${session.max}</td>
      <td>
       <spring:url value="/courses/updateCourse/${session.id }" var="updateURL" />
       <a class="btn btn-primary" href="${updateURL }" role="button" >Apply</a>
      </td>
     </tr>
    </c:forEach>
   </tbody>
  </table>
 </div>
</body>
</html>