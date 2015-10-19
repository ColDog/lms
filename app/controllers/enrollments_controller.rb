class EnrollmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :vars

  private
  def vars
    @model = Enrollment
    @params = [:course_id, :user_id]
  end
end
