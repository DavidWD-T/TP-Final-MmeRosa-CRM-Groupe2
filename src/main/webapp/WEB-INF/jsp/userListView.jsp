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
    <title>Liste User</title>
</head>
<body>
<header>
    <jsp:include page="header.jsp"/>
</header>


<div class="container">
    <div class="row justify-content-center">

        <form class="d-flex" role="search" method="get">
            <input name="name" id="name" class="form-control me-2" type="search" placeholder="Search" aria-label="Search" action="${pageContext.request.contextPath}/listUsers" value="${name}">
            <button class="btn btn-outline-success" type="submit">Search</button>
        </form>

        <c:forEach items="${listUsers}" var="user">
            <div class="card text-center col-3 p-0 m-1">
                <img src="${user.photoUrl}" class="card-img-top w-100" alt="${user.nom}${user.id}" >
                <div class="card-body">
                    <h5 class="card-title">${user.email}</h5>
                    <p class="card-text">Nom : ${user.nom}</p>
                    <p class="card-text">Prenom : ${user.prenom}</p>
                    <!-- MODAL DELETE CONFIRMATION -->
                    <div class="modal fade" id="delete_modal_${user.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="staticBackdropLabel">Confirmation</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    Voulez vous vraiment supprimer cet utilisateur et toutes ses données ?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Non</button>
                                    <form method="post" action="${pageContext.request.contextPath}/users/delete/${user.id}">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <button type="submit" class="btn btn-danger">Oui</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#delete_modal_${user.id}">Delete User</button>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>