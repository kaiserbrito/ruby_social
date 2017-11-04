$(document).ready(function() {
  let friends_calendar = $('#calendar').fullCalendar({
    defaultView: 'month',
    events: {
      url: '/events/calendar',
      type: 'GET',
      error: function() {
        alert('There was an error fetching the events');
      }
    }
  });
});
