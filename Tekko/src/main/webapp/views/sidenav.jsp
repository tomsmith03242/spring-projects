<nav class="blue-background custom-text">
<div class="container">
		<div class="container row" style="padding: 15px auto;">
		<a id="side-menu-toggle" style=""><i class="fa fa-bars"></i></a>
		<a id="brand-logo" href="/"><img src="resources/images/TekkoLogo-transperant.png" alt="Tekko"
				style="width: 130px;" /></a>
		<c:if test="${pageContext.request.userPrincipal.name != null}">
		<h5>
				Welcome ${userName} | <a
					onclick="document.forms['logoutForm'].submit()" style="color: red;">Logout</a>
			</h5>
			<form id="logoutForm" method="POST" action="${contextPath}/logout">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
		</c:if>
	</div>
			<div class="col-md-4 col-sm-3 col-xs-0"></div>
</div>
</nav>
<div></div>
