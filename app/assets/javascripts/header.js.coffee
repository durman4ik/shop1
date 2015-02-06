$('.dropdown').mouseover( ->
  $(".dropdown-block").slideDown(150);
).mouseleave(->
  $(".dropdown-block").slideUp(150);
)
