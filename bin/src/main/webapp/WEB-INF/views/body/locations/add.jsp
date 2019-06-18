<%@ include file="../../header/header.jsp"%>
      <div class="container-fluid">
		  <spring:url value="/locations/addLocation" var="saveURL" />
		  <h2>Add or Modify Location</h2>
		  <form:form  modelAttribute="locationForm" method="post" action="${saveURL }" cssClass="form" >
		   <form:hidden path="id"/>
		   <div class="form-group col-sm-5">
		    <label>Title</label>
		    <form:input path="city" cssClass="form-control" id="city" required="required"/>
		   </div>
		   <button type="submit" class="btn btn-success">Save</button>
		  </form:form>
      </div>
    </div>
    <!-- /#page-content-wrapper -->
  </div>
  <!-- /#wrapper -->
<%@ include file="../../footer/footer.jsp"%>