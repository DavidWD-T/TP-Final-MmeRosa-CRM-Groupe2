<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--<style>--%>
<%--    .dropdown-item{}--%>
<%--    .nav-link,.nav-item>.dropdown-item{--%>
<%--        color: rgb(220,220,220);--%>
<%--    }--%>
<%--    .nav-link:hover,.nav-item>.dropdown-item:hover{--%>
<%--        color: rgb(220,220,220);--%>
<%--        background-color:rgb(69,99,150);--%>
<%--    }--%>
<%--    .dropdown-menu, .nav-item>.dropdown-item{--%>
<%--        background-color:rgb(69,99,150);--%>
<%--    }--%>

<%--</style>--%>

<nav class="navbar navbar-expand-lg mb-4" style="background-color:rgba(69,99,150,1);">
    <div class="container-fluid">
        <a href="${pageContext.request.contextPath}/entreprises/all"><img src="/img/Sans_titre-removebg-preview.png" alt="logo" style="max-height: 50px" class="mx-4"></a>

<%--        <a class="navbar-brand" href="http://localhost:8080/images/Sans_titre-removebg-preview.png">Entreprise</a>--%>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <sec:authorize access="isAuthenticated()">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/entreprises/all">Tableau de bord</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/prospects/all">Prospects</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/clients/all">Clients</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/entreprises/all">Entreprises</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/staticcalendar">Calendrier</a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Parametres</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/signup/<sec:authentication property='principal.username' />">Profil</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/listUsers">Liste utilisateurs</a></li>
                        </ul>
                    </li>
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