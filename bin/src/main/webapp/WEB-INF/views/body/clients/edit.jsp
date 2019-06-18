<%@ include file="../../header/header.jsp"%>
      <div class="container-fluid">
          <h2>Edit Client</h2>
          <spring:url value="/client/updateClient/${client.getCourseSession().getId()}/${client.getId()}" var="updateURL" />
          <form:form modelAttribute="client" method="post" action="${updateURL}" cssClass="form" >
            <div class="form-group col-sm-5">
             <label>First Name : </label>
             <form:input path="firstName" cssClass="form-control" id="firstName" required="required"/>
            </div>
            <div class="form-group col-sm-5">
             <label> Last Name : </label>
             <form:input path="lastName" cssClass="form-control" id="lastName" required="required"/>
            </div>
            <div class="form-group col-sm-5">
             <label> Email : </label>
             <form:input path="email" cssClass="form-control" id="email" required="required"/>
            </div>
            <div class="form-group col-sm-5">
             <label> Address : </label>
             <form:input path="address" cssClass="form-control" id="address" required="required"/>
            </div>
            <div class="form-group col-sm-5">
             <label> Phone : </label>
             <form:input path="phone" cssClass="form-control" id="phone" required="required"/>
            </div>
            <button type="submit" class="btn btn-success">Modify</button>
           </form:form>
        </div>
    </div>
    <!-- /#page-content-wrapper -->
  </div>
  <!-- /#wrapper -->
<%@ include file="../../footer/footer.jsp"%>