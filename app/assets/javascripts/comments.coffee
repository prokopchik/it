$(document).on 'turbolinks:load', ->
	$('.reply-to-comment').click (event), ->
		commentId = $(event.target).data("comment-id");
		$(".new-comment-form-#{commentId}").toggleClass("hidden");
