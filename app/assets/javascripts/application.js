//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require_tree .

$('#sandbox-container input').datepicker({
    format: "dd/mm/yyyy",
    weekStart: 1,
    daysOfWeekHighlighted: "0,6"
});
