<%@ include file="../../header/header.jsp"%>
      <div class="container-fluid">
		  <spring:url value="/sessions/addCourseSession" var="saveURL" />
		  <h2>Add or Modify Session</h2>
		  <form:form modelAttribute="sessionForm" method="post" action="${saveURL }" cssClass="form" >
		   <form:hidden path="id"/>
		   <div class="form-group">
		    <label>Course</label>
		     <form:select path="phone">
                <form:option value="-" label="--Select Course--"/>
                <form:options items="${courses}" />
            </form:select>
		   </div>
		   <div class="form-group">
		   <label>Max</label>
		   <form:input path="max" cssClass="form-control" id="max" required="required"/>
		   </div>
		   <button type="submit" class="btn btn-success">Save</button>
		  </form:form>
      </div>
    </div>
    <!-- /#page-content-wrapper -->
  </div>
  <!-- /#wrapper -->
<%@ include file="../../footer/footer.jsp"%>