$(document).on('ready', ->
  if sessionStorage.getItem('data-step') == 'review'
    go_to_review()
  else
    $('.step').text('1')
)

guard = $('.click-guard')

$(document).on('click', '.next-step', ->
  $('.shipping').slideUp(600, ->
    go_to_review()
    sessionStorage.setItem('data-step', 'review')
  ).slideDown(600)
)

$(document).on('click', '.show-line-items-summary', ->
  $('.order-summary').toggleClass('line-items-summary-active')
)

$(document).on('click', '.apply', ->
  sessionStorage.setItem('data-step', 'checkout')
  go_to_checkout()
)

$(document).on('click', '.back', ->
  $('.shipping').slideUp(600, ->
    sessionStorage.setItem('data-step', 'checkout')
    go_to_checkout()
  ).slideDown(600)
)


review_div = $('.review div.foo')
checkout_div = $('.checkout-step div.foo')
review_click_guard = $('.review div.foo div.click-guard')
checkout_click_guard = $('.checkout-step div.foo div.click-guard')

go_to_review = () ->
  $('.step').text('2')
  review_div.addClass('active')
  review_click_guard.remove()
  checkout_div.removeClass('active').append(guard)

go_to_checkout = () ->
  $('.step').text('1')
  checkout_div.addClass('active')
  checkout_click_guard.remove()
  review_div.append(guard).removeClass('active')

