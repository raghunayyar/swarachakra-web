# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app.factory "LanguageModel", ->
  LanguageModel = ->
    @languages = []
    @languageid = {}
    return

  LanguageModel:: =
    add: (language) ->
      @languages.push language
      return

    getAll: ->
      @calendars
      return

  new LanguageModel()
