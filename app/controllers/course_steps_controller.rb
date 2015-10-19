class CourseStepsController < ApplicationController
  before_action :vars

  def vars
    @model = CourseStep
  end
end
