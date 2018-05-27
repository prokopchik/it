articleId = document.location.pathname.split("/")[2];

App.messages = App.cable.subscriptions.create { channel: 'ApplicationCable::CommentsChannel', room: articleId },
  received: (comment) ->
    if comment.parent_comment_id
      $(".children-comments-list-#{comment.parent_comment_id}").prepend(@renderComment(comment));
    else
      $(".comments-list").prepend(@renderComment(comment));

  renderComment: (comment) -> 
    setTimeout @fadeOutBg, 1500
    "<div class='new-comment new-comment-bg'><b>#{comment.username}</b> #{comment.created_at}: #{comment.body}</div><div class='children-comments-list children-comments-list-#{comment.id}'><div>"

  fadeOutBg: () -> 
    $(".new-comment").removeClass("new-comment-bg");