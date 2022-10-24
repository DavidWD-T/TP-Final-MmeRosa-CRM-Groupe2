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
            <h1>Prospect</h1>
            <div class="col-12 p-2">
                <div class="card text-center contact-row">
                    <img src="${prospect.photoUrl}" class="card-img-top text-uppercase rounded-circle mt-2" style="width: 200px; height: 200px; margin: auto" alt="photo du prospect ${prospect.nom} ${prospect.prenom}">
                    <div class="card-body text-center text-md-start">
                        <h5 class="card-title text-center text-uppercase mb-4"><strong>${prospect.nom} ${prospect.prenom}</strong></h5>
                        <div class="d-md-flex flex-wrap justify-content-between px-4">
                            <p class="card-text col-md-6">Portable : <a href="tel:${prospect.portable}">${prospect.portable}</a></p>
                            <p class="card-text col-md-6 ">Fixe : <a href="tel:${prospect.fixe}">${prospect.fixe}</a></p>
                            <p class="card-text col-md-6 ">Email : <a href="mailto:${prospect.email}">${prospect.email}</a></p>
                            <p class="card-text col-md-6 ">Fonction : ${prospect.fonction}</p>
                            <p class="card-text col-md-6 ">Etat prospection : ${prospect.etatProspection}</p>
                            <p class="card-text col-md-6 ">Date de creation : ${prospect.dateCreationProspection}</p>
                            <p class="card-text col-md-6">Durée relance : ${prospect.dureeRelance}</p>
                        </div>
                        <div class="modal fade" id="delete_modal_${prospect.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="prospectDeleteModal" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="prospectDeleteModal">Confirmation</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Voulez vous vraiment supprimer ce prospect ?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Non</button>
                                        <form method="post" action="${pageContext.request.contextPath}/prospects/delete/${prospect.id}">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                            <button type="submit" class="btn btn-danger">Oui</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="text-center">
                            <a href="${pageContext.request.contextPath}/prospects/Update/${prospect.id}" class="btn btn-primary"><i class="fa fa-pencil fa-fw"></i> Update Prospect</a>
                            <!-- MODAL DELETE CONFIRMATION -->
                            <button type="button" class="btn btn-danger m-1" data-bs-toggle="modal" data-bs-target="#delete_modal_${prospect.id}"><i class="fa fa-trash-o fa-lg"></i> Delete Prospect</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>