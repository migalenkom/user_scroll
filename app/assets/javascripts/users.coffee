$ ->
  if $('.pagination').length && $('#users').length
    $(window).scroll ->
      url = $('.pagination .next a').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').text("Loading more users...")
        $.getScript(url)
    $(window).scroll()
