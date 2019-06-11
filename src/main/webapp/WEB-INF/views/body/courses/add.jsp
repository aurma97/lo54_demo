<%@ include file="../../header/header.jsp"%>
      <div class="container-fluid">
		  <spring:url value="/courses/addCourse" var="saveURL" />
		  <h2>Add or Modify Course</h2>
		  <form:form modelAttribute="courseForm" method="post" action="${saveURL }" cssClass="form" >
		   <form:hidden path="id"/>
		   <div class="form-group col-sm-5">
		    <label>Title</label>
		    <form:input path="title" cssClass="form-control" id="title" required="required"/>
		   </div>
		   <button type="submit" class="btn btn-success">Save</button>
		  </form:form>
      </div>
    </div>
    <!-- /#page-content-wrapper -->
  </div>
  <!-- /#wrapper -->
<%@ include file="../../footer/footer.jsp"%>