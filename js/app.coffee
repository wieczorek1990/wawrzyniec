# TODO active

$(window).bind 'hashchange', (e) ->
  load(getHash())

getHash = ->
  location.hash.substr 1

load = (hash) ->
  $.get "md/#{hash}.md", (data) ->
#    $('#markdown').html(markdown.toHTML(data))
    $('#markdown').html(marked(data))

$ ->
  hash = getHash()
  if hash == ''
    load('welcome')
  else
    load(hash)