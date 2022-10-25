    document.addEventListener('DOMContentLoaded', function init() {

        function firstChart() {

            // function totalEntreprises() {
            //     const api_url = "http://localhost:8080/allEntreprises";
            //
            //     var response = fetch(api_url,
            //         {
            //             method: "GET",
            //             headers: {
            //                 'Accept': 'application/json',
            //                 'Content-Type': 'application/json',
            //             },
            //         })
            //         .then((response) => response.json())
            //         .then((responseData) => {
            //             document.getElementById("totalEntreprise").setAttribute("value", responseData.length);
            //             return responseData;
            //         })
            //         .catch(error => console.warn(error));
            // }
            //
            // totalEntreprises()

            function totalProspect() {
                const api_url = "http://localhost:8080/allProspects";

                var response = fetch(api_url,
                    {
                        method: "GET",
                        headers: {
                            'Accept': 'application/json',
                            'Content-Type': 'application/json',
                        },
                    })
                    .then((response) => {
                        return response.json()
                    })
                    .then((responseData) => {
                        document.getElementById("totalProspect").setAttribute("value", responseData.length);

                        return responseData;
                    })
                    .catch(error => console.warn(error));
            }

            totalProspect()

            function totalClient() {
                const api_url = "http://localhost:8080/allClients";

                var response = fetch(api_url,
                    {
                        method: "GET",
                        headers: {
                            'Accept': 'application/json',
                            'Content-Type': 'application/json',
                        },
                    })
                    .then((response) => response.json())
                    .then((responseData) => {
                        document.getElementById("totalClient").setAttribute("value", responseData.length);
                        return responseData;
                    })
                    .catch(error => console.warn(error));
            }

            totalClient();


        // Load the Visualization API and the corechart package.
            google.charts.load('current', {'packages': ['corechart']});

        // Set a callback to run when the Google Visualization API is loaded.
            google.charts.setOnLoadCallback(drawChart);

        // Callback that creates and populates a data table,
        // instantiates the pie chart, passes in the data and
        // draws it.
            function drawChart() {

                // Create the data table.
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Topping');
                data.addColumn('number', 'Slices');
                data.addRows([
                    ['Clients', parseInt(document.getElementById("totalClient").getAttribute("value"))],
                    ['Prospects', parseInt(document.getElementById("totalProspect").getAttribute("value"))],
                    // ['Entreprise', parseInt(document.getElementById("totalEntreprise").getAttribute("value"))]
                ]);

                // Set chart options
                var options = {
                    'title': 'Clients vs Prospects',
                    pieHole: 0.4,
                    colors: ["#0D9B36", "orange"]
                };
                let clientsTotal = parseInt(document.getElementById("totalClient").getAttribute("value"));
                let prospectsTotal = parseInt(document.getElementById("totalProspect").getAttribute("value"));
                // let entreprisesTotal = parseInt(document.getElementById("totalEntreprise").getAttribute("value"));

                if((clientsTotal > 0) || (prospectsTotal > 0)){
                    // Instantiate and draw our chart, passing in some options.
                    var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
                    chart.draw(data, options);
                }else{
                    document.getElementById('chart_div').setAttribute("hidden", true)
                }

            }
        }
        firstChart()
        function secondChart(){
            function prospectByStatus() {
                const api_url = "http://localhost:8080/allProspects";

                var response = fetch(api_url,
                    {
                        method: "GET",
                        headers: {
                            'Accept': 'application/json',
                            'Content-Type': 'application/json',
                        },
                    })
                    .then((response) => {
                        return response.json()
                    })
                    .then((responseData) => {
                        let aucuneProspection = 0;
                        let prospectionEnCours = 0;
                        let aRelancer = 0;
                        responseData.forEach(e => {
                            if (e.etatProspection == "aucune prospection"){
                                aucuneProspection =+1
                            }else if (e.etatProspection == "prospection en cours") {
                                prospectionEnCours += 1
                            }else if (e.etatProspection == "a relancer") {
                                aRelancer += 1
                            }
                        })
                        document.getElementById("aucuneProspection").setAttribute("value",aucuneProspection);
                        document.getElementById("prospectionEnCours").setAttribute("value", prospectionEnCours);
                        document.getElementById("aRelancer").setAttribute("value", aRelancer);

                    })
                    .catch(error => console.warn(error));
            }
            prospectByStatus()

            // Load the Visualization API and the corechart package.
            google.charts.load('current', {'packages': ['corechart']});

            // Set a callback to run when the Google Visualization API is loaded.
            google.charts.setOnLoadCallback(drawChart);

            // Callback that creates and populates a data table,
            // instantiates the pie chart, passes in the data and
            // draws it.
            function drawChart() {

                // Create the data table.
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Topping');
                data.addColumn('number', 'Slices');
                data.addRows([
                    ['Aucune prospection', parseInt(document.getElementById("aucuneProspection").getAttribute("value"))],
                    ['Prospection en cours', parseInt(document.getElementById("prospectionEnCours").getAttribute("value"))],
                    ['A relancer', parseInt(document.getElementById("aRelancer").getAttribute("value"))]
                ]);

                // Set chart options
                var options = {
                    'title': 'Prospects par statut',
                    pieHole: 0.4,
                    colors: ["grey", "orange"]
                };
                let aucuneProspectionTotal = parseInt(document.getElementById("aucuneProspection").getAttribute("value"));
                let prospectionEnCoursTotal = parseInt(document.getElementById("prospectionEnCours").getAttribute("value"));
                let aRelancerTotal = parseInt(document.getElementById("aRelancer").getAttribute("value"));
                // Instantiate and draw our chart, passing in some options.
                if ((aucuneProspectionTotal > 0) || (prospectionEnCoursTotal > 0) || (aRelancerTotal > 0)){
                    var chart = new google.visualization.PieChart(document.getElementById('chart_div2'));
                    chart.draw(data, options);
                }else{
                    document.getElementById('chart_div2').setAttribute("hidden", true)
                }

            }

        }
        secondChart()
        function thirdChart(){
            function clientByStatus() {
                const api_url = "http://localhost:8080/allClients";

                var response = fetch(api_url,
                    {
                        method: "GET",
                        headers: {
                            'Accept': 'application/json',
                            'Content-Type': 'application/json',
                        },
                    })
                    .then((response) => {
                        return response.json()
                    })
                    .then((responseData) => {
                        let aContacter = 0;
                        responseData.forEach(e => {
                            if (e.etatProspection == "a contacter"){
                                aContacter =+1
                            }
                        })
                        document.getElementById("aContacter").setAttribute("value", aContacter);

                    })
                    .catch(error => console.warn(error));
            }
            clientByStatus()


            // Load the Visualization API and the corechart package.
            google.charts.load('current', {'packages': ['corechart']});

            // Set a callback to run when the Google Visualization API is loaded.
            google.charts.setOnLoadCallback(drawChart);

            // Callback that creates and populates a data table,
            // instantiates the pie chart, passes in the data and
            // draws it.
            function drawChart() {

                // Create the data table.
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Topping');
                data.addColumn('number', 'Slices');
                data.addRows([
                    ['A contacter', parseInt(document.getElementById("aContacter").getAttribute("value"))]
                ]);

                // Set chart options
                var options = {
                    'title': 'Clients par statut',
                    pieHole: 0.4,
                    colors: ["red"]
                };
                if(document.getElementById("aContacter").getAttribute("value") !== "0"){
                    // Instantiate and draw our chart, passing in some options.
                    var chart = new google.visualization.PieChart(document.getElementById('chart_div3'));
                    chart.draw(data, options);
                }else{
                    document.getElementById('chart_div3').setAttribute("hidden", true)
                }
            }
        }
        thirdChart()
        function fourthChart(){
            function clientByMonth() {
                const api_url = "http://localhost:8080/allClients";

                var response = fetch(api_url,
                    {
                        method: "GET",
                        headers: {
                            'Accept': 'application/json',
                            'Content-Type': 'application/json',
                        },
                    })
                    .then((response) => {
                        return response.json()
                    })
                    .then((responseData) => {
                        let date = new Date();
                        let thisMonth = 0;
                        let previousMonth = 0;
                        let beforePreviousMonth = 0;
                        responseData.forEach(e => {
                            let monthCreate = e.dateCreationProspection.substring(5,7);
                            if (monthCreate == date.getMonth()+1){
                               thisMonth++
                            }else if(monthCreate == date.getMonth()){
                                previousMonth++
                            }else if(monthCreate == date.getMonth()-1){
                                beforePreviousMonth++
                            }
                        })
                        document.getElementById("thisMonth").setAttribute("value", thisMonth);
                        document.getElementById("previousMonth").setAttribute("value", previousMonth);
                        document.getElementById("beforePreviousMonth").setAttribute("value", beforePreviousMonth);
                    })
                    .catch(error => console.warn(error));
            }
            clientByMonth()


            // Load the Visualization API and the corechart package.
            google.charts.load('current', {'packages': ['corechart']});

            // Set a callback to run when the Google Visualization API is loaded.
            google.charts.setOnLoadCallback(drawChart);

            // Callback that creates and populates a data table,
            // instantiates the pie chart, passes in the data and
            // draws it.
            function drawChart() {
                const monthNames = ["January", "February", "March", "April", "May", "June",
                    "July", "August", "September", "October", "November", "December"
                ];

                const d = new Date();

                // Create the data table.
                var data = google.visualization.arrayToDataTable([
                    ['Month', 'client'],
                    [monthNames[d.getMonth()-2],  parseInt(document.getElementById("beforePreviousMonth").getAttribute("value"))],
                    [monthNames[d.getMonth()-1],  parseInt(document.getElementById("previousMonth").getAttribute("value"))],
                    [monthNames[d.getMonth()],  parseInt(document.getElementById("thisMonth").getAttribute("value"))]
                ]);

                // Set chart options
                var options = {
                    title: 'Nouveaux clients par mois',
                    curveType: 'function',
                    legend: { position: 'bottom' },
                    colors: ["blue"]
                };

                let thisMonth = parseInt(document.getElementById("thisMonth").getAttribute("value"));
                let previousMonth = parseInt(document.getElementById("previousMonth").getAttribute("value"));
                let beforePreviousMonth = parseInt(document.getElementById("beforePreviousMonth").getAttribute("value"));
                // if(document.getElementById("aContacter").getAttribute("value") !== "0"){
                //     // Instantiate and draw our chart, passing in some options.
                //     var chart = new google.visualization.LineChart(document.getElementById('chart_div4'));
                //     chart.draw(data, options);
                // }else{
                //     document.getElementById('chart_div3').setAttribute("hidden", true)
                // }

                // Instantiate and draw our chart, passing in some options.
                if((thisMonth > 0) || (previousMonth > 0) || (beforePreviousMonth > 0)) {
                    var chart = new google.visualization.ColumnChart(document.getElementById('chart_div4'));
                    chart.draw(data, options);
                }else{
                    document.getElementById('chart_div4').classList.add("d-none")
                }
            }
        }
        fourthChart()

        function fifthChart(){
            function prospectByMonth() {
                const api_url = "http://localhost:8080/allProspects";

                var response = fetch(api_url,
                    {
                        method: "GET",
                        headers: {
                            'Accept': 'application/json',
                            'Content-Type': 'application/json',
                        },
                    })
                    .then((response) => {
                        return response.json()
                    })
                    .then((responseData) => {
                        let date = new Date();
                        let thisMonth = 0;
                        let previousMonth = 0;
                        let beforePreviousMonth = 0;
                        responseData.forEach(e => {
                            console.log(e.dateCreationProspection)
                            let monthCreate = e.dateCreationProspection.substring(5,7);
                            if (monthCreate == date.getMonth()+1){
                                thisMonth++
                            }else if(monthCreate == date.getMonth()){
                                previousMonth++
                            }else if(monthCreate == date.getMonth()-1){
                                beforePreviousMonth++
                            }
                        })
                        document.getElementById("thisMonthP").setAttribute("value", thisMonth);
                        document.getElementById("previousMonthP").setAttribute("value", previousMonth);
                        document.getElementById("beforePreviousMonthP").setAttribute("value", beforePreviousMonth);
                    })
                    .catch(error => console.warn(error));
            }
            prospectByMonth()


            // Load the Visualization API and the corechart package.
            google.charts.load('current', {'packages': ['corechart']});

            // Set a callback to run when the Google Visualization API is loaded.
            google.charts.setOnLoadCallback(drawChart);

            // Callback that creates and populates a data table,
            // instantiates the pie chart, passes in the data and
            // draws it.
            function drawChart() {
                const monthNames = ["January", "February", "March", "April", "May", "June",
                    "July", "August", "September", "October", "November", "December"
                ];

                const d = new Date();
                // Create the data table.
                var data = google.visualization.arrayToDataTable([
                    ['Month', 'prospect'],
                    [monthNames[d.getMonth()-2],  parseInt(document.getElementById("beforePreviousMonthP").getAttribute("value"))],
                    [monthNames[d.getMonth()-1],  parseInt(document.getElementById("previousMonthP").getAttribute("value"))],
                    [monthNames[d.getMonth()],  parseInt(document.getElementById("thisMonthP").getAttribute("value"))]
                ]);

                // Set chart options
                var options = {
                    title: 'Nouveaux prospects par mois',

                    colors: ["green"]
                };

                let thisMonth = parseInt(document.getElementById("thisMonthP").getAttribute("value"));
                let previousMonth = parseInt(document.getElementById("previousMonthP").getAttribute("value"));
                let beforePreviousMonth = parseInt(document.getElementById("beforePreviousMonthP").getAttribute("value"));
                if((thisMonth > 0) || (previousMonth > 0) || (beforePreviousMonth > 0)) {
                    var chart = new google.visualization.ColumnChart(document.getElementById('chart_div5'));
                    chart.draw(data, options);
                }else{
                    document.getElementById('chart_div5').classList.add("d-none");
                }
            }
        }
        fifthChart()


    })




