<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Tekko</title>
<link rel="icon" href="resources/images/Tekko Logo204.jpg" type="image/png" />

<!-- Bootstrap -->
<link href="resources/css/bootstrap.css" rel="stylesheet">
<!-- Custom Theme Style -->
<link href="resources/build/css/custom.min.css" rel="stylesheet">
<!-- Font Awesome -->
<!-- <link rel="stylesheet"
	href="resources/vendors/fontawesome-5.8.2/css/all.min.css"> -->
<style type="text/css">
html {
	font-family: sans-serif;
	line-height: 1.15;
	-ms-text-size-adjust: 100%;
	-webkit-text-size-adjust: 100%
}

body {
	margin: 0
}

article, aside, footer, header, nav, section {
	display: block
}

h1 {
	font-size: 2em;
	margin: .67em 0
}

figcaption, figure, main {
	display: block
}

figure {
	margin: 1em 40px
}

hr {
	box-sizing: content-box;
	height: 0;
	overflow: visible
}

pre {
	font-family: monospace, monospace;
	font-size: 1em
}

a {
	background-color: transparent;
	-webkit-text-decoration-skip: objects
}

a:active, a:hover {
	outline-width: 0
}

abbr[title] {
	border-bottom: none;
	text-decoration: underline;
	text-decoration: underline dotted
}

b, strong {
	font-weight: inherit
}

b, strong {
	font-weight: bolder
}

code, kbd, samp {
	font-family: monospace, monospace;
	font-size: 1em
}

dfn {
	font-style: italic
}

mark {
	background-color: #ff0;
	color: #000
}

small {
	font-size: 80%
}

sub, sup {
	font-size: 75%;
	line-height: 0;
	position: relative;
	vertical-align: baseline
}

sub {
	bottom: -.25em
}

sup {
	top: -.5em
}

audio, video {
	display: inline-block
}

audio




:not


 


(
[
controls
]


 


){
display




:


 


none




;
height




:


 


0
}
img {
	border-style: none
}

svg




:not


 


(
:root


 


){
overflow




:


 


hidden






}
button, input, optgroup, select, textarea {
	font-family: sans-serif;
	font-size: 100%;
	line-height: 1.15;
	margin: 0
}

button, input {
	overflow: visible
}

button, select {
	text-transform: none
}

[type=reset], [type=submit], button, html [type=button] {
	-webkit-appearance: button
}

[type=button]::-moz-focus-inner, [type=reset]::-moz-focus-inner, [type=submit]::-moz-focus-inner,
	button::-moz-focus-inner {
	border-style: none;
	padding: 0
}

[type=button]:-moz-focusring, [type=reset]:-moz-focusring, [type=submit]:-moz-focusring,
	button:-moz-focusring {
	outline: 1px dotted ButtonText
}

fieldset {
	border: 1px solid silver;
	margin: 0 2px;
	padding: .35em .625em .75em
}

legend {
	box-sizing: border-box;
	color: inherit;
	display: table;
	max-width: 100%;
	padding: 0;
	white-space: normal
}

progress {
	display: inline-block;
	vertical-align: baseline
}

textarea {
	overflow: auto
}

[type=checkbox], [type=radio] {
	box-sizing: border-box;
	padding: 0
}

[type=number]::-webkit-inner-spin-button, [type=number]::-webkit-outer-spin-button
	{
	height: auto
}

[type=search] {
	-webkit-appearance: textfield;
	outline-offset: -2px
}

[type=search]::-webkit-search-cancel-button, [type=search]::-webkit-search-decoration
	{
	-webkit-appearance: none
}

::-webkit-file-upload-button {
	-webkit-appearance: button;
	font: inherit
}

details, menu {
	display: block
}

summary {
	display: list-item
}

canvas {
	display: inline-block
}

template {
	display: none
}

[hidden] {
	display: none
}
/*! Simple HttpErrorPages | MIT X11 License | https://github.com/AndiDittrich/HttpErrorPages */
body, html {
	width: 100%;
	height: 100%;
	background-color: #21232a
}

body {
	color: #fff;
	text-align: center;
	text-shadow: 0 2px 4px rgba(0, 0, 0, .5);
	padding: 0;
	min-height: 100%;
	-webkit-box-shadow: inset 0 0 75pt rgba(0, 0, 0, .8);
	box-shadow: inset 0 0 75pt rgba(0, 0, 0, .8);
	display: table;
	font-family: "Open Sans", Arial, sans-serif
}

