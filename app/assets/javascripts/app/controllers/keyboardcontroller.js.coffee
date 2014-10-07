app.controller "KeyboardController", [
  "$scope"
  "Restangular"
  "LanguageModel"
  "$sce"
  ($scope, Restangular, LanguageModel, $sce) ->
    languageResource = undefined
    $scope.languages = LanguageModel.getAll()
    languageResource = Restangular.one("languages")
    angular.element("#chakra").css "display", "none"
    languageResource.getList("all").then (languageobject) ->
      i = undefined
      j = undefined
      k = undefined
      totaljuniorrarray = undefined
      LanguageModel.addAll languageobject
      $scope.currentlanguage = $scope.languages[0].name
      $scope.totalrows = $scope.languages[0].csv.length
      grouped = []
      i = 0

      while i < $scope.totalrows
        div = Math.floor(i / 5)
        mod = i % 5
        grouped[div] = []  if mod is 0
        grouped[div][mod] = $scope.languages[0].csv[i]
        i++
      $scope.onscreen = grouped
      console.log grouped
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
      ->
]