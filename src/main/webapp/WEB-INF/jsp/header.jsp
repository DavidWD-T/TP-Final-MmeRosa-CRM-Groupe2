<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="navbar navbar-expand-lg m-3 mb-4" style="background-color:rgba(69,99,150,1); border-top-left-radius: 30px; border-top-right-radius: 30px;">
    <div class="container-fluid">
        <a href="${pageContext.request.contextPath}/home"><img src="/img/Sans_titre-removebg-preview.png" alt="logo" style="max-height: 50px" class="mx-4"></a>

<%--        <a class="navbar-brand" href="http://localhost:8080/images/Sans_titre-removebg-preview.png">Entreprise</a>--%>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <sec:authorize access="isAuthenticated()">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/home">Tableau de bord</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/prospects/all"><i class='fas fa-address-book'></i> Prospects</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/clients/all"><i class='far fa-address-book'></i> Clients</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/entreprises/all"><i class='fas fa-city'></i> Entreprises</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/staticcalendar"><i class="fa fa-calendar" aria-hidden="true"></i> Calendrier</a>
                    </li>

                    <sec:authentication var="MailCo" property='principal.username' />
                    <c:if test="${MailCo == 'rosa@worktogether.fr' }" var="condition">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa fa-cog"></i> Parametres</a>
                            <ul class="dropdown-menu bg-light">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/signup/${MailCo}"> Profil</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/listUsers">Liste utilisateurs</a></li>
                            </ul>
                        </li>
                    </c:if>
                    <c:if test="${!condition}">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/signup/${MailCo}">Parametres</a>
                        </li>
                    </c:if>
                </ul>
                <form:form action="/logout" method="post" class="d-flex mb-2 mb-lg-0">
                    <button class="btn btn-outline-danger" type="submit">Deconnexion</button>
                </form:form>
            </sec:authorize>
            <sec:authorize access="!isAuthenticated()">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/signup">Inscription</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/signin">Connexion</a>
                    </li>
                </ul>
            </sec:authorize>
        </div>
    </div>
</nav>