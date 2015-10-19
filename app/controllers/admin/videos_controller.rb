class Admin::VideosController < ApplicationController
  def create
    @video = Video.new(safe_params)
    if @video.save
      render 'show', layout: false
    else
      render json: { errors: @video.errors.full_messages.to_sentence }
    end
  end

  private
  def safe_params
    params.require(:video).permit(:name, :source, :order)
  end
end
