jQuery ->

  $('#revenue_post_movie_title').autocomplete
    source: $('#revenue_post_movie_title').data('autocomplete-source')


  $('.ui-autocomplete').addClass('f-dropdown');
