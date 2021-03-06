$(document).on('click','.link-cart', ->
  showCart()
).on('click', '.keep-shopping', ->
  hideCart()
  $.ajax(
    type: 'POST'
    url: $('.cart-action-text').attr('data-path')
  )
)

$(document).on('click', '.checkout-link', ->
  sessionStorage.setItem('data-step', 'checkout')
)

$('.add-to-cart-img-button').click(->
  showCart()
)

showCart = () ->
  $('#cart-div').attr('data_state', 'showed')

hideCart = () ->
  $('#cart-div').attr('data_state', 'hidden')

$(document).on('click', '.remove', ->
  current_item = $(this).parents('li.cart-item, .line-item')
  current_item.slideUp(300, ->
    current_item.remove()
  )
)

