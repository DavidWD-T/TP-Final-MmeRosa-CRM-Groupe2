<jsp:include page="head.jsp"/>
<body>
<header>
    <jsp:include page="header.jsp"/>
</header>
<div class="container text-center">
    <div>
        <h1>User Registration - Sign In</h1>
    </div>
    <form action="${pageContext.request.contextPath}/signin" method="post" style="max-width: 600px; margin: 0 auto;">
        <div class="m-3">
            <div class="form-group row">
                <label class="col-4 col-form-label" for="email">E-mail: </label>
                <div class="col-8">
                    <input type="email" name="email" id="email" class="form-control" required />
                </div>
            </div>

            <div class="form-group row">
                <label class="col-4 col-form-label" for="password">Password: </label>
                <div class="col-8">
                    <input type="password" name="password"  id="password"  class="form-control" />
                </div>
            </div>

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <div>
                <button type="submit" class="btn btn-primary">Sign In</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>