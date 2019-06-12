<%@ include file="../../header/header.jsp"%>
      <div class="container-fluid">
          <h2>Client(s) for Session : </h2>
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
	      <tr class="table-danger">
	        <td>${session.getCourse().getTitle()}</td>
	        <td>${session.getStartDate()}</td>
	        <td>${session.getEndDate() }</td>
	        <td>${session.getLocation().getCity()}</td>
	      </tr>
	    </tbody>
	  </table>
		  <table class="table table-striped">
		   <thead>
		    <th scope="row">First Name</th>
		    <th scope="row">Last Name</th>
		    <th scope="row">Email</th>
		    <th scope="row">Address</th>
		    <th scope="row">Phone</th>
		    <th scope="row">Delete</th>
		   </thead>
		   <tbody>
		    <c:if test="${empty clients }">
	   		<tr><td colspan="7">Pas de client pour cette session.</td></tr>
                    </c:if>
                    <c:if test="${!empty clients }">
	   		<c:forEach items="${clients}" var="client" >
                        <tr>
			      <td>${client.getFirstName()}</td>
			      <td>${client.getLastName()}</td>
			      <td>${client.getEmail()}</td>
			      <td>${client.getAddress()}</td>
			      <td>${client.getPhone()}</td>
			      <td>
			       <spring:url value="/client/deleteClient/${client.getId()}" var="deleteURL" />
			       <a class="btn btn-danger" onclick="return confirm('Are you sure, you want to delete this item?');" href="${deleteURL}" role="button" ><i class="fas fa-trash-alt"></i></a>
			      </td>
                        </tr>
                        </c:forEach>
                    </c:if>
		   
		   </tbody>
		  </table>
      </div>
    </div>
    <!-- /#page-content-wrapper -->
  </div>
  <!-- /#wrapper -->
<%@ include file="../../footer/footer.jsp"%>