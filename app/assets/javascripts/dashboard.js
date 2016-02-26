$(function(){
  $(".tab").on("click", function(e){
    // Change active tab
    $('.active').toggleClass('active');
    $(this).toggleClass('active');
    // Hide all tab-content (use class="hidden")
    $('.tab-content').addClass('hidden');
    // Show target tab-content (use class="hidden")
     $($(this).data("target")).toggleClass("hidden");
  });
});


