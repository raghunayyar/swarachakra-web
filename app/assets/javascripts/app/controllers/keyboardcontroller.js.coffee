app.controller "KeyboardController", [
  "$scope"
  "Restangular"
  "LanguageModel"
  ($scope, Restangular, LanguageModel) ->
    languageResource = undefined
    $scope.languages = LanguageModel.getAll()
    languageResource = Restangular.one("languages")
    languageResource.getList("all").then (languageobject) ->
      LanguageModel.addAll languageobject
      console.log $scope.languages
      # Static keyboard, the code should generate this form of data structure.
      $scope.onscreen = [
        [
          {
            keycode: "1"
            unicode: "\\u0D15"
            chakra: "1"
          }
          {
            keycode: "2"
            unicode: "\\u0D16"
            chakra: "1"
          }
          {
            keycode: "3"
            unicode: "\\u0D17"
            chakra: "1"
          }
          {
            keycode: "4"
            unicode: "\\u0D18"
            chakra: "1"
          }
          {
            keycode: "5"
            unicode: "\\u0D19"
            chakra: "1"
          }
        ]
        [
          {
            keycode: "6"
            unicode: "\\u0D1A"
            chakra: "1"
          }
          {
            keycode: "7"
            unicode: "\\u0D1B"
            chakra: "1"
          }
          {
            keycode: "8"
            unicode: "\\u0D1C"
            chakra: "1"
          }
          {
            keycode: "9"
            unicode: "\\u0D1D"
            chakra: "1"
          }
          {
            keycode: "10"
            unicode: "\\u0D1E"
            chakra: "1"
          }
        ]
        [
          {
            keycode: "1"
            unicode: "\\u0D15"
            chakra: "1"
          }
          {
            keycode: "2"
            unicode: "\\u0D16"
            chakra: "1"
          }
          {
            keycode: "3"
            unicode: "\\u0D17"
            chakra: "1"
          }
          {
            keycode: "4"
            unicode: "\\u0D18"
            chakra: "1"
          }
          {
            keycode: "5"
            unicode: "\\u0D19"
            chakra: "1"
          }
        ]
        [
          {
            keycode: "6"
            unicode: "\\u0D1A"
            chakra: "1"
          }
          {
            keycode: "7"
            unicode: "\\u0D1B"
            chakra: "1"
          }
          {
            keycode: "8"
            unicode: "\\u0D1C"
            chakra: "1"
          }
          {
            keycode: "9"
            unicode: "\\u0D1D"
            chakra: "1"
          }
          {
            keycode: "10"
            unicode: "\\u0D1E"
            chakra: "1"
          }
        ]
        [
          {
            keycode: "1"
            unicode: "\\u0D15"
            chakra: "1"
          }
          {
            keycode: "2"
            unicode: "\\u0D16"
            chakra: "1"
          }
          {
            keycode: "3"
            unicode: "\\u0D17"
            chakra: "1"
          }
          {
            keycode: "4"
            unicode: "\\u0D18"
            chakra: "1"
          }
          {
            keycode: "5"
            unicode: "\\u0D19"
            chakra: "1"
          }
        ]
        [
          {
            keycode: "1"
            unicode: "\\u0D15"
            chakra: "1"
          }
          {
            keycode: "2"
            unicode: "\\u0D16"
            chakra: "1"
          }
          {
            keycode: "3"
            unicode: "\\u0D17"
            chakra: "1"
          }
          {
            keycode: "4"
            unicode: "\\u0D18"
            chakra: "1"
          }
          {
            keycode: "5"
            unicode: "\\u0D19"
            chakra: "1"
          }
        ]
        [
          {
            keycode: "6"
            unicode: "\\u0D1A"
            chakra: "1"
          }
          {
            keycode: "7"
            unicode: "\\u0D1B"
            chakra: "1"
          }
          {
            keycode: "8"
            unicode: "\\u0D1C"
            chakra: "1"
          }
          {
            keycode: "9"
            unicode: "\\u0D1D"
            chakra: "1"
          }
          {
            keycode: "10"
            unicode: "\\u0D1E"
            chakra: "1"
          }
        ]
        [
          {
            keycode: "1"
            unicode: "\\u0D15"
            chakra: "1"
          }
          {
            keycode: "2"
            unicode: "\\u0D16"
            chakra: "1"
          }
          {
            keycode: "3"
            unicode: "\\u0D17"
            chakra: "1"
          }
          {
            keycode: "4"
            unicode: "\\u0D18"
            chakra: "1"
          }
          {
            keycode: "5"
            unicode: "\\u0D19"
            chakra: "1"
          }
        ]
        [
          {
            keycode: "6"
            unicode: "\\u0D1A"
            chakra: "1"
          }
          {
            keycode: "7"
            unicode: "\\u0D1B"
            chakra: "1"
          }
          {
            keycode: "8"
            unicode: "\\u0D1C"
            chakra: "1"
          }
          {
            keycode: "9"
            unicode: "\\u0D1D"
            chakra: "1"
          }
          {
            keycode: "10"
            unicode: "\\u0D1E"
            chakra: "1"
          }
        ]
        [
          {
            keycode: "1"
            unicode: "\\u0D15"
            chakra: "1"
          }
          {
            keycode: "2"
            unicode: "\\u0D16"
            chakra: "1"
          }
          {
            keycode: "3"
            unicode: "\\u0D17"
            chakra: "1"
          }
          {
            keycode: "4"
            unicode: "\\u0D18"
            chakra: "1"
          }
          {
            keycode: "5"
            unicode: "\\u0D19"
            chakra: "1"
          }
        ]
        [
          {
            keycode: "1"
            unicode: "\\u0D15"
            chakra: "1"
          }
          {
            keycode: "2"
            unicode: "\\u0D16"
            chakra: "1"
          }
          {
            keycode: "3"
            unicode: "\\u0D17"
            chakra: "1"
          }
          {
            keycode: "4"
            unicode: "\\u0D18"
            chakra: "1"
          }
          {
            keycode: "5"
            unicode: "\\u0D19"
            chakra: "1"
          }
        ]
        [
          {
            keycode: "6"
            unicode: "\\u0D1A"
            chakra: "1"
          }
          {
            keycode: "7"
            unicode: "\\u0D1B"
            chakra: "1"
          }
          {
            keycode: "8"
            unicode: "\\u0D1C"
            chakra: "1"
          }
          {
            keycode: "9"
            unicode: "\\u0D1D"
            chakra: "1"
          }
          {
            keycode: "10"
            unicode: "\\u0D1E"
            chakra: "1"
          }
        ]
        [
          {
            keycode: "1"
            unicode: "\\u0D15"
            chakra: "1"
          }
          {
            keycode: "2"
            unicode: "\\u0D16"
            chakra: "1"
          }
          {
            keycode: "3"
            unicode: "\\u0D17"
            chakra: "1"
          }
          {
            keycode: "4"
            unicode: "\\u0D18"
            chakra: "1"
          }
          {
            keycode: "5"
            unicode: "\\u0D19"
            chakra: "1"
          }
        ]
        [
          {
            keycode: "6"
            unicode: "\\u0D1A"
            chakra: "1"
          }
          {
            keycode: "7"
            unicode: "\\u0D1B"
            chakra: "1"
          }
          {
            keycode: "8"
            unicode: "\\u0D1C"
            chakra: "1"
          }
          {}
          {}
        ]
      ]
      console.log $scope.onscreen
      return

]