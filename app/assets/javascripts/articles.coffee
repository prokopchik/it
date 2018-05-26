$(document).on 'turbolinks:load', ->
  $('.markdown-input').each (i, textarea) ->
    articleId = $(textarea).data('article-id')
    $(textarea).markdownEditor
      preview: true
      onPreview: (content, callback) ->
        callback marked(content)
        return
      imageUpload: true
      uploadPath: '/articles/' + articleId + '/images'