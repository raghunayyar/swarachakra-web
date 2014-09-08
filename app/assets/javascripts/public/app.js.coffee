
app = angular.module("Swarachakra", [
  "ngAnimate"
  "restangular"
  "ngRoute"
])
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app.controller "HomeController", [
  "$scope"
  "$window"
  "Restangular"
  ($scope, $window, $routeParams, Restangular, LanguageModel) ->
    $scope.languages = LanguageModel.getAll()
    languageResource = Restangular.all("languages")
    languageResource.getList().then (languages) ->
      LanguageModel.addAll languages

    console.log 'wah'
]
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
    addAll: (languages) ->
      i = 0
      while i < languages.length
        @add languages[i]
      i++
    getAll: ->
      @calendars
    get: (id) ->
      i = 0
      while i < @languages.length
        if id is @languages[i].id
          @languageid = @languages[i]
        break
      i++
      @calendarId
    remove: (id) ->
      i = 0
      while i < @languages.length
        if @languages[i].id is id
          @languages.splice i, 1
          delete @languageid[id]
        
          @deleted = id: id
          break
      i++
  return
new LanguageModel()
