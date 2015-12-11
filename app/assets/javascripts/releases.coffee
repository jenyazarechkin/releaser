# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $('.status-link').on 'click', (event) ->
    event.preventDefault()
    $('*').css 'cursor', 'progress'
    self = $(this)
    status = self.data('status')
    path = self.attr('href')
    $.ajax(
      url: path
      method: 'patch'
      data: statuses_step_release: status: status
      headers: 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')).done (responce) ->
        if responce.status == 'ok'
          dropdown = self.parents('.dropdown')
          dropdown.find('.status-name').text(responce.status_name)
          dropdown.find('.btn').attr('class', 'btn dropdown-toggle ' + responce.status_color)
        else
          alert('Status not changed')
        $('*').css 'cursor', ''

$(document).ready(ready)
$(document).on('page:load', ready)
$('.dropdown-toggle').dropdown()