class Admin::CourseStepsController < ApplicationController
  before_action :vars

  def show
    @course = Course.find(params[:course_id])
    @course_step = CourseStep.find(params[:id])
  end

  def redirect_create(rec)
    admin_course_path(rec)
  end
  private
  def vars
    @model = CourseStep
    @params = [:description, :name, :course_id]
  end
end
