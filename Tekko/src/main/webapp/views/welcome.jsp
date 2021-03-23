<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <title>Welcome</title> -->

<!-- Bootstrap -->
<link href="resources/css/bootstrap.css" rel="stylesheet">
<!-- Custom Theme Style -->
<link href="resources/build/css/custom.min.css" rel="stylesheet">

<!-- favicon -->
<link rel="icon" href="resources/images/favicon.png" type="image/png" />
<link rel="icon" href="/favicon.ico" type="image/png" />

<!-- Font Awesome -->
<style type="text/css">
#container {
	height: 400px;
}

.highcharts-figure, .highcharts-data-table table {
	min-width: 310px;
	max-width: 800px;
	margin: 1em auto;
}

#datatable {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #EBEBEB;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 500px;
}

#datatable caption {
	padding: 1em 0;
	font-size: 1.2em;
	color: #555;
}

#datatable th {
	font-weight: 600;
	padding: 0.5em;
}

#datatable td, #datatable th, #datatable caption {
	padding: 0.5em;
}

#datatable thead tr, #datatable tr:nth-child(even) {
	background: #f8f8f8;
}

#datatable tr:hover {
	background: #f1f7ff;
}
</style>
</head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<body style="background-repeat: no-repeat; background-size: cover;">
	<c:if test="${pageContext.request.userPrincipal.name != null}">
		<jsp:include page="header.jsp" />
	</c:if>

	<div class="container">
		<c:if test="${pageContext.request.userPrincipal.name == null}">
			<h4 align="center" class="text-primary"><strong>Welcome To Tekko</strong></h4>
			<p align="center" class="text-primary">
				<a href="login">Please Login : Login</a>
			</p>
		</c:if>
		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<h4 align="center"  class="text-primary"><strong>Welcome</strong>
			</h4>
		</c:if>

		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<!-- <table class="table table-bordered">
				<tbody>
					<tr style="width:600px;">
						<td><div class="panel"> 
									<div id="pieChart" style="width: 500px;height: 250px;">
									</div> 
							</div></td>
						<td><div class="panel"> 
										<div id="barChart"
											style="width: 500px;height: 250px;">
										</div> 
							</div></td>
					</tr>
					<tr style="width:600px;">
						<td><div class="panel"> 
									<div id="progressGraph"
										style="width: 500px;height: 250px;">
									</div> 
							</div></td>
						<td><div class="panel"> 
										<div id="showTable"
											style="width: 500px;height: 250px;">
											<p style="text-align: center; font-size: 18px;">Data
												Table</p>
											<table id="showTable2" class="table">
												<thead>
													<tr>
														<th scope="col">#</th>
														<th scope="col">First</th>
														<th scope="col">Last</th>
														<th scope="col">Handle</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th scope="row">1</th>
														<td>Mark</td>
														<td>Otto</td>
														<td>@mdo</td>
													</tr>
													<tr>
														<th scope="row">2</th>
														<td>Jacob</td>
														<td>Thornton</td>
														<td>@fat</td>
													</tr>
													<tr>
														<th scope="row">3</th>
														<td>Larry</td>
														<td>the Bird</td>
														<td>@twitter</td>
													</tr>
													<tr>
														<th scope="row">4</th>
														<td>RE</td>
														<td>Thunder Bird</td>
														<td>@re</td>
													</tr>
												</tbody>
											</table>
										</div> 
							</div></td>
					</tr>

				</tbody>
			</table> -->
		</c:if>


	</div>

	<!-- page script work -->

	<script type="text/javascript">
		window.onload = function() {
			window.history.pushState(null, "", window.location.href);
			window.onpopstate = function() {
				window.history.pushState(null, "", window.location.href);
			};
		};
	</script>

	<script type="text/javascript">
		// binds form submission and fields to the validation engine
		$(".navbar-nav").children().removeClass("active");
	</script>

	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/highcharts-3d.js"></script>
	<script src="https://code.highcharts.com/modules/cylinder.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script>

	<script src="https://code.highcharts.com/modules/data.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			pieChart();
			barChart();
			progressGraph();
			showTable();
		});

		function pieChart() {
			Highcharts
					.chart(
							'pieChart',
							{
								chart : {
									type : 'pie',
									options3d : {
										enabled : true,
										alpha : 45,
										beta : 0
									}
								},
								title : {
									text : 'Orders Chart'
								},
								accessibility : {
									point : {
										valueSuffix : '%'
									}
								},
								tooltip : {
									pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
								},
								plotOptions : {
									pie : {
										allowPointSelect : true,
										cursor : 'pointer',
										depth : 35,
										dataLabels : {
											enabled : true,
											format : '{point.name}'
										}
									}
								},
								series : [ {
									type : 'pie',
									name : 'Order History',
									data : [ [ 'Order Delivered', 45.0 ],
											[ 'New Order Recieved', 26.8 ], {
												name : 'Pending Order',
												y : 12.8,
												sliced : true,
												selected : true
											}, [ 'About To Deliver', 8.5 ],
											[ 'Order with discount', 6.2 ], [ 'Others', 0.7 ] ]
								} ]
							});
		}

		function barChart() {

			Highcharts
					.chart(
							'barChart',
							{
								chart : {
									type : 'column',
									options3d : {
										enabled : true,
										alpha : 15,
										beta : 15,
										viewDistance : 25,
										depth : 40
									}
								},

								title : {
									text : 'Total Category '
								},

								xAxis : {
									categories : [ 'Fruit', 'Groceries',
											'General store', 'Chemist', 'SpareParts' ],
									labels : {
										skew3d : true,
										style : {
											fontSize : '16px'
										}
									}
								},

								yAxis : {
									allowDecimals : false,
									min : 0,
									title : {
										text : 'No of Categories',
										skew3d : true
									}
								},

								tooltip : {
									headerFormat : '<b>{point.key}</b><br>',
									pointFormat : '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y} / {point.stackTotal}'
								},

								plotOptions : {
									column : {
										stacking : 'normal',
										depth : 40
									}
								},

								series : [ {
									name : 'John',
									data : [ 5, 3, 4, 7, 2 ],
									stack : 'male'
								}, {
									name : 'Joe',
									data : [ 3, 4, 4, 2, 5 ],
									stack : 'male'
								}, {
									name : 'Jane',
									data : [ 2, 5, 6, 2, 1 ],
									stack : 'female'
								}, {
									name : 'Janet',
									data : [ 3, 0, 4, 4, 3 ],
									stack : 'female'
								} ]
							});

		}

		function progressGraph() {
			Highcharts.chart('progressGraph', {

				title : {
					text : 'Customer Orders Progress Graph'
				},

				subtitle : {
					text : 'Source: thesolarfoundation.com'
				},

				yAxis : {
					title : {
						text : 'Number of Customer'
					}
				},

				xAxis : {
					accessibility : {
						rangeDescription : 'Range: 2010 to 2017'
					}
				},

				legend : {
					layout : 'vertical',
					align : 'right',
					verticalAlign : 'middle'
				},

				plotOptions : {
					series : {
						label : {
							connectorAllowed : false
						},
						pointStart : 2010
					}
				},

				series : [
						{
							name : 'Premium Cutomer',
							data : [ 43934, 52503, 57177, 69658, 97031, 119931,
									137133, 154175 ]
						},
						{
							name : 'New Customer',
							data : [ 24916, 24064, 29742, 29851, 32490, 30282,
									38121, 40434 ]
						},
						{
							name : 'Referred ustomer',
							data : [ 11744, 17722, 16005, 19771, 20185, 24377,
									32147, 39387 ]
						},
						{
							name : 'Frequent Customer',
							data : [ null, null, 7988, 12169, 15112, 22452,
									34400, 34227 ]
						},
						{
							name : 'Other',
							data : [ 12908, 5948, 8105, 11248, 8989, 11816,
									18274, 18111 ]
						} ],

				responsive : {
					rules : [ {
						condition : {
							maxWidth : 500
						},
						chartOptions : {
							legend : {
								layout : 'horizontal',
								align : 'center',
								verticalAlign : 'bottom'
							}
						}
					} ]
				}

			});
		}

		function showTable() {
			Highcharts.chart('showTable', {
				data : {
					table : 'datatable'
				},
				chart : {
					type : 'column'
				},
				title : {
					text : 'Data extracted from a HTML table in the page'
				},
				yAxis : {
					allowDecimals : false,
					title : {
						text : 'Units'
					}
				},
				tooltip : {
					formatter : function() {
						return '<b>' + this.series.name + '</b><br/>'
								+ this.point.y + ' '
								+ this.point.name.toLowerCase();
					}
				}
			});
		}
	</script>
</body>
</html>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<%-- <script src="${contextPath}/resources/js/bootstrap.min.js"></script> --%>
<jsp:include page="footer.jsp" />
</body>
</html>
