<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"/>

<%--<style>--%>
<%--    body{--%>
<%--        background-color:#fff;--%>
<%--    }--%>
<%--    .contacts-list{--%>
<%--        background-color: #f9f9ff;--%>
<%--    }--%>
<%--    .col-form-label{--%>

<%--        margin-bottom: 4px;--%>
<%--        border-radius: 8px;--%>
<%--    }--%>
<%--    .form-control{--%>
<%--        background-color: aliceblue;--%>
<%--    }--%>
<%--    .form-group{--%>
<%--        margin-bottom: 10px;--%>
<%--    }--%>

<%--</style>--%>

<body>
<header>
    <jsp:include page="header.jsp"/>
</header>
<div class="container-fluid text-center" style="max-width: 600px;">
    <form:form action="${pageContext.request.contextPath}/evenements/${type}/${prospect.id}" method="post" modelAttribute="createEvenement">
        <form:input path="id" type="number" name="id" id="id" class="form-control" hidden="true"/>

        <div class="form-group">
            <label class="col-form-label" for="motif">motif</label>
            <form:input path="motif" type="text" name="motif" id="motif" class="form-control"/>
        </div>

        <div class="form-group">
            <label class="col-form-label" for="adresse">adresse</label>
            <form:input path="adresse" type="text" name="adresse" id="adresse" class="form-control"/>
        </div>

        <div class="form-group">
            <label class="col-form-label" for="ville">ville</label>
            <form:input path="ville" type="text" name="ville" id="ville" class="form-control"/>
        </div>

        <div class="form-group">
            <label class="col-form-label" for="codePostale">code postal</label>
            <form:input path="codePostale" type="text" name="codePostale" id="codePostale" class="form-control" />
        </div>

        <div class="form-group">
            <label class="col-form-label" for="voiceCallUrl">voiceCallUrl</label>
            <form:input path="voiceCallUrl" type="text" name="voiceCallUrl" id="voiceCallUrl" class="form-control"/>
        </div>

        <div class="form-group">
            <label class="col-form-label" for="date">date</label>
            <form:input path="date" type="date" name="date" id="date" class="form-control"/>
        </div>

        <div class="form-group">
            <label class="col-form-label" for="heureDebut">heureDebut</label>
            <form:input path="heureDebut" type="time" name="heureDebut" id="heureDebut" class="form-control" />
        </div>

        <div class="form-group">
            <label class="col-form-label" for="heureFin">heureFin</label>
            <form:input path="heureFin" type="time" name="heureFin" id="heureFin" class="form-control" />
        </div>

        <div class="form-group">
            <label class="col-form-label" for="description">description</label>
            <form:textarea path="description" class="form-control" id="description" rows="3"></form:textarea>
        </div>

        <button type="submit" class="btn btn-lg btn-primary btn-block m-3 ">${type}</button>
    </form:form>
</div>

</body>
</html>