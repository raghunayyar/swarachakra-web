app.controller "KeyboardController", [
  "$scope"
  "Restangular"
  "LanguageModel"
  "$sce"
  ($scope, Restangular, LanguageModel, $sce) ->
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
            unicode: "\u0D15"
            chakra: "1"
          }
          {
            keycode: "2"
            unicode: "\u0D16"
            chakra: "1"
          }
          {
            keycode: "3"
            unicode: "\u0D17"
            chakra: "1"
          }
          {
            keycode: "4"
            unicode: "\u0D18"
            chakra: "1"
          }
          {
            keycode: "5"
            unicode: "\u0D19"
            chakra: "1"
          }
        ]
        [
          {
            keycode: "6"
            unicode: "\u0D1A"
            chakra: "1"
          }
          {
            keycode: "7"
            unicode: "\u0D1B"
            chakra: "1"
          }
          {
            keycode: "8"
            unicode: "\u0D1C"
            chakra: "1"
          }
          {
            keycode: "9"
            unicode: "\u0D1D"
            chakra: "1"
          }
          {
            keycode: "10"
            unicode: "\u0D1E"
            chakra: "1"
          }
        ]
        [
          {
            keycode: "11"
            unicode: "\u0D15"
            chakra: "1"
          }
          {
            keycode: "12"
            unicode: "\u0D16"
            chakra: "1"
          }
          {
            keycode: "13"
            unicode: "\u0D17"
            chakra: "1"
          }
          {
            keycode: "14"
            unicode: "\u0D18"
            chakra: "1"
          }
          {
            keycode: "15"
            unicode: "\u0D19"
            chakra: "1"
          }
        ]
        [
          {
            keycode: "16"
            unicode: "\u0D1A"
            chakra: "1"
          }
          {
            keycode: "17"
            unicode: "\u0D1B"
            chakra: "1"
          }
          {
            keycode: "18"
            unicode: "\u0D1C"
            chakra: "1"
          }
          {
            keycode: "19"
            unicode: "\u0D1D"
            chakra: "1"
          }
          {
            keycode: "20"
            unicode: "\u0D1E"
            chakra: "1"
          }
        ]
        [
          {
            keycode: "21"
            unicode: "\u0D15"
            chakra: "1"
          }
          {
            keycode: "22"
            unicode: "\u0D16"
            chakra: "1"
          }
          {
            keycode: "23"
            unicode: "\u0D17"
            chakra: "1"
          }
          {
            keycode: "24"
            unicode: "\u0D18"
            chakra: "1"
          }
          {
            keycode: "25"
            unicode: "\u0D19"
            chakra: "1"
          }
        ]
        [
          {
            keycode: "26"
            unicode: "\u0D15"
            chakra: "1"
          }
          {
            keycode: "27"
            unicode: "\u0D16"
            chakra: "1"
          }
          {
            keycode: "28"
            unicode: "\u0D17"
            chakra: "1"
          }
          {
            keycode: "29"
            unicode: "\u0D18"
            chakra: "1"
          }
          {
            keycode: "30"
            unicode: "\u0D19"
            chakra: "1"
          }
        ]
        [
          {
            keycode: "31"
            unicode: "\u0D1A"
            chakra: "1"
          }
          {
            keycode: "32"
            unicode: "\u0D1B"
            chakra: "1"
          }
          {
            keycode: "33"
            unicode: "\u0D1C"
            chakra: "1"
          }
          {
            keycode: "34"
            unicode: "\u0D1D"
            chakra: "1"
          }
          {
            keycode: "35"
            unicode: "\u0D1E"
            chakra: "1"
          }
        ]
        [
          {
            keycode: "36"
            unicode: "\u0D15"
            chakra: "1"
          }
          {
            keycode: "37"
            unicode: "\u0D16"
            chakra: "1"
          }
          {
            keycode: "38"
            unicode: "\u0D17"
            chakra: "1"
          }
          {
            keycode: "39"
            unicode: "\u0D18"
            chakra: "1"
          }
          {
            keycode: "40"
            unicode: "\u0D19"
            chakra: "1"
          }
        ]
        [
          {
            keycode: "41"
            unicode: "\u0D1A"
            chakra: "1"
          }
          {
            keycode: "42"
            unicode: "\u0D1B"
            chakra: "1"
          }
          {
            keycode: "43"
            unicode: "\u0D1C"
            chakra: "1"
          }
          {
            keycode: "44"
            unicode: "\u0D1D"
            chakra: "1"
          }
          {
            keycode: "45"
            unicode: "\u0D1E"
            chakra: "1"
          }
        ]
        [
          {
            keycode: "46"
            unicode: "\u0D15"
            chakra: "1"
          }
          {
            keycode: "47"
            unicode: "\u0D16"
            chakra: "1"
          }
          {
            keycode: "48"
            unicode: "\u0D17"
            chakra: "1"
          }
          {
            keycode: "49"
            unicode: "\u0D18"
            chakra: "1"
          }
          {
            keycode: "50"
            unicode: "\u0D19"
            chakra: "1"
          }
        ]
        [
          {
            keycode: "51"
            unicode: "\u0D15"
            chakra: "1"
          }
          {
            keycode: "52"
            unicode: "\u0D16"
            chakra: "1"
          }
          {
            keycode: "53"
            unicode: "\u0D17"
            chakra: "1"
          }
          {
            keycode: "54"
            unicode: "\u0D18"
            chakra: "1"
          }
          {
            keycode: "55"
            unicode: "\u0D19"
            chakra: "1"
          }
        ]
        [
          {
            keycode: "56"
            unicode: "\u0D1A"
            chakra: "1"
          }
          {
            keycode: "57"
            unicode: "\u0D1B"
            chakra: "1"
          }
          {
            keycode: "58"
            unicode: "\u0D1C"
            chakra: "1"
          }
          {
            keycode: "59"
            unicode: "\u0D1D"
            chakra: "1"
          }
          {
            keycode: "60"
            unicode: "\u0D1E"
            chakra: "1"
          }
        ]
        [
          {
            keycode: "61"
            unicode: "\u0D15"
            chakra: "1"
          }
          {
            keycode: "62"
            unicode: "\u0D16"
            chakra: "1"
          }
          {
            keycode: "63"
            unicode: "\u0D17"
            chakra: "1"
          }
          {
            keycode: "64"
            unicode: "\u0D18"
            chakra: "1"
          }
          {
            keycode: "65"
            unicode: "\u0D19"
            chakra: "1"
          }
        ]
        [
          {
            keycode: "66"
            unicode: "\u0D1A"
            chakra: "1"
          }
          {
            keycode: "67"
            unicode: "\u0D1B"
            chakra: "1"
          }
          {
            keycode: "68"
            unicode: "\u0D1C"
            chakra: "1"
          }
          {}
          {}
        ]
      ]
      $scope.blah = "\u0D1C"
      console.log $scope.blah
      return

]