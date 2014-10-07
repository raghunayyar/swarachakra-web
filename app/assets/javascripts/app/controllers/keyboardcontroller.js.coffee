app.controller "KeyboardController", [
  "$scope"
  "Restangular"
  "LanguageModel"
  "KeyboardModel"
  "$sce"
  ($scope, Restangular, LanguageModel, KeyboardModel,$sce) ->
    $scope.languages = LanguageModel.getAll()
    languageResource = Restangular.one("languages")
    angular.element("#chakra").css "display", "none"
    languageResource.getList("all").then (languageobject) ->

      LanguageModel.addAll languageobject

      KeyboardModel.addlanguage languageobject
      $scope.onscreen = KeyboardModel.getallkeys()

      console.log $scope.onscreen

      # Return Keys of Individual Tables
      $scope.firstmaintablekeys = KeyboardModel.maintablelayout1()
      $scope.secondmaintablekeys = KeyboardModel.maintablelayout2()
      $scope.thirdmaintablekeys = KeyboardModel.maintablelayout3()
      $scope.forthmaintablekeys = KeyboardModel.maintablelayout4()

      $scope.firsttablekeys = KeyboardModel.firsttablelayout()
      $scope.lasttablekeys = KeyboardModel.lasttablelayout()

      $scope.lastrowkeys = KeyboardModel.lastrowlayout()


      # Todo : Current Language should be selected one.
      $scope.currentlanguage = $scope.languages[0]
      $scope.currentlanguagename = $scope.currentlanguage.name
      return

    $scope.displaychakra = (keycode, unicode, event) ->
      angular.element("#chakra").css("left", event.screenX - 70).css("top", event.screenY - 180).css "display", "block"
      angular.element("#innerchakra").css "position", "absolute"
      $scope.currentkey = unicode
      return

    $scope.hidechakra = ->
      angular.element("#chakra").css "display", "none"
      return

    $scope.shifttable = ->
      $scope.frame1 = not $scope.frame1
      return

    $scope.sharetext = ->
      return

    return
]