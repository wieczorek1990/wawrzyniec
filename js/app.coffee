$(window).bind 'hashchange', (e) ->
  load(getHash())

getHash = ->
  location.hash.substr(1)

load = (hash) ->
  category = getCategory(hash)
  loadMarkdown(hash)
  selectActive(hash, category)

loadMarkdown = (hash) ->
  $.get "md/#{hash}.md", (data) ->
    $('#markdown').html(marked(data))
    $contentCol = $('#content-col')
    $contentCol.removeClass()
    if hash == 'gallery'
      $('.swipebox').swipebox()
      $contentCol.addClass('col-lg-offset-3 col-lg-6')
    else
      $contentCol.addClass('col-lg-offset-4 col-lg-4')

selectActive = (hash, category) ->
  $('li.active').removeClass('active')
  $li = $('ul.nav > li.dropdown > a#' + category).parents('li.dropdown').addClass('active')
  $li.find('a[href="#' + hash + '"]').parents('li').addClass('active')

getCategory = (hash) ->
  switch (hash)
    when 'masses', 'office', 'contacts' then 'info-basic'
    when 'announcements', 'intentions' then 'info-current'
    when 'history', 'priests', 'groups', 'cemetery', 'gallery' then 'info-about'

$ ->
  hash = getHash()
  if hash == ''
    load('home')
  else
    load(hash)