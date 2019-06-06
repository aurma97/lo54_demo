<%@ include file="../../header/header.jsp"%>
      <div class="container-fluid">
        <h2>Session List</h2>
	    <input class="form-control" id="filter" type="text" placeholder="Filter by date..">
	    <table class="table table-striped">
	   		<thead>
	   			<th scope="row">Course Title</th>
	    		<th scope="row">Start Date</th>
	    		<th scope="row">End Date</th>
	    		<th scope="row">Max</th>
	    		<th scope="row">Location</th>
	    		<th scope="row">Apply</th>
	   		</thead>
	   		<tbody>
	    		<c:forEach items="${sessions}" var="session" >
	    		<tr>
	     			<td>${session.getCourse().getTitle() }</td>
	      			<td>${session.getStartDate() }</td>
	      			<td>${session.getEndDate() }</td>
	      			<td>${session.getMax() }</td>
	      			<td>${session.getLocation().getCity() }</td>
	      			<td>
	       				<spring:url value="/client/applySession/${session.getId()}" var="applyURL" />
	       				<a class="btn btn-primary" href="${applyURL }" role="button" >Apply</a>
	      			</td>
	     		</tr>
	   			</c:forEach>
	   		</tbody>
	  	</table>
	  	< spring:url value="/courseSession/vueAddSession/" var="addURL" />
	  	<a class="btn btn-success" href="${addURL }" role="button" >Add New Session</a>
      </div>
    </div>
    <!-- /#page-content-wrapper -->
  </div>
  <!-- /#wrapper -->
<%@ include file="../../footer/footer.jsp"%>