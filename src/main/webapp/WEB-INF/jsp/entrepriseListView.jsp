<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"/>

<%--<style>--%>
<%--    body{--%>
<%--        background-color:#fff;--%>
<%--    }--%>
<%--    .contacts-list{--%>
<%--        background-color: #f9f9ff;--%>
<%--    }--%>

<%--    .card-text, .card-title{--%>
<%--        color: #3b76e1;--%>
<%--    }--%>
<%--    .contact-row{--%>
<%--        background-color: aliceblue;--%>
<%--    }--%>

<%--</style>--%>

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
                        <img src="${entreprise.logo}" class="card-img-top w-100" alt="${entreprise.nom}${entreprise.id}" >
                        <div class="card-body">
                            <h5 class="card-title">${entreprise.nom}</h5>
                            <p class="card-text">Site Web : ${entreprise.siteWeb}</p>
                            <p class="card-text">Telephone : ${entreprise.telephone}</p>
                            <p class="card-text">Email : ${entreprise.email}</p>
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