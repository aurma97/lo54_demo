<%@ include file="../../header/header.jsp"%>
      <div class="container-fluid">
          <c:if test="${error == false }">
	   	<div class="alert alert-danger alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <strong>Danger!</strong> Can not delete this location because registered session(s).
                </div>
            </c:if>
          <h2>Location List</h2>
		  <table class="table table-striped" id="tableLocations">
		   <thead>
		    <th scope="row">City</th>
		    <th scope="row">Update</th>
		    <th scope="row">Delete</th>
		   </thead>
		   <tbody>
		    <c:forEach items="${locations}" var="location" >
		     <tr>
		      <td>${location.getCity()}</td>
		      <td>
		       <spring:url value="/locations/updateLocation/${location.getId()}" var="updateURL" />
		       <a class="btn btn-warning" href="${updateURL}" role="button" ><i class="far fa-edit"></i></a>
		      </td>
		      <td>
		       <spring:url value="/locations/deleteLocation/${location.getId()}" var="deleteURL" />
		       <a class="btn btn-danger" onclick="return confirm('Are you sure, you want to delete this item?');" href="${deleteURL}" role="button" ><i class="fas fa-trash-alt"></i></a>
		      </td>
		     </tr>
		    </c:forEach>
		   </tbody>
		  </table>
		  <spring:url value="/locations/vueAddLocation/" var="addURL" />
		  <a class="btn btn-success" href="${addURL}" role="button" >Add New Location</a>
      </div>
    </div>
    <!-- /#page-content-wrapper -->
  </div>
  <!-- /#wrapper -->
<%@ include file="../../footer/footer.jsp"%>