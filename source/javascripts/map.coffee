$ ->
  plotGraph()
  $('.map polygon').on 'click', activateMapSection(@)

plotGraph = ->
  $('.graph .year').each ->
    boston_founded = 1630
    end_year = 2000
    total_years = end_year - boston_founded
    year = $(@).data('year')
    duration = $(@).data('duration')

    left_percent = (year - boston_founded) / total_years * 100
    width_percent = duration / total_years * 100

    $(@).css {
      left: left_percent+'%',
      width: width_percent+'%'
    }

activateMapSection = (map_section) ->
  year_target = $(map_section).attr('class').replace /\D+/, ''

  $(".description-text").removeClass 'active'
  $(".description-text[data-year=#{year_target}]").addClass 'active'

  $(".map polygon").attr 'active', ''
  $(map_section).attr 'active', 'active'
