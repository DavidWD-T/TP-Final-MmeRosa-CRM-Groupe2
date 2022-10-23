<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"/>
<body>
<header>
    <jsp:include page="header.jsp"/>
</header>


<div class="container-fluid">

    <div class="contacts-list rounded-4 p-3 mb-2"  style="max-width: 1500px; margin: auto">
        <form class="d-flex search_bar" role="search" method="get">
            <input name="name" id="name" class="form-control me-2" type="search" placeholder="&#x1F50D; Search" aria-label="&#x1F50D; Search" action="${pageContext.request.contextPath}/listUsers" value="${name}">
        </form>
    </div>

    <div class="contacts-list rounded-4 p-3" style="max-width: 1500px; margin: auto">
        <div style="height: 78vh;">
            <div class="row">
                <c:forEach items="${listUsers}" var="user">
                    <div class="col-6 col-lg-3 p-2">
                        <div class="card text-center contact-row" >
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
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

</body>
</html>