h1 {
	font-family: inherit;
	font-weight: 500;
	line-height: 1.1;
	color: inherit;
	font-size: 36px
}

h1 small {
	font-size: 68%;
	font-weight: 400;
	line-height: 1;
	color: #777
}

a {
	text-decoration: none;
	color: #fff;
	font-size: inherit;
	border-bottom: dotted 1px #707070
}

.lead {
	color: silver;
	font-size: 21px;
	line-height: 1.4
}

.cover {
	display: table-cell;
	vertical-align: middle;
	padding: 0 20px
}

footer {
	position: fixed;
	width: 100%;
	height: 40px;
	left: 0;
	bottom: 0;
	color: #a0a0a0;
	font-size: 14px
}
</style>
<style>
a {
	text-decoration: none;
	color: deepskyblue;
	font-size: inherit;
	border-bottom: none;
}

a:hover, a:focus {
	color: greenyellow;
}
</style>
</head>
<body
	style="background-repeat: no-repeat; background-size: cover; background-color: smoky;">
	<div class="container">
	<%-- --- userIsEnabled : ${userIsEnabled} --%>
	<%--  sk ---- : ${userIsEnabled}
	<c:if test="${userIsEnabled='false'}">
		<h4 style="color: darkorange;">sk error</h4>
					<br />
				</c:if> --%>
	<%-- <c:if test="${userIsEnabled='true'}">
		<h4 style="color: darkorange;">sk no error</h4>
					<br />
				</c:if>				
	 --%>
		<div class="container" style="margin: 30px auto; padding: 15px auto;">
			<a href="#"><img src="resources/images/loggo.png" alt="Tekko"
				style="height: 50%; width: 20%;" /></a><br /> <br />

			<div class="col-md-4 col-sm-3 col-xs-0"></div>
			<div class="col-md-4 col-sm-6 col-xs-12">
				<!-- 	<h3>Tekko</h3> -->
				<br />
				<h4>Sign In</h4>
				<c:if test="false">
					<h4 style="color: darkorange;"></h4>
					<br />
				</c:if>
				<div class="col-md-1 col-sm-0 col-xs-0"></div>
				<div class="col-md-10 col-sm-10 col-xs-10">

					
						<div style="border: 1px solid #fff; padding: 15px;">
						<form name="securitylogin" method="post"
						action="${contextPath}/login" class="form-signin">
							<div text-align:
								center;" class="form-group ${error != null ? 'has-error' : ''}">
								<span>${message}</span>
								<div class="col-md-12 col-sm-12 col-xs-12">
									<h5 style="float: left;">Username</h5>
								</div>
								<div class="col-md-12 col-sm-12 col-xs-12">
									<input type="text" class="form-control" id="username"
										name="username" placeholder="Username" required
										autofocus="true" />
								</div>


								<div class="form-group">
									<div class="col-md-12 col-sm-12 col-xs-12">
										<h5 style="float: left;">Password</h5>
										 </div>
									<div class="col-md-12 col-sm-12 col-xs-12">
										<input type="password" class="form-control" id="password"
											name="password" placeholder="Password" required />
									</div>
								</div>

							</div>
							<div class="form-group" style="text-align: center;">
								<div class="col-md-12 col-sm-12 col-xs-12">
									<h5 style="float: left;"></h5>
								</div>
								<span>${credentialError}
								</span> <input type="hidden"	name="${_csrf.parameterName}" value="${_csrf.token}" />

								<div class="col-md-12 col-sm-12 col-xs-12">
									<input style="width: 100%; background: #46f6ff; color: #fff;"
										class="btn" type="submit" value="Sign In" />
								</div> 
							</div>
							
								</form>
						</div>
						<div class="clearfix"></div>

				



				</div>
				<div class="col-md-1 col-sm-0 col-xs-0"></div>
			</div>
			<div class="col-md-4 col-sm-3 col-xs-0"></div>
		</div>
	</div>
	<div class="footer">
		<div class="container">
			<p class="text-muted" style="font-size: 15px;">&copy; 2020
				PranavaEET. All Rights Reserved</p>
		</div>
	</div>

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
</body>
</html>


