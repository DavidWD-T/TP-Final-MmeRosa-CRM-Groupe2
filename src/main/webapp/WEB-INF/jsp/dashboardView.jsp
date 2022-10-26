<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"/>



<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.load('current', {'packages':['bar']});

    google.charts.setOnLoadCallback(drawChart);
    google.charts.setOnLoadCallback(drawChart2);
    google.charts.setOnLoadCallback(drawChart3);
    google.charts.setOnLoadCallback(drawChart4);

    let customersnb = ${customersByUser};
    let prospectsnb = ${propectsByUser};

    let prospectsnb1 = ${propectsByUser1};
    let prospectsnb2 = ${propectsByUser2};
    let prospectsnb3 = ${propectsByUser3};

    let customersnb1 = ${customersByUser1};
    let mois1 = ${mois1};
    let mois2 = ${mois2};
    let mois3 = ${mois3};

    function drawChart() {
        var data = google.visualization.arrayToDataTable([
            ['Part', 'Partner'],
            ['Clients', customersnb],
            ['Prospects', prospectsnb]
        ]);
        var options = {
            title: 'Clients vs Prospect'
        };
        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
        chart.draw(data, options);
    }

    function drawChart2() {
        var data = google.visualization.arrayToDataTable([
            ['Part', 'Partner'],
            ['Aucune prospection', prospectsnb1],
            ['Prospection en cours', prospectsnb2],
            ['A relancer', prospectsnb3]
        ]);
        var options = {
            title: 'Prospects par statut'
        };
        var chart = new google.visualization.PieChart(document.getElementById('piechart2'));
        chart.draw(data, options);
    }

    function drawChart3() {
        var data = google.visualization.arrayToDataTable([
            ['Part', 'Partner'],
            ['Autre', customersnb-customersnb1],
            ['A contacter', customersnb1]
        ]);
        var options = {
            title: 'Client par statut'
        };
        var chart = new google.visualization.PieChart(document.getElementById('piechart3'));
        chart.draw(data, options);
    }

    function drawChart4() {
        var data = google.visualization.arrayToDataTable([
            ['Month', 'Entreprise', 'Prospect', 'Client'],
            mois1,
            mois2,
            mois3
        ]);

        var options = {
            title: 'Nouvelles entrees par mois',
        };

        var chart = new google.charts.Bar(document.getElementById('piechart4'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
    }

</script>


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
        <div class="col-12 col-lg-4">
            <div class="card m-2">
                <div id="piechart"></div>
            </div>
        </div>
        <div class="col-12 col-lg-4">
            <div class="card m-2">
                <div id="piechart2"></div>
            </div>
        </div>
        <div class="col-12 col-lg-4">
            <div class="card m-2">
                <div id="piechart3"></div>
            </div>
        </div>
        <div class="col-12">
            <div class="card m-2">
                <div id="piechart4"></div>
            </div>
        </div>
    </div>
</div>

</body>