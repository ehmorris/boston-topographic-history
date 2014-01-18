$('.map polygon').on 'click', ->
  year_target = $(@).attr('class').replace /\D+/, ''
  $(".description-text[data-year=#{year_target}]").toggleClass 'active'
