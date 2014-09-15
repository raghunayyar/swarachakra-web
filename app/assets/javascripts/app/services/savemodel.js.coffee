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