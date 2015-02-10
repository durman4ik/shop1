$(document).on('mouseover', '.dropdown', ->
  $(".dropdown-block").slideDown(150);
).on('mouseleave', '.dropdown', ->
  $(".dropdown-block").slideUp(150);
)
