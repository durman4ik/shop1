#$(document).on('ready',  ->
#  if sessionStorage.getItem("is_cart_visible") == 'showed'
#    showCart()
#  else
#    hideCart()
#)

$(document).on('click','.link-cart', ->
  showCart()
)

$(document).on('click', '.keep-shopping', ->
  hideCart()
)

$('.add-to-cart-img-button').click(->
  showCart()
)

showCart = () ->
#  sessionStorage.setItem("is_cart_visible", "showed")
  $('#cart-div').attr('data_state', 'showed')

hideCart = () ->
#  sessionStorage.setItem("is_cart_visible", "hidden")
  $('#cart-div').attr('data_state', 'hidden')

$(document).on('click', '.remove', ->

  current_item = $(this).parents('li.cart-item')
  $.ajax(
    type: 'POST'
    url: 'line_items/' + current_item.attr('data-line-id')
    data: { _method: "DELETE" },
    success: ->
      current_item.remove()
  )
)