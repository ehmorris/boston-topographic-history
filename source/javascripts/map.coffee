$ ->
  plotGraph()
  $('.map .land path:not(.original)').on 'click', ->
    activateDetailSectionViaMap(@)

  $('.year').on 'click', ->
    if !$(@).hasClass('active')
      activateDetailSectionViaMap(findMapSectionViaTimeline(@))

  $('.year .close').on 'click', ->
    closeAllYears()
    return false

  $('.year').hover ->
    if !$(@).hasClass('active')
      activateMapHint(@)
  , deactivateHints

  $('.map .land path').hover ->
    if !$(@).attr('active')
      activateTimelineHint(@)
  , deactivateHints

  $('.end-intro').on 'click', ->
    $('.intro').addClass 'inactive'
    $('.map').attr 'class', 'map active'
    $('.graph').addClass 'active'
    animateCurrentYear($('.current-year span:first'))
    $('.time-marker').addClass 'active'
    return false

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

animateCurrentYear = (year) ->
  if $(year).prev('span').length
    $(year).prev('span').css('opacity', 0)

  $(year).css('opacity', 1)

  if $(year).next('span').length  
    setTimeout ->
      animateCurrentYear($(year).next('span'))
    , 24.7

activateDetailSectionViaMap = (map_section) ->
  graph_target = findTimelineItemViaMap(map_section)
  closeAllYears()
  deactivateHints()
  $('.year').addClass 'inactive'
  $('.graph-key').addClass 'inactive'
  graph_target.removeClass('inactive').addClass 'active'
  $(map_section).attr 'active', 'active'

closeAllYears = ->
  $('.year').removeClass 'active'
  $('.year').removeClass 'inactive'
  $('.graph-key').removeClass 'inactive'
  $(".map .land path").attr 'active', ''

activateMapHint = (timeline_item) ->
  map_section = findMapSectionViaTimeline(timeline_item)
  $(map_section).attr 'hint', 'hint'

activateTimelineHint = (map_section) ->
  timeline_item = findTimelineItemViaMap(map_section)
  $(timeline_item).addClass 'hint'

deactivateHints = ->
  $('.year').removeClass 'hint'
  $('.map .land path').attr 'hint', ''

# PRIVATE / HELPERS

findMapSectionViaTimeline = (timeline_item) ->
  map_target = $(timeline_item).data('name')
  $(".map .#{map_target}")

findTimelineItemViaMap = (map_section) ->
  graph_target = $(map_section).attr('class')
  $(".year[data-name=#{graph_target}]")
