<%@ include file="../../header/header.jsp"%>
      <div class="container-fluid">
          <h2>Course List</h2>
		  <table class="table table-striped" id="tableCourses">
		   <thead>
		    <th scope="row">Title</th>
		    <th scope="row">Update</th>
		    <th scope="row">Delete</th>
		   </thead>
		   <tbody>
		    <c:forEach items="${courses}" var="course" >
		     <tr>
		      <td>${course.getTitle()}</td>
		      <td>
		       <spring:url value="/courses/updateCourse/${course.getId()}" var="updateURL" />
		       <a class="btn btn-warning" href="${updateURL}" role="button" ><i class="far fa-edit"></i></a>
		      </td>
		      <td>
		       <spring:url value="/courses/deleteCourse/${course.getId()}" var="deleteURL" />
		       <a class="btn btn-danger" onclick="return confirm('Are you sure, you want to delete this item?');" href="${deleteURL}" role="button" ><i class="fas fa-trash-alt"></i></a>
		      </td>
		     </tr>
		    </c:forEach>
		   </tbody>
		  </table>
		  <spring:url value="/courses/vueAddCourse/" var="addURL" />
		  <a class="btn btn-success" href="${addURL}" role="button" >Add New Course</a>
      </div>
    </div>
    <!-- /#page-content-wrapper -->
  </div>
  <!-- /#wrapper -->
<%@ include file="../../footer/footer.jsp"%>