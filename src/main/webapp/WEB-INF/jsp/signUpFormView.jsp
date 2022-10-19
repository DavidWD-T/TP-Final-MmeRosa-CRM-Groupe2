<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign UP</title>
</head>
<body>
<header>
    <jsp:include page="header.jsp"/>
</header>
<div class="container text-center">
    <div>
        <h1>User Registration - Sign Up</h1>
    </div>
    <form:form action="${pageContext.request.contextPath}/signup" method="post" style="max-width: 600px; margin: 0 auto;" enctype="multipart/form-data" modelAttribute="createUser">

        <div class="m-3">
            <form:input path="id" type="number" name="id" id="id" class="form-control" hidden="true" />
            <div class="form-group row">
                <label class="col-4 col-form-label" for="email">E-mail: </label>
                <div class="col-8">
                    <form:input path="email" type="email" name="email" id="email" class="form-control" required="true" />
                    <form:errors path="email"></form:errors>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-4 col-form-label" for="password">Mot De Passe: </label>
                <div class="col-8">
                        <%--                    <input type="password" name="password"  id="password"  class="form-control" />--%>
                    <form:input path="password" type="password" name="password"  id="password"  class="form-control" />
                    <form:errors path="password"></form:errors>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-4 col-form-label" for="nom">Nom: </label>
                <div class="col-8">
                    <form:input path="nom" type="text" name="nom"  id="nom"  class="form-control" />
                </div>
            </div>

            <div class="form-group row">
                <label class="col-4 col-form-label" for="prenom">Prenom: </label>
                <div class="col-8">
                    <form:input path="prenom" type="text" name="prenom"  id="prenom"  class="form-control" />
                </div>
            </div>



            <div class="form-group row"  id="URL">
                <input type="checkbox" class="col-4 btn-check" id="togglePictureOptions" checked autocomplete="off">
                <label class="col-4 btn btn-primary" for="togglePictureOptions" id="btn-check-eti">URL</label>
                <div class="col-8">
                    <form:input path="photoUrl" type="text" name="photoUrl"  id="photoUrl"  class="form-control" />
                    <form:input path="photoFile" type="file" name="photoFile"  id="photoFile"  class="form-control" style="display: none"/>
                </div>
            </div>

            <div>
                <button type="submit" class="btn btn-primary">Sign Up</button>
            </div>
        </div>
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