class Admin::CoursesController < ApplicationController
  before_action :vars
  def redirect_create(rec)
    admin_course_path(rec)
  end
  private
  def vars
    @model = Course
    @params = [:description, :name]
  end
end
