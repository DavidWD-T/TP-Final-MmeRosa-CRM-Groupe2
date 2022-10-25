<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"/>

<body>
<header>
    <jsp:include page="header.jsp"/>
</header>


<div class="container-fluid">

    <div class="contacts-list rounded-4 p-3 mb-4"  style="max-width: 1500px; margin: auto">
        <form class="d-flex search_bar" role="search" method="get">
            <input name="name" id="name" class="form-control me-2" type="search" placeholder="&#x1F50D; Search" aria-label="&#x1F50D; Search" action="${pageContext.request.contextPath}/entreprises/all" value="${name}">
        </form>
    </div>

    <div class="contacts-list rounded-4 p-3 mb-3" style="max-width: 1500px; margin: auto">
        <div class="row align-items-center mb-2">
            <div class="col-6" style="height: max-content">
                <h2><strong>Entreprises</strong></h2>
            </div>
            <div class="col-6">
                <div class="d-flex flex-wrap align-items-center justify-content-end gap-2">
                    <a href="${pageContext.request.contextPath}/entreprises/Create"  class="btn btn-outline-success">Ajouter entreprise <i class="bx bx-plus"></i></a>
                </div>
            </div>
        </div>

        <div class="row">
            <c:forEach items="${entreprises}" var="entreprise">
                <div class="col-6 col-lg-3 p-2">
                    <div class="card text-center contact-row">
                        <img src="${entreprise.logo}" class="card-img-top text-uppercase rounded-circle mt-2" style="width: 100px; height: 100px; margin: auto" alt="${entreprise.nom}${entreprise.id}" >
                        <div class="card-body">
                            <h5 class="card-title text-uppercase mb-3"><strong>${entreprise.nom}</strong></h5>
                            <p class="card-text"><i class='far fa-compass'></i> Site Web : <a href="${entreprise.siteWeb}">${entreprise.siteWeb}</a></p>
                            <p class="card-text"><i class='fas fa-phone'></i> Telephone : <a href="tel:${entreprise.telephone}">${entreprise.telephone}</a></p>
                            <p class="card-text"><i class='far fa-envelope-open'></i> Email :<a href="mailto:${entreprise.email}">${entreprise.email}</a></p>
                            <a href="${pageContext.request.contextPath}/entreprises/details/${entreprise.id}" class="btn btn-primary">View Entreprise</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

</body>
</html>