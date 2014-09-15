# Credits - Bernhard Posselt
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app.directive "swarachakraTimeoutChange", [
  "$timeout"
  ($timeout) ->
    return (
      restrict: "A"
      link: (scope, element, attributes) ->
        interval = 3000
        $(element).bind "input propertychange", ->
          $timeout.cancel timeout
          timeout = $timeout(->
            scope.$apply attributes.swarachakraTimeoutChange
            return
          , interval)
          return

        return
    )
]