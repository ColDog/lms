class UsersController < ApplicationController
  before_action :authenticate_user!

  before_action :vars

  def redirect_create(rec)
    :back
  end

  def redirect_update(rec)
    :back
  end

  def safe_params
    params.require(:user).permit!
  end

  private
  def vars
    @model = User
    # @params = [:name, :fields, :email, :password, :password_confirmation, user_fields: [:answer]]
  end
end
