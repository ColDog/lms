class Admin::SchedulesController < ApplicationController
  before_action :vars
  private
  def vars
    @model = Schedule
    @params = [:start_time, :end_time, :course_step_id]
  end
end
