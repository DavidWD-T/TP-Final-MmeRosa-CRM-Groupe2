<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"/>
<body>
<header>
    <jsp:include page="header.jsp"/>
</header>


<div class="container">
    <div class="row justify-content-center">
        <h1>Liste Entreprise</h1><a href="${pageContext.request.contextPath}/entreprises/Create" class="btn btn-primary">Create</a>

        <form class="d-flex" role="search" method="get">
            <input name="name" id="name" class="form-control me-2" type="search" placeholder="Search" aria-label="Search" action="${pageContext.request.contextPath}/entreprises/all" value="${name}">
            <button class="btn btn-outline-success" type="submit">Search</button>
        </form>

        <c:forEach items="${entreprises}" var="entreprise">
            <div class="card text-center col-3 p-0 m-1">
                <img src="${entreprise.logo}" class="card-img-top w-100" alt="${entreprise.nom}${entreprise.id}" >
                <div class="card-body">
                    <h5 class="card-title">${entreprise.nom}</h5>
                    <p class="card-text">Site Web : ${entreprise.siteWeb}</p>
                    <p class="card-text">Telephone : ${entreprise.telephone}</p>
                    <p class="card-text">Email : ${entreprise.email}</p>
                    <a href="${pageContext.request.contextPath}/entreprises/details/${entreprise.id}" class="btn btn-primary">View Entreprise</a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>