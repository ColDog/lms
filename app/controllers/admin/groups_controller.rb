class Admin::GroupsController < ApplicationController
  before_action :authenticate_user!

  before_action :vars
  def redirect_update(rec)
    admin_setups_path
  end
  def redirect_create(rec)
    admin_setups_path
  end
  private
  def vars
    @model = Group
    @params = [:name, :required, :options, :validation]
  end
end
