class Admin::ArticlesController < ApplicationController
  def create
    @article = Video.new(safe_params)
    if @article.save
      render 'show', layout: false
    else
      render json: { errors: @article.errors.full_messages.to_sentence }
    end
  end

  private
  def safe_params
    params.require(:article).permit(:name, :content, :order)
  end
end
