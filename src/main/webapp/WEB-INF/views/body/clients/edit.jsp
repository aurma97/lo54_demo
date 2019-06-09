<%@ include file="../../header/header.jsp"%>
      <div class="container-fluid">
          <h2>Client List</h2>
		  <table class="table table-striped">
		   <thead>
		    <th scope="row">First Name</th>
		    <th scope="row">Last Name</th>
		    <th scope="row">Email</th>
		    <th scope="row">Address</th>
		    <th scope="row">Phone</th>
		    <th scope="row">Update</th>
		    <th scope="row">Delete</th>
		   </thead>
		   <tbody>
		    <c:forEach items="${clients}" var="client" >
		     <tr>
			      <td>${client.getFirstName()}</td>
			      <td>${client.getLastName()}</td>
			      <td>${client.getEmail()}</td>
			      <td>${client.getAddress()}</td>
			      <td>${client.getPhone()}</td>
			      <td>
			       <spring:url value="/client/updateClient/session/${client.getCourseSession().getId()}/client/${client.getId()}" var="updateURL" />
			       <a class="btn btn-warning" href="${updateURL}" role="button" >Update</a>
			      </td>
			      <td>
			       <spring:url value="/client/deleteClient/${client.getId()}" var="deleteURL" />
			       <a class="btn btn-danger" onclick="return confirm('Are you sure, you want to delete this item?');" href="${deleteURL}" role="button" >Delete</a>
			      </td>
		     </tr>
		    </c:forEach>
		   </tbody>
		  </table>
      </div>
    </div>
    <!-- /#page-content-wrapper -->
  </div>
  <!-- /#wrapper -->
<%@ include file="../../footer/footer.jsp"%>