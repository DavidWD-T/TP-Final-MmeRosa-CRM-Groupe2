<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"/>

<body>
<header>
    <jsp:include page="header.jsp"/>
</header>
<div class="container-fluid text-center">
    <form:form action="${pageContext.request.contextPath}/evenements/${type}/${prospect.id}" method="post" class="contacts-list rounded-4 p-3 mb-2" style="max-width: 1500px; margin: auto" modelAttribute="createEvenement">
        <form:input path="id" type="number" name="id" id="id" class="form-control" hidden="true"/>
        <h1>Evenement</h1>

        <div class="form-group row">
            <label class="col-2 col-form-label" for="motif">motif</label>
            <div class="col-10">
                <form:input path="motif" type="text" name="motif" id="motif" class="form-control"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-2 col-form-label" for="adresse">adresse</label>
            <div class="col-10">
                <form:input path="adresse" type="text" name="adresse" id="adresse" class="form-control"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-2 col-form-label" for="ville">ville</label>
            <div class="col-10">
                <form:input path="ville" type="text" name="ville" id="ville" class="form-control"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-2 col-form-label" for="codePostale">code postal</label>
            <div class="col-10">
                <form:input path="codePostale" type="text" name="codePostale" id="codePostale" class="form-control" />
            </div>
        </div>

        <div class="form-group row">
            <label class="col-2 col-form-label" for="voiceCallUrl">voiceCallUrl</label>
            <div class="col-10">
                <form:input path="voiceCallUrl" type="text" name="voiceCallUrl" id="voiceCallUrl" class="form-control"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-2 col-form-label" for="date">date</label>
            <div class="col-10">
                <form:input path="date" type="date" name="date" id="date" class="form-control"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-2 col-form-label" for="heureDebut">heureDebut</label>
            <div class="col-10">
                <form:input path="heureDebut" type="time" name="heureDebut" id="heureDebut" class="form-control" />
            </div>
        </div>

        <div class="form-group row">
            <label class="col-2 col-form-label" for="heureFin">heureFin</label>
            <div class="col-10">
                <form:input path="heureFin" type="time" name="heureFin" id="heureFin" class="form-control" />
            </div>
        </div>

        <div class="form-group row">
            <label class="col-2 col-form-label" for="description">description</label>
            <div class="col-10">
                <form:textarea path="description" class="form-control" id="description" rows="3"></form:textarea>
            </div>
        </div>

        <button type="submit" class="btn btn-lg btn-primary btn-block m-3 ">${type}</button>
    </form:form>
</div>

</body>
</html>