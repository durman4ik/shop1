if window.location.pathname.length <= 3
  $('.body').attr('data_page', 'index')
else
  $('.body').attr('data_page', 'noindex')


$(document).on('click', '.reveal-details', ->
  $('.product-essentials').slideUp(300, ->
    $('.product-details').slideDown(300)
  )
)

$(document).on('click', '.hide-details', ->
  $('.product-details').slideUp(300, ->
    $('.product-essentials').slideDown(300)
  )
)