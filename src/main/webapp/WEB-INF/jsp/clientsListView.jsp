<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="fr">
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css" integrity="sha512-pVCM5+SN2+qwj36KonHToF2p1oIvoU3bsqxphdOIWMYmgr4ZqD3t5DjKvvetKhXGc/ZG5REYTT6ltKfExEei/Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Contacts</title>

    <style>
        body{margin-top:20px;
            background-color:#fff;
        }
        .contacts-list{
            background-color: #f9f9f9;
        }
        .project-list-table {
            border-collapse: separate;
            border-spacing: 0 12px
        }

        .table-header{
            background-color: rgba(194,215,255,0.93);
            color: #3b76e1;
        }

        .table-nowrap td, .table-nowrap th {
            white-space: nowrap;
        }
        .table-borderless>:not(caption)>*>* {
            border-bottom-width: 0;
        }
        .table>:not(caption)>*>* {
            padding: 0.75rem 0.75rem;
            background-color: var(--bs-table-bg);
            border-bottom-width: 1px;
            box-shadow: inset 0 0 0 9999px var(--bs-table-accent-bg);
        }

        .avatar-sm {
            height: 2rem;
            width: 2rem;
        }
        .rounded-circle {
            border-radius: 50%!important;
        }
        .me-2 {
            margin-right: 0.5rem!important;
        }
        img, svg {
            vertical-align: middle;
        }

        a {
            color: #3b76e1;
            text-decoration: none;
        }

        .badge-soft-danger {
            color: #f56e6e !important;
            background-color: rgba(245,110,110,.1);
        }
        .badge-soft-success {
            color: #63ad6f !important;
            background-color: rgba(99,173,111,.1);
        }

        .badge-soft-primary {
            color: #3b76e1 !important;
            background-color: rgba(59,118,225,.1);
        }

        .badge-soft-info {
            color: #57c9eb !important;
            background-color: rgba(87,201,235,.1);
        }

        .avatar-title {
            align-items: center;
            background-color: #3b76e1;
            color: #fff;
            display: flex;
            font-weight: 500;
            height: 100%;
            justify-content: center;
            width: 100%;
        }
        .bg-soft-primary {
            background-color: rgba(59,118,225,.25)!important;
        }
        .contact-row{
            background-color: aliceblue;
        }
    </style>

</head>


<body style="height: 100vh;" class="p-0 d-flex flex-column">


<c:import url="header.jsp"/>

    <div class="container" style="margin-top: 2%">

        <div class="row">
            <div class="col-6">
                <form class="d-flex mb-3 search_bar" role="search" method="get">
                    <input name="name" id="name" class="form-control me-2" type="search" placeholder="Search" aria-label="Search" action="${pageContext.request.contextPath}/clients" value="${name}">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
                <div class="col-6" style="width: max-content;">
                    <a class="btn btn-outline-secondary" type="button" href="#" style="font-size: 15px;"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1z"/>
                    </svg>A-Z</a>
                </div>
                <div class="col-6" style="width: max-content">
                    <a class="btn btn-outline-secondary" type="button" href="#" style="font-size: 15px;">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M8 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L7.5 2.707V14.5a.5.5 0 0 0 .5.5z"></path>
                        </svg>Z-A
                    </a>
                </div>
        </div>

        <div class="contacts-list rounded-4">
            <div style="width: 90%; height: 90%; margin: auto;">
                <div class="row align-items-center">
                    <div class="col-lg-6" style="height: max-content">
                        <p style="margin: 0; font-size: 25px"><strong>Clients</strong></p>
                    </div>
                    <div class="col-lg-6">
                        <div class="d-flex flex-wrap align-items-center justify-content-end gap-2">
                            <div>
                                <a href="${pageContext.request.contextPath}/prospects/create"  class="btn btn-primary">Ajouter client <i class="bx bx-plus"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div>
                            <div class="table-responsive">
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
                                                    <td>${client.prenom} ${client.nom}</td>
                                                    <td>${client.entrepriseById.nom}</td>
                                                    <td><span class="badge badge-soft-danger mb-0">${client.etatProspection}</span></td>
                                                    <td>${client.entrepriseById.email}</td>
                                                    <td>${client.portable}</td>
                                                    <td>
                                                        <ul class="list-inline mb-0">
                                                            <li class="nav-item dropdown">
                                                                <a class="nav-link dropdown-toggle btn btn-outline-secondary plus-button" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"></a>
                                                                <ul class="dropdown-menu" style=" background-color: #f9f9f9">
                                                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/prospects/details/${client.id}">details</a></li>
                                                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/prospects/update/${client.id}">modifier</a></li>
                                                                    <li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#dropdown" href="#">supprimer</a></li>
                                                                </ul>
                                                            </li>
                                                        </ul>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <!--Modal suppression client-->
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
                                <a type="submit" href="{pageContext.request.contextPath}/delete/${client.id}" class="btn btn-danger">Oui</a>
                            </div>
                        </div>
                    </div>
                </div>

                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

            </div>
        </div>
    </div>
</body>
</html>