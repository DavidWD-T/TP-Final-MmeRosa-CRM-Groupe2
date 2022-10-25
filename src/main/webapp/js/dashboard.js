    document.addEventListener('DOMContentLoaded', function init() {

        function firstChart() {

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
                            if (e.etatProspection === "À contacter"){
                                aContacter++
                            }
                        })
                        document.getElementById("toContact").setAttribute("value", aContacter);

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
                    ['A contacter', parseInt(document.getElementById("toContact").getAttribute("value"))]
                ]);

                // Set chart options
                var options = {
                    'title': 'Clients par statut',
                    pieHole: 0.4,
                    colors: ["red"]
                };
                if(document.getElementById("toContact").getAttribute("value") !== "0"){
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
                    title: 'Nouveaux clients sur les 3 derniers mois',
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
                    title: 'Nouveaux prospects sur les 3 derniers mois',

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

        // function sixthChart(){
        //
        //     function totalEntreprises() {
        //         const api_url = "http://localhost:8080/allEntreprises";
        //
        //         var response = fetch(api_url,
        //             {
        //                 method: "GET",
        //                 headers: {
        //                     'Accept': 'application/json',
        //                     'Content-Type': 'application/json',
        //                 },
        //             })
        //             .then((response) => response.json())
        //             .then((responseData) => {
        //                 document.getElementById("totalEntreprise").setAttribute("value", responseData.length);
        //                 return responseData;
        //             })
        //             .catch(error => console.warn(error));
        //     }
        //
        //     totalEntreprises()
        //
        //
        //     // Load the Visualization API and the corechart package.
        //     google.charts.load('current', {'packages': ['gauge']});
        //
        //     // Set a callback to run when the Google Visualization API is loaded.
        //     google.charts.setOnLoadCallback(drawChart);
        //
        //     // Callback that creates and populates a data table,
        //     // instantiates the pie chart, passes in the data and
        //     // draws it.
        //     function drawChart() {
        //
        //         var data = google.visualization.arrayToDataTable([
        //             ['Entreprise', 'Nombre'],
        //             ['Total entreprise', document.getElementById("totalEntreprise").getAttribute("value")]
        //         ]);
        //         console.log(data)
        //
        //         // Set chart options
        //         var options = {
        //             title: "Nombre total d'entreprise",
        //             colors: ["green"],
        //             width: 400, height: 120,
        //             redFrom: 90, redTo: 100,
        //             yellowFrom:75, yellowTo: 90,
        //             minorTicks: 5
        //         };
        //
        //         let nbTotalEntreprise = document.getElementById("totalEntreprise").getAttribute("value")
        //         if(nbTotalEntreprise > 0) {
        //             var chart = new google.visualization.Gauge(document.getElementById('chart_div6'));
        //             chart.draw(data, options);
        //
        //             console.log(nbTotalEntreprise)
        //
        //             setInterval(function() {
        //                 data.setValue(0, 1, 40 + Math.round(60 * Math.random()));
        //                 chart.draw(data, options);
        //             }, 13000);
        //             // setInterval(function() {
        //             //     data.setValue(1, 1, 40 + Math.round(60 * Math.random()));
        //             //     chart.draw(data, options);
        //             // }, 5000);
        //             // setInterval(function() {
        //             //     data.setValue(2, 1, 60 + Math.round(20 * Math.random()));
        //             //     chart.draw(data, options);
        //             // }, 26000);
        //         }else{
        //             document.getElementById('chart_div6').classList.add("d-none");
        //         }
        //     }
        // }
        // sixthChart()


        function totalEvent() {
            const api_url = "http://localhost:8080/allEventsSortByDate";

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
                    if (responseData.length > 3){
                        console.log(responseData)
                        let h2 = document.createElement("h2")
                        h2.innerHTML = "Evenements a venir"
                        document.getElementById("chart_div6").appendChild(h2)
                        if(responseData.length > 3){
                            let eventListCount = responseData.length > 3 ? 3 : responseData.length;
                            for (let i = 0; i < eventListCount  ; i++) {
                                let a = document.createElement("a")
                                a.setAttribute("href", responseData[i].url)
                                a.classList.add("link-secondary")
                                a.classList.add("text-decoration-none")
                                document.getElementById("chart_div6").appendChild(a)


                                let div = document.createElement("div")
                                div.classList.add("card")
                                div.classList.add("m-1")
                                div.classList.add("p-1")
                                a.appendChild(div)

                                let p = document.createElement("p")
                                p.classList.add("card-title")
                                p.classList.add("text-center")
                                p.classList.add("text-uppercase")
                                p.classList.add("text-dark")
                                p.innerHTML = responseData[i].title
                                div.appendChild(p)

                                let p1 = document.createElement("p")
                                p1.classList.add("card-text")
                                p1.classList.add("text-dark")
                                p1.classList.add("text-center")
                                let date = new Date(responseData[i].start)
                                let month = ["Janvier", "Fevrier", "Mars", "Avril", "Mai", "Juin", "Juillet", "Aout", "Septembre", "Octobre", "Novembre", "Decembre"]
                                p1.innerHTML = "Le " + date.getDate() + " " + month[date.getMonth()] + " " + date.getFullYear()
                                div.appendChild(p1)

                                let p2 = document.createElement("p")
                                p2.classList.add("card-text")
                                p2.classList.add("text-dark")
                                p2.classList.add("text-center")
                                p2.innerHTML = "De " + responseData[i].start.slice(12, 16) + " a " + responseData[i].end.slice(11, 16)
                                div.appendChild(p2)
                            }
                        }
                    }


                    // document.getElementById("totalEntreprise").setAttribute("value", responseData.length);
                    return responseData;
                })
                .catch(error => console.warn(error));
        }
        totalEvent()


    })




