$ ->
  plotGraph()
  $('.map polygon').on 'click', ->
    activateMapSection(@)

  $('.year').on 'click', ->
    if !$(@).hasClass('active')
      activateMapSection(findMapSectionViaTimeline(@))

  $('.year .close').on 'click', ->
    closeAllYears()
    return false

  $('.year').hover ->
    if !$(@).hasClass('active')
      activateMapHint(@)
  , deactivateHints

  $('.map polygon').hover ->
    if !$(@).attr('active')
      activateTimelineHint(@)
  , deactivateHints

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
  graph_target = findTimelineItemViaMap(map_section)
  closeAllYears()
  graph_target.addClass 'active'
  $(map_section).attr 'active', 'active'

closeAllYears = ->
  $('.year').removeClass 'active'
  $(".map polygon").attr 'active', ''

activateMapHint = (timeline_item) ->
  map_section = findMapSectionViaTimeline(timeline_item)
  $(map_section).attr 'hint', 'hint'

activateTimelineHint = (map_section) ->
  timeline_item = findTimelineItemViaMap(map_section)
  $(timeline_item).addClass 'hint'

deactivateHints = ->
  $('.year').removeClass 'hint'
  $('.map polygon').attr 'hint', ''

# PRIVATE / HELPERS

findMapSectionViaTimeline = (timeline_item) ->
  map_target = $(timeline_item).data('name')
  $(".map .#{map_target}")

findTimelineItemViaMap = (map_section) ->
  graph_target = $(map_section).attr('class')
  $(".year[data-name=#{graph_target}]")
