Mycms.Initializer =
  exec: (pageName) ->
    if pageName && Mycms[pageName]
      Mycms[pageName]['init']()

  currentPage: ->
    return '' unless $('#content-wrapper > section').attr('id')

    sectionId   = $('#content-wrapper > section').attr('id').split('-')
    prefix  = Mycms.Util.capitalize(sectionId[0])
    if sectionId[1]
      suffix  = Mycms.Util.capitalize(sectionId[1])
      prefix + suffix
    else
      prefix

  init: ->
    Mycms.Initializer.exec('Common')
    if @currentPage()
      Mycms.Initializer.exec(@currentPage())

$(document).on 'ready page:load', ->
  Mycms.Initializer.init()