<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"/>
<body>
<header>
    <jsp:include page="header.jsp"/>
</header>


<div class="container">
    <form:form action="${pageContext.request.contextPath}/prospects/Validate" method="post" style="max-width: 600px; margin: 0 auto;" enctype="multipart/form-data" modelAttribute="createProspect">
        <form:input path="id" type="number" name="id" id="id" class="form-control" hidden="true" />
        <form:input path="dateCreationProspection" type="localdate" name="dateCreationProspection" id="dateCreationProspection" class="form-control" hidden="true" />

        <div class="form-group row">
            <label class="col-4 col-form-label" for="nom">Nom: </label>
            <div class="col-8">
                <form:input path="nom" type="text" name="nom" id="nom" class="form-control" required="true"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-4 col-form-label" for="prenom">Prenom: </label>
            <div class="col-8">
                <form:input path="prenom" type="text" name="prenom" id="prenom" class="form-control" />
            </div>
        </div>

        <div class="form-group row"  id="URL">
            <input type="checkbox" class="col-4 btn-check" id="togglePictureOptions" checked autocomplete="off">
            <label class="col-4 btn btn-primary" for="togglePictureOptions" id="btn-check-eti">URL: </label>
            <div class="col-8">
                <form:input path="photoUrl" type="text" name="photoUrl"  id="photoUrl"  class="form-control" />
                <form:input path="photoFile" type="file" name="photoFile"  id="photoFile"  class="form-control" style="display: none"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-4 col-form-label" for="email">Email: </label>
            <div class="col-8">
                <form:input path="email" type="text" name="email" id="email" class="form-control" />
            </div>
        </div>

        <div class="form-group row">
            <label class="col-4 col-form-label" for="portable">Portable: </label>
            <div class="col-8">
                <form:input path="portable" type="text" name="portable" id="portable" class="form-control" />
            </div>
        </div>

        <div class="form-group row">
            <label class="col-4 col-form-label" for="fixe">Fixe: </label>
            <div class="col-8">
                <form:input path="fixe" type="text" name="fixe" id="fixe" class="form-control" />
            </div>
        </div>

        <div class="form-group row">
            <label class="col-4 col-form-label" for="fixe">Entreprise d'appartenance: </label>
                <select class="form-select d-block w-100" id="entreprises" name="entrepriseId">
                    <option selected>Selectionnez une entreprise</option>
                    <c:forEach items="${entreprises}" var="entreprise">
                    <option value="${entreprise.id}">${entreprise.name}<option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-4 col-form-label" for="fonction">Fonction dans l'entreprise: </label>
            <div class="col-8">
                <form:input path="fonction" type="text" name="fonction" id="fonction" class="form-control" />
            </div>
        </div>

        <button type="submit" class="btn btn-lg btn-primary btn-block m-3">${type}</button>

    </form:form>
</div>

<script>
    function togglePictureBlocks() {
        let x = document.getElementById("btn-check-eti");
        if (x.innerHTML  === "URL") {
            x.innerHTML  = "Upload";
            document.getElementById("photoFile").style.display = "block";
            document.getElementById("photoUrl").style.display = "none";
        } else {
            x.innerHTML  = "URL";
            document.getElementById("photoFile").style.display = "none";
            document.getElementById("photoUrl").style.display = "block";
        }
    }

    let checkboxPictures = document.getElementById("togglePictureOptions");
    checkboxPictures.addEventListener('click', () => {
        togglePictureBlocks();
    });
</script>
</body>
</html>