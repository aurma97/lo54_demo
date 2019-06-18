<%@ include file="../../header/header.jsp"%>
      <div class="container-fluid">
					<h2>Client List</h2>

					<hr>
					<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
						Advanced search
					</button>
					<hr>

					<div class="collapse" id="collapseExample">
							<table class="table table-striped">
									<tbody>
											<td scope="row"><input type="text" id="firstName" onkeyup="firstNameSearch()"  placeholder="Search by FirstName"></td>
											<td scope="row"><input type="text" id="lastName" onkeyup="lastNameSearch()" placeholder="Search by LastName"></td>
											<td scope="row"><input type="text" id="email" onkeyup="emailSearch()" placeholder="Search by Email"></td>
											<td scope="row"><input type="text" id="address" onkeyup="addressSearch()" placeholder="Search by Address"></td>
											<td scope="row"><input type="text" id="phone" onkeyup="phoneSearch()" placeholder="Search by Phone"></td>
											<td scope="row"></td>
											<td scope="row"></td>
									</tbody>
							</table>
					</div>
			
					<table class="table table-striped" id="tableClients">
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
								<spring:url value="/client/vueUpdate/${client.getId()}" var="updateURL" />
								<a class="btn btn-warning" href="${updateURL}" role="button" ><i class="far fa-edit"></i></a>
								</td>
								<td>
								<spring:url value="/client/deleteClient/${client.getId()}" var="deleteURL" />
								<a class="btn btn-danger" onclick="return confirm('Are you sure, you want to delete this item?');" href="${deleteURL}" role="button"><i class="fas fa-trash-alt"></i></a>
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
	<script>
		function firstNameSearch() {
      // Declare variables 
      var input, filter, table, tr, td, i;
      input = document.getElementById("firstName");
      filter = input.value.toUpperCase();
      table = document.getElementById("tableClients");
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

		function lastNameSearch() {
      // Declare variables 
      var input, filter, table, tr, td, i;
      input = document.getElementById("lastName");
      filter = input.value.toUpperCase();
      table = document.getElementById("tableClients");
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

		function emailSearch() {
      // Declare variables 
      var input, filter, table, tr, td, i;
      input = document.getElementById("email");
      filter = input.value.toUpperCase();
      table = document.getElementById("tableClients");
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

		function addressSearch() {
      // Declare variables 
      var input, filter, table, tr, td, i;
      input = document.getElementById("address");
      filter = input.value.toUpperCase();
      table = document.getElementById("tableClients");
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

		function phoneSearch() {
      // Declare variables 
      var input, filter, table, tr, td, i;
      input = document.getElementById("phone");
      filter = input.value.toUpperCase();
      table = document.getElementById("tableClients");
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

	</script>
<%@ include file="../../footer/footer.jsp"%>