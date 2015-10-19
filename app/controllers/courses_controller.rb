class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :vars

  private
  def vars
    @model = Course
    @params = []
  end
end
