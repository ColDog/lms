class Admin::LearningObjectsController < ApplicationController
  before_action :vars

  def create
    rec = LearningObject.new(safe_params)
    if rec.save
      render partial: "admin/learning_objects/#{rec.category}", locals: {obj: rec}
    else
      render json: {errors: rec.errors.full_messages.to_sentence}
    end
  end

  def order
    params[:order].each_with_index do |el_idx, order|
      LearningObject.find(el_idx).update(order: order)
    end
    render json: {errors: nil}
  end

  def redirect_create(rec)
    :back
  end
  private
  def vars
    @model = LearningObject
    @params = [:name, :description, :course_step_id, :category, fields: [:text, :picture, :video, :type, :question, :answer, :options]]
  end
end
