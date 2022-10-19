<!DOCTYPE html>
<html lang="fr">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign IN</title>
</head>
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