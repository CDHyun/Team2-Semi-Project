<head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>

<nav class="navbar navbar-light" style="background-color: #e3f2fd;">
	<div class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a href="index.do"><img alt=""
				src="https://play-lh.googleusercontent.com/10RJI8Gb86U7d14fwtWpINZEXqRJLv7pldQIojv8u-PD5qwl-EKrHq8yvEJuwX1f8g"
				width="100"></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" href="index.do">Home</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">Brand</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li>
								<hr class="dropdown-divider">
							</li>
							<li><a class="dropdown-item" href="#">Something else here</a></li>
						</ul></li>
					<c:if test="${empty sessionScope.SUID}">
						<li><a class="nav-link" href="login_form.jsp">Login</a></li>
					</c:if>
					<c:if test="${not empty sessionScope.SUID}">
						<li><a class="nav-link" href="#">My Page</a></li>
						<li><a class="nav-link" href="logOut.do">LogOut</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>

	<div>
		<ul class="nav">

		</ul>
	</div>
</nav>
