# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app.controller "TextareaController",
  [ "$scope", "Restangular", "LanguageModel", "SaveModel", ($scope, Restangular, LanguageModel, SaveModel) ->

      $scope.languages = LanguageModel.getAll()

      $scope.save = () ->
        content = $scope.content
        SaveModel.add content
        return

      return
  ]