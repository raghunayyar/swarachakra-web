# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app.controller "KeyboardController",
  [ "$scope", "Restangular", "LanguageModel", ($scope, Restangular, LanguageModel) ->

      $scope.languages = LanguageModel.getAll()
      languageResource = Restangular.one("languages")
      languageResource.getList('all').then (languageobject) ->
        LanguageModel.addAll(languageobject)
        console.log $scope.languages
        return
      return
  ]