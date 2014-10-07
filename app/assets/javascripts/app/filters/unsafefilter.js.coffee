app.filter "unsafeFilter", ($sce) ->
  (val) ->
    $sce.trustAsHtml val
