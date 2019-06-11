<%@ include file="../../header/header.jsp"%>
      <div class="container-fluid">
        <h2>Session List</h2>
	    <table class="table table-striped" id="tableSessions">
	   		<thead>
	   			<th scope="row">Course Title</th>
	    		<th scope="row">Start Date</th>
	    		<th scope="row">End Date</th>
	    		<th scope="row">Max</th>
	    		<th scope="row">Participant(s)</th>
	    		<th scope="row">Percentage</th>
	    		<th scope="row">Location</th>
	    		<th scope="row">Update</th>
	    		<th scope="row">Subscribe</th>
	    		<th scope="row">Subscribers</th>
	   		</thead>
	   		<tbody>
	   			<c:if test="${empty sessions }">
	   				<tr><td colspan="7">Aucune session enregistrée.</td></tr>
	   			</c:if>
	   			<c:if test="${!empty sessions }">
	   				<c:forEach items="${sessions}" var="session" >
	    			 <tr>
		     			<td>${session.getCourse().getTitle() }</td>
		      			<td>${session.getStartDate() }</td>
		      			<td>${session.getEndDate() }</td>
		      			<td>${session.getMax() }</td>
		      			<td>${session.getParticipants()}</td>
		      			<td>
		      				<div class="progress">
		      					<div class="progress-bar bg-danger" style="width:${session.getBusy()}%">${session.getBusy()}%</div>
		      				</div>
		      			</td>
		      			<td>${session.getLocation().getCity() }</td>
		      			<td>
		      				<spring:url value="/session/vueUpdateSession/${session.getId()}" var="updateURL" />
		      				<a class="btn btn-warning" href="${updateURL }" role="button">Update</a>
		      			</td>
		      			<td>
		      				<c:if test="${session.getMax() != session.getParticipants() }">
		      					<spring:url value="/client/applySession/${session.getId()}" var="applyURL" />
		       					<a class="btn btn-primary" href="${applyURL }" role="button" >Subscribe</a>
		      				</c:if>
		       				
		      			</td>
		      			<spring:url value="/client/allClients/${session.getId()}" var="allClientURL" />
		      			<td><a class="btn btn-success" href="${allClientURL}" role="button">Subscribers</a></td>
	     			 </tr>
	   				</c:forEach>
	   			</c:if>
	    		
	   		</tbody>
	  	</table>
	  	<spring:url value="/session/vueAddSession" var="addURL" />
	  	<a class="btn btn-success" href="${addURL }" role="button" >Add New Session</a>
      </div>
    </div>
    <!-- /#page-content-wrapper -->
  </div>
  <!-- /#wrapper -->
<%@ include file="../../footer/footer.jsp"%>