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

  def redirect_create(rec)
    :back
  end
  private
  def vars
    @model = LearningObject
    @params = [:name, :description, :course_step_id, :category, fields: [:text, :picture, :video]]
  end
end
