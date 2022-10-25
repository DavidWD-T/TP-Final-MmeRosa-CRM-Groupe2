<jsp:include page="head.jsp"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<body>
<header>
    <jsp:include page="header.jsp"/>
</header>

<div class="container-fluid">
    <div class="contacts-list rounded-4 p-3 mb-5"  style="max-width: 1500px; margin: auto">
        <div class="row">
            <div class="col-12 col-lg-8 p-2 pt-0">
                <h1>Prospect</h1>
                <div class="card text-center contact-row">
                    <img src="${prospect.photoUrl}" class="card-img-top text-uppercase rounded-circle mt-2" style="width: 200px; height: 200px; margin: auto" alt="photo du prospect ${prospect.nom} ${prospect.prenom}">
                    <div class="card-body text-center text-md-start">
                        <h5 class="card-title text-center text-uppercase mb-4"><strong>${prospect.nom} ${prospect.prenom}</strong></h5>
                        <div class="d-md-flex flex-wrap justify-content-between px-4">
                            <p class="card-text col-md-6 ">Entreprise : ${prospect.entrepriseById.nom}</p>
                            <p class="card-text col-md-6 ">Fonction : ${prospect.fonction}</p>
                            <p class="card-text col-md-6 ">Portable : <a href="tel:${prospect.portable}">${prospect.portable}</a></p>
                            <p class="card-text col-md-6 ">Fixe : <a href="tel:${prospect.fixe}">${prospect.fixe}</a></p>
                            <p class="card-text col-md-6 ">Email : <a href="mailto:${prospect.email}">${prospect.email}</a></p>
                            <p class="card-text col-md-6 ">Etat prospection : ${prospect.etatProspection}</p>
                            <p class="card-text col-md-6 ">Date de creation : ${prospect.dateCreationProspection}</p>
                            <p class="card-text col-md-6 ">Durée relance : ${prospect.dureeRelance}</p>
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
                        <div class="modal fade" id="createNote_modal_${prospect.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="noteCreateModal" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="noteCreateModal">Confirmation Create</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <form method="post" action="${pageContext.request.contextPath}/notes/Create/${prospect.id}">
                                        <div class="modal-body">
                                            <textarea name="text" id="text2" cols="50" rows="5"></textarea>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Non</button>
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                            <button type="submit" class="btn btn-success">Oui</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="createNote2_modal_${prospect.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="noteCreate2Modal" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="noteCreate2Modal">Confirmation Create</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <form method="post" action="${pageContext.request.contextPath}/notes/Create2/${prospect.id}">
                                        <div class="modal-body">
                                            <textarea name="text" id="text3" cols="50" rows="5"></textarea>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Non</button>
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                            <button type="submit" class="btn btn-success">Oui</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="client_modal_${prospect.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="prospectClientModal" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="prospectClientModal">Confirmation</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Voulez vous vraiment transformer ce prospect en client ?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Non</button>
                                        <form method="post" action="${pageContext.request.contextPath}/prospects/UpdateClient/${prospect.id}">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                            <button type="submit" class="btn btn-success">Oui</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="text-center">
                            <a href="${pageContext.request.contextPath}/prospects/Update/${prospect.id}" class="btn btn-primary m-1"><i class="fa fa-pencil fa-fw"></i> modifier le prospect</a>
                            <!-- MODAL CLIENT CONFIRMATION -->
                            <button type="button" class="btn btn-success m-1" data-bs-toggle="modal" data-bs-target="#client_modal_${prospect.id}"><i class="fa fa-pencil fa-fw"></i> Transformation en Client</button>
                            <!-- MODAL DELETE CONFIRMATION -->
                            <button type="button" class="btn btn-danger m-1" data-bs-toggle="modal" data-bs-target="#delete_modal_${prospect.id}"><i class="fa fa-trash-o fa-lg"></i> Modifier le prospect</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-lg-4 p-2 pt-0">
                <div class="d-flex" style="margin: auto; width: max-content">
                    <!-- MODAL CLIENT CONFIRMATION -->
                    <button type="button" class="btn btn-primary m-1" data-bs-toggle="modal" data-bs-target="#createNote_modal_${prospect.id}"><i class='far fa-edit'></i> créer une note</button>
                    <button type="button" class="btn btn-primary m-1" data-bs-toggle="modal" data-bs-target="#createNote2_modal_${prospect.id}"><i class='far fa-edit'></i> A relancer</button>
                </div>
                <h1 style="font-size: 20px; width: max-content; margin: auto; margin-top: 20px">Notes</h1>

                <hr class="hr" style="width: 45%; margin: auto; margin-bottom: 10px;"/>

                <div style="max-height: 600px;overflow-y:auto;">
                    <c:forEach items="${notes}" var="note">
                        <%--                    <div class="col-6 col-lg-3 p-2">--%>
                        <div class="card text-center contact-row mb-2">
                            <div class="card-body">
                                <h5 class="card-title text-uppercase mb-3"><strong>${note.prospectEntrepriseNom}</strong></h5>
                                <p class="card-text">Date : ${note.date} ${note.heure}</p>
                                <p class="card-text">Texte : ${note.texte}</p>
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#updateNote_modal_${note.id}"><i class="fa fa-pencil fa-fw"></i> modifier la note</button>
                                <button type="button" class="btn btn-danger m-1" data-bs-toggle="modal" data-bs-target="#deleteNote_modal_${note.id}"><i class="fa fa-trash-o fa-lg"></i> supprimer la note</button>
                            </div>
                        </div>
                        <%--                    </div>--%>
                        <div class="modal fade" id="deleteNote_modal_${note.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="noteDeleteModal" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="noteDeleteModal">Confirmation</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Voulez vous vraiment supprimer cette note ?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Non</button>
                                        <form method="post" action="${pageContext.request.contextPath}/notes/delete/${note.id}">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                            <button type="submit" class="btn btn-danger">Oui</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="updateNote_modal_${note.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="noteUpdateModal" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="noteUpdateModal">Confirmation Update</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <form method="post" action="${pageContext.request.contextPath}/notes/Update/${note.id}">
                                        <div class="modal-body">
                                            <textarea name="text" id="text" cols="50" rows="5">${note.texte}</textarea>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Non</button>
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                            <button type="submit" class="btn btn-success">Oui</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>