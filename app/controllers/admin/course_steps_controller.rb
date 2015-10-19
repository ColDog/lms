class Admin::CourseStepsController < ApplicationController
  before_action :vars

  def edit
    @course = Course.find(params[:course_id])
    @course_step = CourseStep.find(params[:id])
  end

  def show
    @course = Course.find(params[:course_id])
    @course_step = CourseStep.find(params[:id])
  end

  def redirect_create(rec)
    admin_course_course_step_path(rec.course, rec)
  end
  private
  def vars
    @model = CourseStep
    @params = [:description, :name, :course_id]
  end
end
