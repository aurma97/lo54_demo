<%@ include file="../../header/header.jsp"%>
<body>
 <div class="container-fluid">
  <h4>You are applying for this session : </h4>
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
        <td>${session.getCourse().getTitle()}</td>
        <td>${session.getStartDate()}</td>
        <td>${session.getEndDate() }</td>
        <td>${session.getLocation().getCity()}</td>
      </tr>
    </tbody>
  </table>

  <spring:url value="/client/${session.getId()}/addClient" var="addURL" />
  <h4>Enter your coordinates :</h4>
  <form:form modelAttribute="client" method="post" action="${addURL }" cssClass="form" >
   <div class="form-group col-sm-5">
    <label>First Name : </label>
    <form:input path="firstName" cssClass="form-control" id="firstName" />
   </div>
   <div class="form-group col-sm-5">
    <label> Last Name : </label>
    <form:input path="lastName" cssClass="form-control" id="lastName" />
   </div>
   <div class="form-group col-sm-5">
    <label> Email : </label>
    <form:input path="email" cssClass="form-control" id="email" />
   </div>
   <div class="form-group col-sm-5">
    <label> Address : </label>
    <form:input path="address" cssClass="form-control" id="address" />
   </div>
   <div class="form-group col-sm-5">
    <label> Phone : </label>
    <form:input path="phone" cssClass="form-control" id="phone" />
   </div>
   <button type="submit" class="btn btn-success">Apply</button>
  </form:form>
  
 </div>
<%@ include file="../../footer/footer.jsp"%>