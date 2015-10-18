class Admin::SetupsController < ApplicationController
  before_action :authenticate_user!
  before_action :vars

  private
  def vars
    @model = Setup
    @params = [:name, :logo, :brand, :public_create]
  end

end
