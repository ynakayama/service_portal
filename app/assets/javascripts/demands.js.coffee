initial_form_hide = () ->
  $('#demand_service_type').hide()
  $('.boss').hide()
  $('.project').hide()
  $('.range').hide()
  $('.others').hide()
  $('.vm').hide()
  $('.svn').hide()
  $('.book').hide()
  $('.support').hide()
  $('.title_vm').hide()
  $('.title_svn').hide()
  $('.title_book').hide()
  $('.title_support_vm').hide()
  $('.title_support_svn').hide()

show_common_sub_forms = (v) ->
  $('.' + v).show()
  $('.' + 'title_' + v).show()
  if v is "vm" or v is "svn"
    $('.boss').show()
    $('.project').show()
    $('.range').show()
    $('.others').show()
  if v is "book"
    $('.range').show()
  if v is "support_vm" or v is "support_svn"
    $('.support').show()

show_service_specific_forms = (v) ->
  unless (typeof v.service is "undefined")
    $('#demand_service_type').val(v.service)
    show_common_sub_forms(v.service)

get_url_param = () ->
  v = []
  i = 0
  hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&')
  for hash in hashes
     i++
     h = hash.split('=')
     v.push(h[0])
     v[h[0]] = h[1]
  show_service_specific_forms(v)

show_by_hidden_parm = () ->
  v = $('#demand_service_type').val()
  $('.' + v).show()
  show_common_sub_forms(v)

demands_js = () ->
  initial_form_hide()
  get_url_param()
  show_by_hidden_parm()

$ ->
  if $('.demands-new-page').is(':visible')
    demands_js()
