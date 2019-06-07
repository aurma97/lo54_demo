<%@ include file="../../header/header.jsp"%>
<body>
 <div class="container-fluid">
 <div class="card bg-info text-white">
 	<div class="card-header">You are applying for this session :</div>
    <div class="card-body">
    	<ul>
		  <li> Title : ${sessionForm.getCourse().getTitle()}</li>
		  <li>Start date : ${sessionForm.getStartDate()}</li>
		  <li>End date : ${sessionForm.getEndDate() }</li>
		  <li>Location : ${sessionForm.getLocation().getCity()}</li>
  		</ul>
    </div>
  </div>
  
  <spring:url value="/clients/${sessionForm.getId()}/addClient" var="addURL" />
  <h1>Enter your coordonnates :</h1>
  <form:form modelAttribute="clientForm" method="post" action="${addURL }" cssClass="form" >
   <form:hidden path="id"/>
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