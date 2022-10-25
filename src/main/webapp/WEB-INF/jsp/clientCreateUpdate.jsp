<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"/>
<body>
<header>
    <jsp:include page="header.jsp"/>
</header>


<div class="container-fluid text-center">

    <form:form action="${pageContext.request.contextPath}/clients/${type}" class="contacts-list rounded-4 p-3 mb-2" method="post" style="max-width: 1500px; margin: auto" enctype="multipart/form-data" modelAttribute="createProspect">
        <form:input path="id" type="number" name="id" id="id" class="form-control" hidden="true"/>
        <h1>Client</h1>
        <div class="form-group row">
            <label class="col-2 col-form-label" for="nom">Nom</label>
            <div class="col-10">
                <form:input path="nom" type="text" name="nom" id="nom" class="form-control" required="true"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-2 col-form-label" for="prenom">Prenom</label>
            <div class="col-10">
                <form:input path="prenom" type="text" name="prenom" id="prenom" class="form-control" />
            </div>
        </div>

        <div class="form-group row"  id="URL">
            <input type="button" class="col-2 btn btn-success col-form-label" id="togglePictureOptions" value="URL">
            <div class="col-10">
                <form:input path="photoUrl" type="text" name="photoUrl"  id="photoUrl"  class="form-control"/>
                <form:input path="photoFile" type="file" name="photoFile"  id="photoFile"  class="form-control" style="display: none"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-2 col-form-label" for="email">Email</label>
            <div class="col-10">
                <form:input path="email" type="text" name="email" id="email" class="form-control"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-2 col-form-label" for="portable">Portable</label>
            <div class="col-10">
                <form:input path="portable" type="text" name="portable" id="portable" class="form-control"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-2 col-form-label" for="fixe">Fixe</label>
            <div class="col-10">
                <form:input path="fixe" type="text" name="fixe" id="fixe" class="form-control"/>
            </div>
        </div>

       <div class="form-group row">
           <label class="col-2 col-form-label" for="fixe">Entreprise</label>
               <div class="col-10">
                   <form:select class="form-control" path="entrepriseById">
                       <form:options items="${entreprises}" itemLabel="nom" itemValue="id" class=""/>
                   </form:select>
               </div>
       </div>

        <div class="form-group row">
            <label class="col-2 col-form-label" for="fonction">Fonction</label>
            <div class="col-10">
                <form:input path="fonction" type="text" name="fonction" id="fonction" class="form-control"/>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-2 col-form-label" for="fixe">duree relance (j)</label>
            <div class="col-10">
                <form:input path="dureeRelance" type="number" name="dureeRelance" id="dureeRelance" class="form-control"/>
            </div>
        </div>

        <button type="submit" class="btn btn-lg btn-primary btn-block m-3 ">${type}</button>
    </form:form>
</div>

<script>
    function togglePictureBlocks() {
        let x = document.getElementById("togglePictureOptions");
        if (x.getAttribute("value")  === "URL") {
            x.setAttribute("value","Upload");
            document.getElementById("photoFile").style.display = "block";
            document.getElementById("photoUrl").style.display = "none";
        } else {
            x.setAttribute("value","URL");
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