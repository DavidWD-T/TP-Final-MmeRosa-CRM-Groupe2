<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"/>

<style>
    body{
        background-color:#fff;
    }
    .contacts-list{
        background-color: #f9f9ff;
    }
    .col-form-label{
        background-color: rgba(194,215,255,0.93);
        color: #3b76e1;
        margin-bottom: 4px;
        border-radius: 8px;
    }
    .form-control{
        background-color: aliceblue;
    }

</style>

<body>
<header>
    <jsp:include page="header.jsp"/>
</header>
<div class="container-fluid text-center">
    <form:form action="${pageContext.request.contextPath}/signup" method="post" class="contacts-list rounded-4 p-3 mb-2" style="max-width: 1500px; margin: auto" enctype="multipart/form-data" modelAttribute="createUser">
        <div>
            <h1>User Registration - Sign Up</h1>
        </div>
        <div class="m-3">
            <form:input path="id" type="number" name="id" id="id" class="form-control" hidden="true" />
            <div class="form-group row">
                <label class="col-2 col-form-label" for="email">E-mail: </label>
                <div class="col-10">
                    <form:input path="email" type="email" name="email" id="email" class="form-control" required="true" />
                    <form:errors path="email"></form:errors>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-2 col-form-label" for="password">Mot De Passe: </label>
                <div class="col-10">
                        <%--                    <input type="password" name="password"  id="password"  class="form-control" />--%>
                    <form:input path="password" type="password" name="password"  id="password"  class="form-control" />
                    <form:errors path="password"></form:errors>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-2 col-form-label" for="nom">Nom: </label>
                <div class="col-10">
                    <form:input path="nom" type="text" name="nom"  id="nom"  class="form-control" />
                </div>
            </div>

            <div class="form-group row">
                <label class="col-2 col-form-label" for="prenom">Prenom: </label>
                <div class="col-10">
                    <form:input path="prenom" type="text" name="prenom"  id="prenom"  class="form-control" />
                </div>
            </div>



            <div class="form-group row"  id="URL">
                <input type="checkbox" class="col-4 btn-check" id="togglePictureOptions" checked autocomplete="off">
                <label class="col-2 btn btn-primary col-form-label" for="togglePictureOptions" id="btn-check-eti">URL</label>
                <div class="col-10">
                    <form:input path="photoUrl" type="text" name="photoUrl"  id="photoUrl"  class="form-control" />
                    <form:input path="photoFile" type="file" name="photoFile"  id="photoFile"  class="form-control" style="display: none"/>
                </div>
            </div>

            <div>
                <button type="submit" class="btn btn-primary">Sign Up</button>
            </div>
        </div>
    </form:form>

    <c:if test = "${deleteActif == 'Oui'}" var="condition">
        <!-- MODAL DELETE CONFIRMATION -->
        <div class="modal fade" id="delete_modal_" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Confirmation</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Voulez vous vraiment supprimer votre compte utilisateur et toutes vos données ?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Non</button>
                        <form:form action="${pageContext.request.contextPath}/users/delete" method="post">
                            <button type="submit" class="btn btn-danger">Oui</button>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
        <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#delete_modal_">Delete User</button>
    </c:if>
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