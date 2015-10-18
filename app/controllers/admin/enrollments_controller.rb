class Admin::EnrollmentsController < ApplicationController
  before_action :vars
  private
  def vars
    @model = Enrollment
    @params = [:user_id, :course_id]
  end
end
