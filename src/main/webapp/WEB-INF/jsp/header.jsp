
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Entreprise</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <sec:authorize access="isAuthenticated()">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/entreprises/all">Tableau de bord</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="${pageContext.request.contextPath}/prospects/all">Prospects</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="${pageContext.request.contextPath}/entreprises/all">Clients</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="${pageContext.request.contextPath}/entreprises/all">Entreprises</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="${pageContext.request.contextPath}/entreprises/all">Calendrier</a>
                    </li>
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link active" href="${pageContext.request.contextPath}/signup/<sec:authentication property='principal.username' />">Parametres</a>--%>
<%--                    </li>--%>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Parametres</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/signup/<sec:authentication property='principal.username' />">Profil</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/listUsers">Liste utilisateurs</a></li>
                        </ul>
                    </li>
                </ul>
                    <form:form action="/logout" method="post" class="d-flex">
                        <button class="btn btn-outline-danger" type="submit">Deconnexion</button>
                    </form:form>
                </sec:authorize>
                <sec:authorize access="!isAuthenticated()">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/signup">Inscription</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/signin">Connexion</a>
                    </li>
                </ul>
                </sec:authorize>
        </div>
    </div>
</nav>