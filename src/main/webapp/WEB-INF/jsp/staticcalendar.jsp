<!DOCTYPE html>

<html lang="fr">

<head>

	<meta charset='utf-8' content="Cory Sanoy" name="Author" />

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<link href="http://fullcalendar.io/js/fullcalendar-2.2.5/fullcalendar.css" rel="stylesheet"></link>
	<link href="http://fullcalendar.io/js/fullcalendar-2.2.5/fullcalendar.print.css"  rel="stylesheet" media="print"></link>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js" type="text/javascript"></script>
	<script src="http://cdn.jsdelivr.net/webjars/jquery/3.4.1/jquery.min.js" type="text/javascript"></script>
	<script src="http://fullcalendar.io/js/fullcalendar-2.2.5/fullcalendar.min.js" type="text/javascript"></script>


<%--	<style>--%>

		/*body {*/
		/*	margin: 40px 10px;*/
		/*	padding: 0;*/
		/*	font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;*/
		/*	font-size: 14px;*/
		/*}*/

		/*#calendar {*/
		/*	max-width: 900px;*/
		/*	margin: 0 auto;*/
		/*}*/

<%--	</style>--%>
<%--</head>--%>
<body>
<header>
	<jsp:include page="header.jsp"/>
</header>
<div id='calendar'></div>
</body>
<script>
	$(document).ready(function() {

		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			defaultDate: Date.now(),
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events: {
				url: '/allevents',
				type: 'GET',
				error: function() {
					alert('there was an error while fetching events!');
				},
				//color: 'blue',   // a non-ajax option
				//textColor: 'white' // a non-ajax option
			}
		});

	});
</script>
</html>