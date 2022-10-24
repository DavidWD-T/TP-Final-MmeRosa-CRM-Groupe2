<jsp:include page="head.jsp"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<body>
<header>
    <jsp:include page="header.jsp"/>
</header>


<div class="container-fluid">
    <div class="contacts-list rounded-4 p-3 mb-5"  style="max-width: 1500px; margin: auto">
        <div class="row">
            <h1>Evenement avec le ${client} ${evenement.prospectById.prenom} ${evenement.prospectById.nom} de l'entreprise ${evenement.prospectById.entrepriseById.nom}</h1>
            <div class="col-12 p-2">
                <div class="card text-center contact-row">
                    <div class="card-body text-center text-md-start">
                        <h5 class="card-title text-center text-uppercase mb-2"><Strong>Motif</Strong></h5>
                        <h5 class="card-title text-center mb-5" style="color: rgba(0,0,0,0.98)">${evenement.motif}</h5>

                        <h5 class="card-title text-center text-uppercase mb-2"><Strong>Telephone</Strong></h5>
                        <h5 class="card-title text-center mb-5" style="color: rgba(0,0,0,0.98)"><i class='fas fa-phone'></i> <a href="tel:${evenement.prospectById.portable}">${evenement.prospectById.portable}</a></h5>
                        <h5 class="card-title text-center mb-5" style="color: rgba(0,0,0,0.98)"><a href="tel:${evenement.prospectById.fixe}">${evenement.prospectById.fixe}</a></h5>

                        <h5 class="card-title text-center text-uppercase mb-2"><Strong>Email</Strong></h5>
                        <h5 class="card-title text-center mb-5" style="color: rgba(0,0,0,0.98)"><i class='far fa-envelope-open'></i> <a href="mailto:${evenement.prospectById.email}">${evenement.prospectById.email}</a></h5>

                        <h5 class="card-title text-center text-uppercase mb-2"><Strong>Adresse</Strong></h5>
                        <h5 class="card-title text-center mb-5" style="color: rgba(0,0,0,0.98)"><i class="fa fa-map-marker" aria-hidden="true"></i> <a id="map" href="#">${evenement.adresse}  ${evenement.codePostale} ${evenement.ville}</a></h5>

                        <div hidden>
                            <p id="adresse" class="card-text col-md-6 text-md-end"> ${evenement.adresse}</p>
                            <p id="cpltAdresse" class="card-text col-md-6"></p>
                            <p id="villeCp" class="card-text col-md-6 text-md-end">Ville / CP : ${evenement.ville} ${evenement.codePostale}</p>
                        </div>

                        <div class="d-md-flex flex-wrap justify-content-between px-4" style="margin: auto; width: 70%">
                            <div class="card-text col-md-4 ">
                                <h5 class="card-title text-center text-uppercase mb-2"><Strong>date de l'événement</Strong></h5>
                                <h5 class="card-title text-center mb-5" style="color: rgba(0,0,0,0.98)">${evenement.date}</h5>
                            </div>
                            <div class="card-text col-md-4 ">
                                <h5 class="card-title text-center text-uppercase mb-2"><Strong>heure du début </Strong></h5>
                                <h5 class="card-title text-center mb-5" style="color: rgba(0,0,0,0.98)">${evenement.heureDebut}</h5>
                            </div>
                            <div class="card-text col-md-4">
                                <h5 class="card-title text-center text-uppercase mb-2"><Strong>heure de fin </Strong></h5>
                                <h5 class="card-title text-center mb-5" style="color: rgba(0,0,0,0.98)">${evenement.heureFin}</h5>
                            </div>
                        </div>

                        <div class="text-center mt-3">
                            <a href="${pageContext.request.contextPath}/evenements/Update/${evenement.id}" class="btn btn-primary"><i class="fa fa-trash-o fa-lg"></i> Modifier l'événement</a>
                            <!-- MODAL DELETE CONFIRMATION -->
                            <button type="button" class="btn btn-danger m-1" data-bs-toggle="modal" data-bs-target="#delete_modal"><i class="fa fa-trash-o fa-lg"></i> Supprimer l'événement</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<!-- Modal de suppression de l'événement-->
<div class="modal fade" id="delete_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="prospectDeleteModal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="prospectDeleteModal">Confirmation de suppression</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Voulez vous vraiment supprimer l'événement ?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Non</button>
                <form method="post" action="${pageContext.request.contextPath}/evenements/delete/${evenement.id}">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <button type="submit" class="btn btn-danger">Oui</button>
                </form>
            </div>
        </div>
    </div>
</div>


</body>
</html>