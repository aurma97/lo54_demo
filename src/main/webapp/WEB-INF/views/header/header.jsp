<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Session Course</title>
 <link href="../../webjars/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
 <!-- Custom styles for this template -->
 <link href="../../../resources/css/simple-sidebar.css" rel="stylesheet">
 <link href="../../../resources/css/jquery.datetimepicker.min.css" rel="stylesheet">
 <link href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">
 <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>

</head>
<body>

  <div class="d-flex" id="wrapper">

    <!-- Sidebar -->
    <div class="bg-light border-right" id="sidebar-wrapper">
      <div class="sidebar-heading">Menu </div>
      <div class="list-group list-group-flush">
        <a href="/courseSession" class="list-group-item list-group-item-action bg-light"><i class="fas fa-calendar" style="font-size:24px"></i> Sessions</a>
        <a href="/courses" class="list-group-item list-group-item-action bg-light"><i class="fas fa-book" style="font-size:24px"></i> Courses</a>
        <a href="/clients" class="list-group-item list-group-item-action bg-light"><i class="fas fa-users" style="font-size:24px"></i> Clients</a>
        <a href="/locations" class="list-group-item list-group-item-action bg-light"><i class="fas fa-map-marker-alt" style="font-size:24px"></i> Locations</a>
      </div>
    </div>
    <!-- /#sidebar-wrapper -->
     <!-- Page Content -->
    <div id="page-content-wrapper">

      <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
      	<i id="menu-toggle" class='fas fa-th-list' style='font-size:36px'></i>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
      </nav>
    