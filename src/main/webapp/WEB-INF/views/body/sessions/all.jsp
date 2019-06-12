<%@ include file="../../header/header.jsp"%>
      <div class="container-fluid">
		<h2>Session List</h2>
		
		<hr>
		<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
			Advanced search
		</button>
		<hr>

		<div class="collapse" id="collapseExample">
				<table class="table table-striped">
						<tbody>
								<td scope="row"><input type="text" id="courseTitle" onkeyup="courseTitleSearch()"  placeholder="Search by title"></td>
								<td scope="row"><input type="text" id="startDate" onkeydown="startDateSearch()" placeholder="Search by startDate"></td>
								<td scope="row"><input type="text" id="endDate" onkeydown="endDateSearch()" placeholder="Search by endDate"></td>
								<td scope="row"><input type="text" id="max" onkeyup="maxSearch()" placeholder="Search by max"></td>
								<td scope="row"><input type="text" id="participants" onkeyup="participantsSearch()" placeholder="Search by participants"></td>
								<td scope="row"><input type="text" id="percentage" onkeyup="percentageSearch()" placeholder="Search by percentage"></td>
								<td scope="row"></td>
								<td scope="row"></td>
						</tbody>
				</table>
		</div>


	    <table class="table table-striped" id="tableSessions">
	   		<thead>
	   			<th scope="row">Course Title</th>
	    		<th scope="row">Start Date</th>
	    		<th scope="row">End Date</th>
                        <th scope="row">Location</th>
	    		<th scope="row">Max</th>
	    		<th scope="row">Participant(s)</th>
	    		<th scope="row">Percentage</th>
	    		<th scope="row">Subscribe</th>
	    		<th scope="row">Subscribers</th>
                        <th scope="row">Update</th>
                        <th scope="row">Delete</th>
	   		</thead>
	   		<tbody>
	   			<c:if test="${empty sessions }">
	   				<tr><td colspan="7">No sessions registered</td></tr>
	   			</c:if>
	   			<c:if test="${!empty sessions }">
	   				<c:forEach items="${sessions}" var="session" >
	    			 <tr>
		     			<td>${session.getCourse().getTitle() }</td>
		      			<td>${session.getStartDate() }</td>
		      			<td>${session.getEndDate() }</td>
                                        <td>${session.getLocation().getCity() }</td>
		      			<td>${session.getMax() }</td>
		      			<td>${session.getParticipants()}</td>
		      			<td>
		      				<div class="progress">
		      					<div class="progress-bar bg-danger" style="width:${session.getBusy()}%">${session.getBusy()}%</div>
		      				</div>
		      			</td>
		      			<td>
		      				<c:if test="${session.getMax() != session.getParticipants() }">
		      					<spring:url value="/client/applySession/${session.getId()}" var="applyURL" />
		       					<a class="btn btn-primary" href="${applyURL }" role="button" ><i class="fas fa-user-plus"></i></a>
		      				</c:if>
		       				
		      			</td>
		      			<spring:url value="/client/allClients/${session.getId()}" var="allClientURL" />
		      			<td><a class="btn btn-success" href="${allClientURL}" role="button"><i class="fas fa-users"></i></a></td>
                                        
                                        <td>
		      				<spring:url value="/session/vueUpdateSession/${session.getId()}" var="updateURL" />
		      				<a class="btn btn-warning" href="${updateURL }" role="button"><i class="far fa-edit"></i></a>
		      			</td>
                                        <td>
		      				<spring:url value="/session/deleteSession/${session.getId()}" var="deleteURL" />
		      				<a class="btn btn-danger" onclick="return confirm('Are you sure, you want to delete this Session?');" href="${deleteURL }" role="button"><i class="fas fa-trash-alt"></i></a>
		      			</td>
	     			 </tr>
	   				</c:forEach>
	   			</c:if>
	    		
	   		</tbody>
	  	</table>
	  	<spring:url value="/session/vueAddSession" var="addURL" />
	  	<a class="btn btn-success" href="${addURL }" role="button" ><i class="fas fa-calendar-plus"></i> Add New Session</a>
      </div>
    </div>
    <!-- /#page-content-wrapper -->
  </div>
  <!-- /#wrapper -->
  <script>
		function courseTitleSearch() {
      // Declare variables 
      var input, filter, table, tr, td, i;
      input = document.getElementById("courseTitle");
      filter = input.value.toUpperCase();
      table = document.getElementById("tableSessions");
      tr = table.getElementsByTagName("tr");

      // Loop through all table rows, and hide those who don't match the search query
      for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[0]; //Ici on filtre par Nom
        if (td) {
          if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
            tr[i].style.display = "";
          } else {
            tr[i].style.display = "none";
          }
        } 
      }
    }

		function startDateSearch() {
      // Declare variables 
      var input, filter, table, tr, td, i;
      input = document.getElementById("startDate");
      filter = input.value.toUpperCase();
      table = document.getElementById("tableSessions");
      tr = table.getElementsByTagName("tr");

      // Loop through all table rows, and hide those who don't match the search query
      for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[1]; //Ici on filtre par Nom
        if (td) {
          if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
            tr[i].style.display = "";
          } else {
            tr[i].style.display = "none";
          }
        } 
      }
    }

		function endDateSearch() {
      // Declare variables 
      var input, filter, table, tr, td, i;
      input = document.getElementById("endDate");
      filter = input.value.toUpperCase();
      table = document.getElementById("tableSessions");
      tr = table.getElementsByTagName("tr");

      // Loop through all table rows, and hide those who don't match the search query
      for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[2]; //Ici on filtre par Nom
        if (td) {
          if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
            tr[i].style.display = "";
          } else {
            tr[i].style.display = "none";
          }
        } 
      }
    }

	function maxSearch() {
      // Declare variables 
      var input, filter, table, tr, td, i;
      input = document.getElementById("max");
      filter = input.value.toUpperCase();
      table = document.getElementById("tableSessions");
      tr = table.getElementsByTagName("tr");

      // Loop through all table rows, and hide those who don't match the search query
      for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[3]; //Ici on filtre par Nom
        if (td) {
          if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
            tr[i].style.display = "";
          } else {
            tr[i].style.display = "none";
          }
        } 
      }
    }

	function participantsSearch() {
      // Declare variables 
      var input, filter, table, tr, td, i;
      input = document.getElementById("participants");
      filter = input.value.toUpperCase();
      table = document.getElementById("tableSessions");
      tr = table.getElementsByTagName("tr");

      // Loop through all table rows, and hide those who don't match the search query
      for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[4]; //Ici on filtre par Nom
        if (td) {
          if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
            tr[i].style.display = "";
          } else {
            tr[i].style.display = "none";
          }
        } 
      }
    }

	function percentageSearch() {
      // Declare variables 
      var input, filter, table, tr, td, i;
      input = document.getElementById("percentage");
      filter = input.value.toUpperCase();
      table = document.getElementById("tableSessions");
      tr = table.getElementsByTagName("tr");

      // Loop through all table rows, and hide those who don't match the search query
      for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[5]; //Ici on filtre par Nom
        if (td) {
          if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
            tr[i].style.display = "";
          } else {
            tr[i].style.display = "none";
          }
        } 
      }
    }

	</script>
<%@ include file="../../footer/footer.jsp"%>