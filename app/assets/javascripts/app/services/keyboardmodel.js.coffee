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
    @languageobject = {}
    return

  KeyboardModel:: =
    addlanguage: (languageobject) ->
      @languageobject = languageobject
      return

    getallkeys: () ->
      currentlanguage = @languageobject[1] # ToDO: implement selection of language.

      totalrows = currentlanguage.csv.length
      grouped = []
      i = 0
      while i < totalrows
        div = Math.floor(i / 5)
        mod = i % 5
        grouped[div] = []  if mod is 0
        grouped[div][mod] = currentlanguage.csv[i]
        i++
      @keys = grouped
      grouped

    firsttablelayout: (language) ->
      i = 0
      table = []
      while i < 4
        table[i] = @keys[8][i]
        i++
      return table

    maintablelayout1: (language) ->
      i = 0
      table = []
      while i < 4
        table[i] = @keys[i]
        i++
      return table

    maintablelayout2: (languages) ->
      i = 4
      table = []
      while i < 8
        table[i-4] = @keys[i]
        i++
      return table

    maintablelayout3: (id) ->
      return

    maintablelayout4: (language) ->
      return

    lasttableleftlayout: (id) ->
      table = {}
      table = @keys[8][4]
      return table

    lasttablerightlayout: (id) ->
      table = []
      i = 0
      while i < 3
        table[i] = @keys[10][i]
        i++
      return table

    lasttablelayout: (id) ->
      table = []
      i = 2
      while i < 5
        table[i-2] = @keys[9][i]
        i++
      return table

    swarachakrakeys: () ->
      return

  new KeyboardModel()
