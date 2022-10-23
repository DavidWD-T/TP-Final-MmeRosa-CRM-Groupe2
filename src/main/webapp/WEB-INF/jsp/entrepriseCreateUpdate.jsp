<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="head.jsp"/>


<body>
<header>
    <jsp:include page="header.jsp"/>
</header>


<div class="container-fluid text-center">
    <form:form action="${pageContext.request.contextPath}/entreprises/Validate" method="post" class="contacts-list rounded-4 p-3 mb-2" style="max-width: 1500px; margin: auto" enctype="multipart/form-data" modelAttribute="createEntreprise">
        <form:input path="id" type="number" name="id" id="id" class="form-control" hidden="true"/>
        <form:input path="dateCreation" type="localdate" name="dateCreation" id="dateCreation" class="form-control" hidden="true" />

        <h1>Entreprise</h1>
        <div class="form-group row">
            <label class="col-2 col-form-label" for="nom">Nom: </label>
            <div class="col-10">
                <form:input path="nom" type="text" name="nom" id="nom" class="form-control" required="true" />
            </div>
        </div>

        <div class="form-group row"  id="URL">
            <input type="checkbox" class="col-2 btn-check" id="togglePictureOptions" checked autocomplete="off">
            <label class="col-2 btn btn-primary col-form-label" for="togglePictureOptions" id="btn-check-eti">URL</label>
            <div class="col-10">
                <form:input path="logo" type="text" name="logo"  id="logo"  class="form-control" />
                <form:input path="logoFile" type="file" name="logoFile"  id="logoFile"  class="form-control" style="display: none"/>
            </div>
        </div>


        <div class="form-group row">
            <label class="col-2 col-form-label" for="secteurActivite">Secteur Activite: </label>
            <div class="col-10">
                <form:input path="secteurActivite" type="text" name="secteurActivite" id="secteurActivite" class="form-control" />
            </div>
        </div>

        <div class="form-group row">
            <label class="col-2 col-form-label" for="siret">Siret: </label>
            <div class="col-10">
                <form:input path="siret" type="text" name="siret" id="siret" class="form-control" />
            </div>
        </div>

        <div class="form-group row">
            <label class="col-2 col-form-label" for="adresse">Adresse: </label>
            <div class="col-10">
                <form:input path="adresse" type="text" name="adresse" id="adresse" class="form-control" />
            </div>
        </div>

        <div class="form-group row">
            <label class="col-2 col-form-label" for="complementAdresse">Complement Adresse: </label>
            <div class="col-10">
                <form:input path="complementAdresse" type="text" name="complementAdresse" id="complementAdresse" class="form-control" />
            </div>
        </div>

        <div class="form-group row">
            <label class="col-2 col-form-label" for="ville">Ville: </label>
            <div class="col-10">
                <form:input path="ville" type="text" name="ville" id="ville" class="form-control" />
            </div>
        </div>

        <div class="form-group row">
            <label class="col-2 col-form-label" for="codePostale">Code Postale: </label>
            <div class="col-10">
                <form:input path="codePostale" type="text" name="codePostale" id="codePostale" class="form-control" />
            </div>
        </div>

        <div class="form-group row">
            <label class="col-2 col-form-label" for="email">Email: </label>
            <div class="col-10">
                <form:input path="email" type="text" name="email" id="email" class="form-control" />
            </div>
        </div>

        <div class="form-group row">
            <label class="col-2 col-form-label" for="siteWeb">Site Web: </label>
            <div class="col-10">
                <form:input path="siteWeb" type="text" name="siteWeb" id="siteWeb" class="form-control" />
            </div>
        </div>

        <div class="form-group row">
            <label class="col-2 col-form-label" for="telephone">Telephone: </label>
            <div class="col-10">
                <form:input path="telephone" type="text" name="telephone" id="telephone" class="form-control" />
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
            document.getElementById("logoFile").style.display = "block";
            document.getElementById("logo").style.display = "none";
        } else {
            x.innerHTML  = "URL";
            document.getElementById("logoFile").style.display = "none";
            document.getElementById("logo").style.display = "block";
        }
    }

    let checkboxPictures = document.getElementById("togglePictureOptions");
    checkboxPictures.addEventListener('click', () => {
        togglePictureBlocks();
    });
</script>
</body>
</html>