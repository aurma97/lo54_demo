<%@ include file="../../header/header.jsp"%>
      <div class="container-fluid">
		  <spring:url value="/session/updateSession/${session.getId()}" var="updateURL" />
		  <h2>Modify Session</h2>
		  <form:form modelAttribute="session" method="post" action="${updateURL}" cssClass="form" >
		   <form:hidden path="id"/>
                   
		   <div class="form-group col-sm-5">
		    <label>Course</label>
		     <form:select path="course" class="custom-select" required="required">
                        <form:option value="" label="--Select Course--"/>
                        <c:forEach items="${courses}" var="course">
                            <form:option value="${course.getId()}" label="${course.getTitle()}" selected="${course.getTitle() == session.getCourse().getTitle() ? 'selected' : ''}" />
                        </c:forEach>
                    </form:select>
		   </div>
                   
                    <div class="form-group col-sm-5">
		    <label>Location</label>
		     <form:select path="location" class="custom-select" required="required">
                        <form:option value="" label="--Select Location--"/>
                        <c:forEach items="${locations}" var="location">
                        <form:option value="${location.getId()}" label="${location.getCity()}" selected="${location.getCity() == session.getLocation().getCity() ? 'selected' : ''}" />
                        </c:forEach>
                    </form:select>
		   </div>
                   
		   <div class="form-group col-sm-5">
		   <label>Max</label>
		   <form:input path="max" cssClass="form-control" id="max" required="required"/>
		   </div>
                   
                   <div class="form-group col-sm-5">
		   <label>Start Date :</label>
		   <form:input path="startDate" cssClass="form-control" id="startDate" required="required"/>
		   </div>
                   
                   <div class="form-group col-sm-5">
		   <label>End Date</label>
		   <form:input path="endDate" cssClass="form-control" id="endDate" required="required"/>
		   </div>
		   <button type="submit" class="btn btn-success">Modify</button>
		  </form:form>
      </div>
    </div>
    <!-- /#page-content-wrapper -->
  </div>
  <!-- /#wrapper -->
<%@ include file="../../footer/footer.jsp"%>