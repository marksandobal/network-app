class window.Comments
  constructor: (container)->
    @container = $ container
    @container.on 'click', (e)->
      currentControl = $(e.target).attr('class')
      return if !currentControl.includes('btn')

      currentDiv = $(e.target).parents('.ml-2')
      form = currentDiv.find('.js--form')
      cssClass = form.attr('class')
      if cssClass.includes('sr-only')
        form.removeClass('sr-only')
      else
        form.addClass('sr-only')

$(document).on 'turbolinks:load', ->
  $('.js--comments').each ->
    new Comments this