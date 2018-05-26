class CommentsController < ApplicationController
	def create
		@comment = current_user.comments.new(comment_params)
		@article = Article.find(params[:article_id])
		@comment.article = @article
		@comment.save

		ActionCable.server.broadcast "comments_#{@article.id}", 
			username: @comment.user.name || @comment.user.email, 
			body: @comment.body, 
			created_at: @comment.created_at.to_s(:long),
			parent_comment_id: @comment.parent_comment_id
	end 

	def comment_params
    params.require(:comment).permit(:body,:parent_comment_id)
  end
end
