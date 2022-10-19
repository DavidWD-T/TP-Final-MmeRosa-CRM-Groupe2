<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="fr">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Liste Entreprises</title>
</head>
<body>
<header>
    <jsp:include page="header.jsp"/>
</header>


<div class="container">
    <div class="row justify-content-center">
        <h1>Liste Entreprise</h1><a href="${pageContext.request.contextPath}/entreprises/Create" class="btn btn-primary">Create</a>

        <form class="d-flex" role="search" method="get">
            <input name="name" id="name" class="form-control me-2" type="search" placeholder="Search" aria-label="Search" action="${pageContext.request.contextPath}/entreprises/all" value="${name}">
            <button class="btn btn-outline-success" type="submit">Search</button>
        </form>

        <c:forEach items="${entreprises}" var="entreprise">
            <div class="card text-center col-3 p-0 m-1">
                <img src="${entreprise.logo}" class="card-img-top w-100" alt="${entreprise.nom}${entreprise.id}" >
                <div class="card-body">
                    <h5 class="card-title">${entreprise.nom}</h5>
                    <p class="card-text">Site Web : ${entreprise.siteWeb}</p>
                    <p class="card-text">Telephone : ${entreprise.telephone}</p>
                    <p class="card-text">Email : ${entreprise.email}</p>
                    <a href="${pageContext.request.contextPath}/entreprises/details/${entreprise.id}" class="btn btn-primary">View Entreprise</a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>