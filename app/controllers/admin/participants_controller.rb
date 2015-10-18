class Admin::ParticipantsController < ApplicationController
  before_action :vars
  private
  def vars
    @model = Participant
    @params = [:user_id, :course_step_id]
  end
end
