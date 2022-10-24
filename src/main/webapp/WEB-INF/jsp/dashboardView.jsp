<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"/>


<body>
<header>
    <jsp:include page="header.jsp"/>
</header>

<h1 class="text-center">Dashboard is coming...</h1>
<div class="d-md-flex flex-wrap justify-content-center">
    <div id="chart_div" class="card">
        <input id="totalEntreprise" type="number" hidden value="">
        <input id="totalClient" type="number" hidden value="">
        <input id="totalProspect" type="number" hidden value="">
    </div>
    <div id="chart_div2" class="card ">
        <input id="aucuneProspection" type="number" hidden value="">
        <input id="prospectionEnCours" type="number" hidden value="">
        <input id="aRelancer" type="number" hidden value="">
    </div>
    <div id="chart_div3" class="card ">
        <input id="aContacter" type="number" hidden value="">
    </div>
    <div id="chart_div4" class="card ">
        <input id="thisMonth" type="number" hidden value="">
        <input id="previousMonth" type="number" hidden value="">
        <input id="beforePreviousMonth" type="number" hidden value="">
    </div>
</div>


</body>
</html>