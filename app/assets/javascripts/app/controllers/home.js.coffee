# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app.controller "HomeController",
  [ "$scope", "Restangular", "LanguageModel", ($scope, Restangular, LanguageModel) ->
        $scope.languages = LanguageModel.getAll()
        languageResource = Restangular.one("languages")
        languageResource.getList("enabled").then (languages) ->
          LanguageModel.addAll languages
          return
        return
  ]