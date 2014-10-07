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
