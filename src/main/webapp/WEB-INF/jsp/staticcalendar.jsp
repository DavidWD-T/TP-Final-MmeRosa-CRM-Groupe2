<jsp:include page="head.jsp"/>
<body>
<header>
	<jsp:include page="header.jsp"/>
</header>
<div class="container">
	<div class="contacts-list rounded-4 p-3">
		<div id='calendar'></div>
	</div>
</div>
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
			//editable: true,
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