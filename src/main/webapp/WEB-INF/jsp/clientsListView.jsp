<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<!doctype html>--%>
<%--<html lang="fr">--%>
<%--<head>--%>
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css" integrity="sha512-pVCM5+SN2+qwj36KonHToF2p1oIvoU3bsqxphdOIWMYmgr4ZqD3t5DjKvvetKhXGc/ZG5REYTT6ltKfExEei/Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />--%>
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />--%>

<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"--%>
<%--          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport"--%>
<%--          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">--%>
<%--    <meta http-equiv="X-UA-Compatible" content="ie=edge">--%>
<%--    <title>Clients</title>--%>

<%--    <style>--%>
<%--        body{--%>
<%--            background-color:#fff;--%>
<%--        }--%>
<%--        .contacts-list{--%>
<%--            background-color: #f9f9ff;--%>
<%--        }--%>
<%--        .project-list-table {--%>
<%--            border-collapse: separate;--%>
<%--            border-spacing: 0 12px--%>
<%--        }--%>
<%--        .table-header{--%>
<%--            background-color: rgba(194,215,255,0.93);--%>
<%--            color: #3b76e1;--%>
<%--        }--%>
<%--        .table-nowrap td, .table-nowrap th {--%>
<%--            white-space: nowrap;--%>
<%--        }--%>
<%--        .table-borderless>:not(caption)>*>* {--%>
<%--            border-bottom-width: 0;--%>
<%--        }--%>
<%--        .table>:not(caption)>*>* {--%>
<%--            padding: 0.75rem 0.75rem;--%>
<%--            background-color: var(--bs-table-bg);--%>
<%--            border-bottom-width: 1px;--%>
<%--            box-shadow: inset 0 0 0 9999px var(--bs-table-accent-bg);--%>
<%--        }--%>
<%--        .contact-row{--%>
<%--            background-color: aliceblue;--%>
<%--        }--%>

<%--    </style>--%>

<%--</head>--%>

<c:import url="head.jsp"/>
<body style="height: 100vh;" class="p-0 d-flex flex-column">

<c:import url="header.jsp"/>

<div class="container-fluid">

    <div class="contacts-list rounded-4 p-3 mb-4"  style="max-width: 1500px; margin: auto">
        <form class="d-flex search_bar" role="search" method="get">
            <input name="name" id="name" class="form-control me-2" type="search" placeholder="&#x1F50D; Search" aria-label="&#x1F50D; Search" action="${pageContext.request.contextPath}/clients/all" value="${name}">

            <button name="order" id="order1" type="submit" class="btn btn-outline-secondary me-2" action="${pageContext.request.contextPath}/clients/all" value="">&darr;AZ</button>
            <button name="order" id="order2" type="submit" class="btn btn-outline-secondary me-2" action="${pageContext.request.contextPath}/clients/all" value="2">&uarr;AZ</button>

            <button name="order" id="order3" type="submit" class="btn btn-outline-secondary me-2" action="${pageContext.request.contextPath}/clients/all" value="3">&darr;Date</button>
            <button name="order" id="order4" type="submit" class="btn btn-outline-secondary" action="${pageContext.request.contextPath}/clients/all" value="4">&uarr;Date</button>
        </form>
    </div>

    <div class="contacts-list rounded-4 p-3" style="max-width: 1500px; margin: auto">
        <div style="height: 78vh;">
            <div class="row align-items-center mb-2">
                <div class="col-6" style="height: max-content">
                    <h2><strong>Clients</strong></h2>
                </div>
                <div class="col-6">
                    <div class="d-flex flex-wrap align-items-center justify-content-end gap-2">
                        <a href="${pageContext.request.contextPath}/clients/Create"  class="btn btn-outline-success">Ajouter client <i class="bx bx-plus"></i></a>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <div class="table-responsive" style="min-height: 300px;">
                        <table class="table project-list-table table-nowrap align-middle table-borderless">
                            <thead class="thead">
                            <tr class="table-header">
                                <th scope="col" style="width: 20%">Nom</th>
                                <th scope="col" style="width: 17%">Entreprise</th>
                                <th scope="col"style="width: 15%;">Statut</th>
                                <th scope="col"style="width: 25%;">Email</th>
                                <th scope="col" style="width: 19%">téléphone</th>
                                <th scope="col" style="width: 200px;">. . .</th>
                            </tr>
                            </thead>

                            <tbody class="tbody">
                            <c:forEach items="${clients}" var="client">
                                <tr class="contact-row">
                                    <td>${client.nom} ${client.prenom}</td>
                                    <td>${client.entrepriseById.nom}</td>
                                    <td><span class="badge badge-soft-danger mb-0">${client.etatProspection}</span></td>
                                    <td>${client.email}</td>
                                    <td>${client.portable}</td>
                                    <td>
                                        <ul class="list-inline mb-0">
                                            <li class="nav-item dropdown">
                                                <a class="nav-link dropdown-toggle btn btn-outline-secondary plus-button" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"></a>
                                                <ul class="dropdown-menu" style=" background-color: #f9f9f9">
                                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/clients/details/${client.id}">détails</a></li>
                                                    <li><a class="dropdown-item"  href="${pageContext.request.contextPath}/evenements/Create/${client.id}">événement</a></li>
                                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/clients/Update/${client.id}">modifier</a></li>
                                                    <li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#dropdown" href="#">supprimer</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </td>
                                </tr>
                                <div class="modal fade" id="dropdown" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="staticBackdropLabel">Confirmation de suppression</h5>
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