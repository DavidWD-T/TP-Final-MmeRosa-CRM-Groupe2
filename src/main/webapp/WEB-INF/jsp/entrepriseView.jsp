<jsp:include page="head.jsp"/>
<body>
<header>
    <jsp:include page="header.jsp"/>
</header>

<div class="container">
    <div class="row justify-content-center">
        <h1>Entreprise</h1>
        <div class="card col-12 col-md-10 col-lg-8 p-0 m-4 d-flex">
            <img src="${entreprise.logo}" class="card-img-top w-100" alt="${entreprise.nom}">

            <div class="card-body text-center text-md-start">
                <h5 class="card-title text-center text-uppercase">${entreprise.nom}</h5>
                <div class="d-md-flex flex-wrap justify-content-between px-4">
                <p id="website" class="card-text">Site Web : <a href="${entreprise.siteWeb}">${entreprise.siteWeb}</a></p>
                <p class="card-text col-md-6 text-md-end">Telephone : <a href="tel:${entreprise.telephone}">${entreprise.telephone}</a></p>
                <p class="card-text col-md-6 ">Email : <a href="mailto:${entreprise.email}">${entreprise.email}</a></p>
                <p class="card-text col-md-6 text-md-end">Secteur d'activite : ${entreprise.secteurActivite}</p>
                <p class="card-text col-md-6">Siret : ${entreprise.siret}</p>
                <p id="adresse" class="card-text col-md-6 text-md-end">Adresse : ${entreprise.adresse}</p>
                <p id="cpltAdresse" class="card-text col-md-6">Complement Adresse : ${entreprise.complementAdresse}</p>
                <p id="villeCp" class="card-text col-md-6 text-md-end">Ville / CP : ${entreprise.ville} ${entreprise.codePostale}</p>
                </div>
                <div class="modal fade" id="delete_modal_${entreprise.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="staticBackdropLabel">Confirmation</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Voulez vous vraiment supprimer cette entreprise et ses clients/prospects ?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Non</button>
                                <form method="post" action="${pageContext.request.contextPath}/entreprises/delete/${entreprise.id}">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <button type="submit" class="btn btn-danger">Oui</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-center">
                <button id="map" class="btn btn-success m-1">Localiser Entreprise</button>
                <a href="${pageContext.request.contextPath}/entreprises/Update/${entreprise.id}" class="btn btn-primary">Update Entreprise</a>
                <!-- MODAL DELETE CONFIRMATION -->
                <button type="button" class="btn btn-danger m-1" data-bs-toggle="modal" data-bs-target="#delete_modal_${entreprise.id}">Delete Entreprise</button>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>