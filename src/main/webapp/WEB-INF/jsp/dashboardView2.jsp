<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"/>
<script src="./../../js/dashboard.js"></script>


<body>
<header>
    <jsp:include page="header.jsp"/>
</header>

<h1 class="text-center">Bienvenue sur votre tableau de bord</h1>
<p class="text-center p-2 m-1">C'est quoi CRM ? Il s'agit d'un achronyme pour Customer Relationship Management ou gestion de la relation client en francais.
    <br>Cette application web est un outil de gestion des relations et interactions d'une entreprise avec leurs clients ou clients potentiels.
    <br> En d'autres termes, cet outil va vous permettre de piloter votre organisation a travers vos prospections, vos rendez-vous, vos interventions ou prestations et ainsi que vos relations clients.</p>
<%--<div class="d-lg-flex flex-wrap justify-content-center h-50">--%>
<div class="container">
<div class="row">
<%--    <div class="col-4">--%>
        <div id="chart_div" class="col-4 card m-2">
            <input id="totalClient" type="number" hidden value="">
            <input id="totalProspect" type="number" hidden value="">
        </div>
<%--    </div>--%>
<%--    <div class="col-4">--%>
        <div id="chart_div2" class="col-4 card m-2">
            <input id="aucuneProspection" type="number" hidden value="">
            <input id="prospectionEnCours" type="number" hidden value="">
            <input id="aRelancer" type="number" hidden value="">
        </div>
<%--    </div>--%>
<%--    <div class="col-4">--%>
        <div id="chart_div3" class="col-4 card m-2">
            <input id="toContact" type="number" hidden value="">
        </div>
<%--    </div>--%>
<%--    <div class="col-4">--%>
        <div id="chart_div4" class="col-4 card m-2">
            <input id="thisMonth" type="number" hidden value="">
            <input id="previousMonth" type="number" hidden value="">
            <input id="beforePreviousMonth" type="number" hidden value="">
        </div>
<%--    </div>--%>
<%--    <div class="col-4">--%>
        <div id="chart_div5" class="col-4 card m-2">
            <input id="thisMonthP" type="number" hidden value="">
            <input id="previousMonthP" type="number" hidden value="">
            <input id="beforePreviousMonthP" type="number" hidden value="">
        </div>
<%--    </div>--%>
<%--    <div class="col-4">--%>
        <div id="chart_div6" class="col-4 card m-2 p-1">
        </div>
<%--    </div>--%>
</div>
</div>

</body>