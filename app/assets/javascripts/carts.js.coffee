$(document).on('click','.link-cart', ->
  showCart()
)

$(document).on('click', '.keep-shopping', ->
  hideCart()
  $.ajax(
    type: 'POST'
    url: $('.cart-action-text').attr('data-path')
  )
)

$('.add-to-cart-img-button').click(->
  showCart()
)

showCart = () ->
  $('#cart-div').attr('data_state', 'showed')

hideCart = () ->
  $('#cart-div').attr('data_state', 'hidden')

$(document).on('click', '.remove', ->
  current_item = $(this).parents('li.cart-item')
  current_item.slideUp(300, ->
    current_item.remove()
  )
)