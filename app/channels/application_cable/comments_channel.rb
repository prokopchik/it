module ApplicationCable
	class CommentsChannel < ApplicationCable::Channel
	  def subscribed
	    stream_from "comments_#{params[:room]}"
	  end
	end
end
