# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app.controller "AppController",
  [ "$scope", "Restangular", "LanguageModel", ($scope, Restangular, LanguageModel) ->
    
    $scope.languages = LanguageModel.getAll()
    languageResource = Restangular.one("languages")

    #Loads enabled languages to language model for controller - controller sharing.
    #languageResource.getList('all').then (languageobject) ->
    #LanguageModel.addAll(languageobject)
    #return
    return
  ]