//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require jquery-fileupload/basic
//= require underscore
//= require gmaps/google
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require_tree .


$('#sandbox-container input').datepicker({
    format: "dd/mm/yyyy",
    weekStart: 1,
    daysOfWeekHighlighted: "0,6"
});
