$('.link-cart').click( ->
  $('#cart-div').attr('data_state', 'showed')
)

$('.keep-shopping').click( ->
  $('#cart-div').attr('data_state', 'hidden')
)

