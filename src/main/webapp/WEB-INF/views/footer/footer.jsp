  <footer class="page-footer font-small dark">
 	 <!-- Copyright -->
  <div class="footer-copyright text-center py-3">© 2019 Copyright:
    <span> Created by Marcel FOTSING & Roméo DONTIO </span>
  </div>
  <!-- Copyright -->
  </footer> 
  <!-- Bootstrap core JavaScript -->
  <!-- script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script-->
  <script src="../../../resources/js/jquery.min.js"></script>
  <script src="../../webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="../../../resources/js/bootstrap.bundle.min.js"></script>
  <script src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
  <script src="../../../resources/js/jquery.datetimepicker.full.js"></script>

  <!-- Menu Toggle Script -->
  <script>
    $("#menu-toggle").click(function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
    });
    
    $("#startDate").datetimepicker({
        i18n:{
            us:{
             months:[
              'January','February','März','April',
              'May','June','July','August',
              'September','October','November','December',
             ],
             dayOfWeek:[
              "So.", "Mo", "Tu", "We", 
              "Th", "Fr", "Sa.",
             ]
            }
           },
        timepicker:false,
        format:'Y-m-d'
    });
    
    //DataPicker pour startDate & endDate
    $("#endDate").datetimepicker({
         i18n:{
            us:{
             months:[
              'January','February','März','April',
              'May','June','July','August',
              'September','October','November','December',
             ],
             dayOfWeek:[
              "So.", "Mo", "Tu", "We", 
              "Th", "Fr", "Sa.",
             ]
            }
           },
        timepicker:false,
        format:'Y-m-d'
    });
    
    //Insertion du datatable
    $(document).ready( function(){
        $('#tableSessions').DataTable({
            "pageLength": 6,
            "searching": false,
            "bLengthChange" : false
        });
         $('#tableClients').DataTable({
            "pageLength": 8,
            "searching": false,
            "bLengthChange" : false
        });
         $('#tableLocations').DataTable({
            "pageLength": 8,
            "searching": false,
            "bLengthChange" : false
        });
         $('#tableCourses').DataTable({
            "pageLength": 8,
            "searching": false,
            "bLengthChange" : false
        });
    });
  </script>
  
</body>

</html>