
app = angular.module("Swarachakra", [
  "ngAnimate"
  "restangular"
  "ngRoute"
  "ngSanitize"
  "ngTouch"
])
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
app.filter "unsafeFilter", ($sce) ->
  (val) ->
    $sce.trustAsHtml val

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
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app.controller "DashboardController",
  [ "$scope", "Restangular", "LanguageModel", ($scope, Restangular, LanguageModel) ->

    $scope.langauges = LanguageModel.getAll()

    $scope.remove = (id) ->
      language = LanguageModel.get(id)
      language.remove().then ->
        LanguageModel.remove id
        $scope.langauges = LanguageModel.getAll()
        return
      return

    $scope.update = (id) ->
      $scope.currentload = true
      currentload = $scope.currentload
      language = LanguageModel.get(id)
      language.patch(enabled: currentload).then (languageobject) ->
        LanguageModel.update languageobject
        $scope.langauges = LanguageModel.getAll()
        $scope.currentload = false
        return
      return
  ]
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
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# This service should do the mapping from the CSV to the Keyboard.
# This should be epic.

app.factory "KeyboardModel", ->
  KeyboardModel = ->
    @keys = []
    @key = []
    @keyid = {}
    return

  KeyboardModel:: =
    addlanguage: (languageobject) ->
      @keys = languageobject
      return

    getallkeys: () ->
      currentlanguage = @keys[1]

      console.log currentlanguage.name
      totalrows = currentlanguage.csv.length
      grouped = []
      i = 0
      while i < totalrows
        div = Math.floor(i / 5)
        mod = i % 5
        grouped[div] = []  if mod is 0
        grouped[div][mod] = currentlanguage.csv[i]
        i++
      grouped

    firsttablelayout: (language) ->
      return

    maintablelayout1: (language) ->
      return

    maintablelayout2: (languages) ->
      return

    maintablelayout3: (id) ->
        return

    maintablelayout4: (language) ->
      return

    lasttablelayout: (id) ->
      return

    lastrowlayout: (id) ->
      return

  new KeyboardModel()

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app.factory "LanguageModel", ->
  LanguageModel = ->
    @languages = []
    @languageid = {}
    @deleted = null
    @updated = null
    return

  LanguageModel:: =
    add: (language) ->
      @languages.push language
      return

    addAll: (languages) ->
      i = 0
      while i < languages.length
        @add languages[i]
        i++
      return

    getAll: ->
      @languages

    get: (id) ->
      i = 0
      while i < @languages.length
        if id is @languages[i].id
          @languageid = @languages[i]
          break
        i++
      @languageid

    update: (language) ->
      i = 0

      while i < @languages.length
        if @languages[i].id is language.id
          @languages[i] = language
          break
        i++
      @languageid[language.id] = language
      @updated = language
      return

    remove: (id) ->
      i = 0
      while i < @languages.length
        if @languages[i].id is id
          @languages.splice i, 1
          delete @languageid[id]

          @deleted = id: id
          break
        i++
      return

  new LanguageModel()

# TODO: Credits.
# Place all the behaviors and hooks related to the matching Service here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

app.factory "SaveModel", [
  "$q"
  ($q) ->
    SaveModel = ->
      @queue = {}
      @flushLock = false
      return

    SaveModel:: =
      add: (textinput) ->
        @queue[0] = textinput
        @flush()
        return

      flush: ->
        keys = Object.keys(@queue)
        if keys.length is 0 or @flushLock
          return
        else
          @flushLock = true
        self = this
        requests = []
        i = 0

        while i < keys.length
          textinput = @queue[keys[i]]
          requests.push textinput.put().then(@noteUpdateRequest.bind(null, textinput))
          i++
        @queue = {}

        $q.all(requests).then ->
          self.flushLock = false
          self.flush()
          return

        return

      noteUpdateRequest: (note, response) ->
        note = response
        return

    return new SaveModel()
]