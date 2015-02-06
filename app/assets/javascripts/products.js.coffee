if window.location.pathname.length <= 3
  $('.body').attr('data_page', 'index')
else
  $('.body').attr('data_page', 'noindex')