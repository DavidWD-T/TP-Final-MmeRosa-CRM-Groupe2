<jsp:include page="head.jsp"/>

<%--<style>--%>
<%--    body{--%>
<%--        background-color:#fff;--%>
<%--    }--%>
<%--    .contacts-list{--%>
<%--        background-color: #f9f9ff;--%>
<%--    }--%>
<%--    .col-form-label{--%>
<%--        background-color: rgba(194,215,255,0.93);--%>
<%--        color: #3b76e1;--%>
<%--        margin-bottom: 4px;--%>
<%--        border-radius: 8px;--%>
<%--    }--%>
<%--    .form-control{--%>
<%--        background-color: aliceblue;--%>
<%--    }--%>

<%--</style>--%>

<body>
<header>
    <jsp:include page="header.jsp"/>
</header>
<div class="container-fluid text-center">
    <form action="${pageContext.request.contextPath}/signin" method="post" class="contacts-list rounded-4 p-3 mb-2" style="max-width: 600px; margin: 0 auto;">
        <div>
            <h1>User Registration - Sign In</h1>
        </div>
        <div class="m-3">
            <div class="form-group row">
                <label class="col-2 col-form-label" for="email">E-mail: </label>
                <div class="col-10">
                    <input type="email" name="email" id="email" class="form-control" required />
                </div>
            </div>

            <div class="form-group row mt-4">
                <label class="col-2 col-form-label" for="password">Password: </label>
                <div class="col-10">
                    <input type="password" name="password"  id="password"  class="form-control" />
                </div>
            </div>

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <div>
                <button type="submit" class="btn btn-primary mt-4">Sign In</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>