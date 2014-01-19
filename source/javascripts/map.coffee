$('.map polygon').on 'click', ->
  year_target = $(@).attr('class').replace /\D+/, ''

  $(".description-text").removeClass 'active'
  $(".description-text[data-year=#{year_target}]").addClass 'active'

  $(".map polygon").attr 'active', ''
  $(@).attr 'active', 'active'
