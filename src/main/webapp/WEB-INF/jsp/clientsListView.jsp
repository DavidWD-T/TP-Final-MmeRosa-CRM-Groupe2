<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:import url="head.jsp"/>
<body style="height: 100vh;" class="p-0 d-flex flex-column">

<c:import url="header.jsp"/>

<div class="container-fluid">

    <div class="contacts-list rounded-4 p-3 mb-4"  style="max-width: 1500px; margin: auto">
        <form class="d-flex search_bar" role="search" method="get">
            <input name="name" id="name" class="form-control me-2" type="search" placeholder="&#x1F50D; Search" aria-label="&#x1F50D; Search" action="${pageContext.request.contextPath}/clients/all" value="${name}">

            <select name="etat" id="etat" class="form-control me-2" onchange="this.form.submit()">
                <option <c:if test="${etat == ''}">selected</c:if> value="">Tout Etat</option>
                <option <c:if test="${etat == 'À contacter'}">selected</c:if> value="À contacter">À contacter</option>
            </select>

            <button name="order" id="order1" type="submit" class="btn btn-outline-secondary me-2" action="${pageContext.request.contextPath}/clients/all" value="">&darr;AZ</button>
            <button name="order" id="order2" type="submit" class="btn btn-outline-secondary me-2" action="${pageContext.request.contextPath}/clients/all" value="2">&uarr;AZ</button>

            <button name="order" id="order3" type="submit" class="btn btn-outline-secondary me-2" action="${pageContext.request.contextPath}/clients/all" value="3">&darr;Date</button>
            <button name="order" id="order4" type="submit" class="btn btn-outline-secondary" action="${pageContext.request.contextPath}/clients/all" value="4">&uarr;Date</button>
        </form>
    </div>

    <div class="contacts-list rounded-4 p-3" style="max-width: 1500px; margin: auto">
        <div style="height: 78vh;">
            <div class="row align-items-center mb-4">
                <div class="col-6" style="height: max-content">
                    <h2><strong>Clients</strong></h2>
                </div>
                <div class="col-6">
                    <div class="d-flex flex-wrap align-items-center justify-content-end gap-2">
                        <a href="${pageContext.request.contextPath}/clients/Create"  class="btn btn-outline-success">Ajouter client <i class="bx bx-plus"></i></a>
                    </div>
                </div>
            </div>

            <div class="divider py-1" style="border-radius: 80%; background-color: rgba(188,200,255,0.98)"></div>

            <div class="row">
                <div class="col-lg-12">
                    <div class="table-responsive" style="min-height: 300px;">
                        <table class="table project-list-table table-nowrap align-middle table-borderless">
                            <thead class="thead">
                            <tr class="table-header">
                                <th scope="col" style="width: 25%">Nom</th>
                                <th scope="col" style="width: 17%">Entreprise</th>
                                <th scope="col" style="width: 15%;">Statut</th>
                                <th class="d-none d-lg-table-cell" scope="col" style="width: 20%;">Email</th>
                                <th class="d-none d-lg-table-cell" scope="col" style="width: 19%">téléphone</th>
                                <th scope="col" style="width: 200px;">. . .</th>
                            </tr>
                            </thead>

                            <tbody class="tbody">

                                <c:forEach items="${clients}" var="client">
                                    <tr class="contact-row">
                                        <td><a href="${pageContext.request.contextPath}/clients/details/${client.id}"><img src="${client.photoUrl}" class="rounded-circle" style="width: 50px; height: 50px;"></a>
                                            <strong>${client.nom} ${client.prenom}</strong></td>
                                        <td><a href="${pageContext.request.contextPath}/entreprises/details/${client.entrepriseById.id}"><span class="badge badge-soft-primary mb-0" style=" color: #57c9eb !important; background-color: rgba(87,201,235,.1); font-size: 16px"><strong>${client.entrepriseById.nom}</strong></span></a></td>
                                        <td><span class="badge badge-soft-primary mb-0" style=" color: #f56e6e !important; background-color: rgba(245,110,110,.1);">${client.etatProspection}</span></td>
                                        <td><a href="mailto:${client.email}"><span class="badge badge-soft-primary mb-0" style=" color: #3b76e1 !important; background-color: rgba(59,118,225,.1); font-size: 16px">${client.email}</span></a></td>
                                        <td><a href="tel:${client.portable}"><span class="badge badge-soft-success mb-0" style="  color: #63ad6f !important; background-color: rgba(99,173,111,.1); font-size: 16px">${client.portable}</span></a></td>
                                        <td>
                                            <ul class="list-inline mb-0">
                                                <li class="nav-item dropdown">
                                                    <a class="nav-link dropdown-toggle btn btn-outline-secondary plus-button" href="#" id="dropdownMenuButton1" role="button" data-bs-toggle="dropdown" aria-expanded="false"></a>
                                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1" style=" background-color: #f9f9f9">
                                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/clients/details/${client.id}"><i class='far fa-address-card'></i>détails</a></li>
                                                        <li><a class="dropdown-item"  href="${pageContext.request.contextPath}/evenements/Create/${client.id}"><i class="fa fa-calendar" aria-hidden="true"></i> événement</a></li>
                                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/clients/Update/${client.id}"><i class="fa fa-pencil fa-fw"></i> modifier</a></li>
                                                        <li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#dropdown_${client.id}" href="#"><i class="fa fa-trash-o fa-lg"></i> supprimer</a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </td>
                                    </tr>
                                    <div class="modal fade" id="dropdown_${client.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel_${client.id}" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="staticBackdropLabel_${client.id}">Confirmation de suppression</h5>
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
</div>
</body>
</html>