class Admin::FieldsController < ApplicationController
  before_action :authenticate_user!

  before_action :vars

  def redirect_create(rec)
    :back
  end

  def redirect_save(rec)
    :back
  end

  private
  def vars
    @model = Field
    @params = [:name, :required, :options, :validation, :group_id]
  end
end
