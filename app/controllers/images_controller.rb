class ImagesController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:create]
	
  def create
    render json: ["https://www.gettyimages.ie/gi-resources/images/Homepage/Hero/UK/CMS_Creative_164657191_Kingfisher.jpg"]
  end
end
