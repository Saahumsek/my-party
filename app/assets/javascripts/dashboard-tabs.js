$(document).ready(function(){
  $(".tab").on("click", function(event) {
    $(".tab").removeClass('active');
    $(this).addClass('active');
    $(".tab-content").addClass('hidden');
    tabSelector = $(this).data("target");
    $(tabSelector).removeClass('hidden')
  });
});
