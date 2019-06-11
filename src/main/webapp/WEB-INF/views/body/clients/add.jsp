<%@ include file="../../header/header.jsp"%>
<body>
 <div class="container-fluid">
  <h3>You are applying for this session : </h3>
  <table class="table table-hover">
    <thead>
      <tr>
        <th>Title</th>
        <th>Start Date</th>
        <th>End Date</th>
        <th>Location</th>
      </tr>
    </thead>
    <tbody>
      <tr class="table-info">
        <td>${sessionForm.getCourse().getTitle()}</td>
        <td>${sessionForm.getStartDate()}</td>
        <td>${sessionForm.getEndDate() }</td>
        <td>${sessionForm.getLocation().getCity()}</td>
      </tr>
    </tbody>
  </table>

  
  <spring:url value="/clients/${sessionForm.getId()}/addClient" var="addURL" />
  <h3>Enter your coordonnates :</h3>
  <form:form modelAttribute="client" method="post" action="${addURL }" cssClass="form" >
   <div class="form-group">
    <label>First Name : </label>
    <form:input path="firstName" cssClass="form-control" id="firstName" />
   </div>
   <div class="form-group">
    <label> Last Name : </label>
    <form:input path="lastName" cssClass="form-control" id="lastName" />
   </div>
   <div class="form-group">
    <label> Email : </label>
    <form:input path="email" cssClass="form-control" id="email" />
   </div>
   <div class="form-group">
    <label> Address : </label>
    <form:input path="address" cssClass="form-control" id="address" />
   </div>
   <div class="form-group">
    <label> Phone : </label>
    <form:input path="phone" cssClass="form-control" id="phone" />
   </div>
   <button type="submit" class="btn btn-success">Apply</button>
  </form:form>
  
 </div>
<%@ include file="../../footer/footer.jsp"%>