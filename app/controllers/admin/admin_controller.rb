class Admin::AdminController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def settings
    @setup = Setup.find(1)
  end

  def learning
  end

end
