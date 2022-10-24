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
            <h1>Entreprise</h1>
            <div class="col-12 p-2">
                <div class="card text-center contact-row">
                    <img src="${entreprise.logo}" class="card-img-top text-uppercase rounded-circle mt-2" style="width: 200px; height: 200px; margin: auto" alt="${entreprise.nom}">
                    <div class="card-body text-center text-md-start">
                        <h5 class="card-title text-center text-uppercase mb-4"><strong>${entreprise.nom}</strong></h5>
                        <div class="d-md-flex flex-wrap justify-content-between px-4">
                            <p id="website" class="card-text"> Site Web : <a href="${entreprise.siteWeb}">${entreprise.siteWeb}</a></p>
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
                            <button id="map" class="btn btn-success m-1"><i class="fa fa-map-marker" aria-hidden="true"></i> Localiser Entreprise</button>
                            <a href="${pageContext.request.contextPath}/entreprises/Update/${entreprise.id}" class="btn btn-primary"><i class="fa fa-pencil fa-fw"></i> Update Entreprise</a>
                            <!-- MODAL DELETE CONFIRMATION -->
                            <button type="button" class="btn btn-danger m-1" data-bs-toggle="modal" data-bs-target="#delete_modal_${entreprise.id}"><i class="fa fa-trash-o fa-lg"></i> Delete Entreprise</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="contacts-list rounded-4 p-3 mb-5" style="max-width: 1500px; margin: auto">
        <div class="row">
            <div class="col-lg-12">
                <div class="table-responsive" style="min-height: 310px;">
                    <h2><strong>Prospects</strong></h2>
                    <table class="table project-list-table table-nowrap align-middle table-borderless">
                        <thead class="thead">
                        <tr class="table-header">
                            <th scope="col" style="width: 20%">Nom</th>
                            <th scope="col" style="width: 17%">Entreprise</th>
                            <th scope="col" style="width: 15%;">Statut</th>
                            <th class="d-none d-lg-table-cell" scope="col" style="width: 25%;">Email</th>
                            <th class="d-none d-lg-table-cell" scope="col" style="width: 19%">téléphone</th>
                            <th scope="col" style="width: 200px;">. . .</th>
                        </tr>
                        </thead>
                        <tbody class="tbody">
                        <c:forEach items="${prospects}" var="prospect">
                            <tr class="contact-row">
                                <td>${prospect.prenom} ${prospect.nom}</td>
                                <td>${prospect.entrepriseById.nom}</td>
                                <td>${prospect.etatProspection}</td>
                                <td class="d-none d-lg-table-cell">${prospect.email}</td>
                                <td class="d-none d-lg-table-cell">${prospect.portable}</td>
                                <td>
                                    <ul class="list-inline mb-0">
                                        <li class="nav-item dropdown">
                                            <a class="nav-link dropdown-toggle btn btn-outline-secondary plus-button" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"></a>
                                            <ul class="dropdown-menu" style=" background-color: #f9f9f9">
                                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/prospects/details/${prospect.id}"><i class='far fa-address-card'></i> details</a></li>
                                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/evenements/Create/${prospect.id}"><i class="fa fa-calendar" aria-hidden="true"></i> événement</a></li>
                                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/prospects/Update/${prospect.id}"><i class="fa fa-pencil fa-fw"></i> modifier</a></li>
                                                <li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#dropdown" href="#"><i class="fa fa-trash-o fa-lg"></i> supprimer</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </td>
                            </tr>

                            <!--modal suppression prospect-->
                            <div class="modal fade" id="dropdown" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel_1" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="staticBackdropLabel_1">Confirmation de suppression</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            Vouslez-vous vraiment supprimer le prospect ?
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Non</button>
                                            <form method="post" action="${pageContext.request.contextPath}/prospects/delete/${prospect.id}">
                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                <button type="submit" class="btn btn-danger">Oui</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="contacts-list rounded-4 p-3" style="max-width: 1500px; margin: auto">
        <div class="row">
            <div class="col-lg-12">
                <div class="table-responsive" style="min-height: 310px;">
                    <h2><strong>Clients</strong></h2>
                    <table class="table project-list-table table-nowrap align-middle table-borderless">
                        <thead class="thead">
                        <tr class="table-header">
                            <th scope="col" style="width: 20%">Nom</th>
                            <th scope="col" style="width: 17%">Entreprise</th>
                            <th scope="col" style="width: 15%;">Statut</th>
                            <th scope="col" style="width: 25%;">Email</th>
                            <th scope="col" style="width: 19%">téléphone</th>
                            <th scope="col" style="width: 200px;">. . .</th>
                        </tr>
                        </thead>
                        <tbody class="tbody">
                        <c:forEach items="${clients}" var="client">
                            <tr class="contact-row">
                                <td>${client.prenom} ${client.nom}</td>
                                <td>${client.entrepriseById.nom}</td>
                                <td>${client.etatProspection}</td>
                                <td>${client.email}</td>
                                <td>${client.portable}</td>
                                <td>
                                    <ul class="list-inline mb-0">
                                        <li class="nav-item dropdown">
                                            <a class="nav-link dropdown-toggle btn btn-outline-secondary plus-button" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"></a>
                                            <ul class="dropdown-menu" style=" background-color: #f9f9f9">
                                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/clients/details/${client.id}"><i class='far fa-address-card'></i> détails</a></li>
                                                <li><a class="dropdown-item"  href="${pageContext.request.contextPath}/evenements/Create/${client.id}"><i class="fa fa-calendar" aria-hidden="true"></i> événement</a></li>
                                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/clients/Update/${client.id}"><i class="fa fa-pencil fa-fw"></i> modifier</a></li>
                                                <li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#dropdown_3" href="#"><i class="fa fa-trash-o fa-lg"></i> supprimer</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </td>
                            </tr>

                            <!--modal suppression client-->
                            <div class="modal fade" id="dropdown_3" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel_2" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="staticBackdropLabel_2">Confirmation de suppression</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            Vouslez-vous vraiment supprimer le client ?
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Non</button>
                                            <form method="post" action="${pageContext.request.contextPath}/clients/delete/${client.id}">
                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                <button type="submit" class="btn btn-danger">Oui</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>