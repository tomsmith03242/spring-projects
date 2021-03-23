<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<!-- -favicon Icon -->
<title>Tekko</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/style.css">
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<!-- bootstrap link -->
<script  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>	

<!-- dataTables link-->	
<link rel="stylesheet" type="text/css" href="resources/datatables/DataTables-1.10.21/css/jquery.dataTables.css" />
<script type="text/javascript" src="resources/datatables/DataTables-1.10.21/js/jquery.dataTables.js"></script>
	
<!-- boostrap validation -->	
<link rel="stylesheet" type="text/css" href="resources/css/bootstrapValidator.min.css" />
<script type="text/javascript" src="resources/js/bootstrapValidator.js"></script>	

<!-- bootbox link -->		
<script type="text/javascript" src="resources/js/bootbox.min.js"></script>	

<!-- select2 liberary link -->
<link href="${contextPath}/resources/select2/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.min.js"></script>

 <link rel="icon" href="resources/images/Tekko Logo204.jpg" type="image/png" /> 
 <!-- Bootstrap -->
<link href="resources/css/bootstrap.css" rel="stylesheet">
<!-- Custom Theme Style -->
<link href="resources/build/css/custom.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- on/off toggle btn style -->
<style>
.switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 34px;
}

.switch input {
	opacity: 0;
	width: 0;
	height: 0;
}

.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 26px;
	width: 26px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: #2196F3;
}

input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
}
/*fixed header*/
table {
  text-align: left;
  position: relative;
}

th {
  background: #2859ec;
  position: -webkit-sticky;
  position: sticky;
  top: 50px;
  z-index: 2;
}
</style>
<script type="text/javascript" src="resources/js/jsscript.js"></script>
</head>
<body style="background-repeat: no-repeat; background-size: cover;">
<jsp:include page="sidenav.jsp" />

	
	
	