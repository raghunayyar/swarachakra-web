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