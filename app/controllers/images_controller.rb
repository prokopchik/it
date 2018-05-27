class ImagesController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:create]

  def create
    images_urls = (0..10).map do |index|
      image_from_params = params["file#{index}"]
      next unless image_from_params
      image_record = Image.create(image: image_from_params)
      image_record.image.url(:big)
    end

    render json: images_urls.compact
  end
end
