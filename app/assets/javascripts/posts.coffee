# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
	$('.new_comment').on 'submit', ->
		# console.log(this)
		window.comment_section = $(this).closest('.post').find('.comments').attr('id')


