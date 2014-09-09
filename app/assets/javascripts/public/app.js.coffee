
app = angular.module("Swarachakra", [
  "ngAnimate"
  "restangular"
  "ngRoute"
])
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app.controller "HomeController",
  [ "$scope", "Restangular", "LanguageModel", ($scope, Restangular, LanguageModel) ->
        $scope.languages = LanguageModel.getAll()
        languageResource = Restangular.one("swarachakra").one("languages")
        languageResource.getList("enabled").then (languages) ->
          LanguageModel.addAll languages
          return
        return
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
      return

    getAll: ->
      @calendars
      return

  new LanguageModel()
