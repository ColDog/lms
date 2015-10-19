class Admin::SlideShowsController < ApplicationController
  def create
    @slide_show = SlideShow.new(safe_params)
    if @slide_show.save
      render 'show', layout: false
    else
      render json: { errors: @slide_show.errors.full_messages.to_sentence }
    end
  end

  private
  def safe_params
    params.require(:slide_show).permit(:name, :source, :order)
  end
end
