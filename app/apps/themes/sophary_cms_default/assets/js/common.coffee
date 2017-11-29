Mycms.Common = do ->
  _init = ->
    _navbarToggle()

  _navbarToggle = ->
    $('ul.dropdown-menu.submenu-dropdown [data-toggle=dropdown]').on 'click', (e) ->
      event.preventDefault()
      event.stopPropagation()
      $('ul.dropdown-menu.submenu-dropdown [data-toggle=dropdown]').parent().removeClass('open')
      $(this).parent().addClass('open')

  { init: _init }