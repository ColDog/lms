class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper

  SETUP = Setup.find(1)

  def redirect_update(rec)
    send("#{@model.name.underscore.pluralize}_path")
  end

  def redirect_create(rec)
    send("#{@model.name.underscore}_path", rec)
  end

  def edit
    instance_variable_set("@#{@model.name.underscore}", @model.find(params[:id]))
  end

  def show
    instance_variable_set("@#{@model.name.underscore}", @model.find(params[:id]))
  end

  def index
    instance_variable_set("@#{@model.name.underscore.pluralize}", @model.all)
  end

  def create
    rec = @model.create(safe_params)
    if rec.save
      respond_to do |r|
        r.json { render json: {rec: rec, errors: nil} }
        r.html do
          flash[:success] = "#{@model.name} created."
          redirect_to redirect_create(rec)
        end
      end
    else
      respond_to do |r|
        r.json { render json: {errors: rec.errors.full_messages.to_sentence } }
        r.html do
          flash[:danger] = "#{@model.name} create failed: #{rec.errors.full_messages.to_sentence}"
          redirect_to :back
        end
      end
    end
  end

  def update
    rec = @model.find(params[:id])
    if rec.update_attributes(safe_params)
      respond_to do |r|
        r.json { render json: {rec: rec, errors: nil} }
        r.html do
          flash[:success] = "#{@model.name} updated!"
          redirect_to redirect_update(rec)
        end
      end
    else
      respond_to do |r|
        r.json { render json: {errors: rec.errors.full_messages.to_sentence } }
        r.html do
          flash[:danger] = "#{@model.name} update failed: #{rec.errors.full_messages.to_sentence}"
          redirect_to :back
        end
      end
    end
  end

  def destroy
    @model.find(params[:id]).destroy
    flash[:danger] = "#{@model.name} deleted"
    redirect_to :back
    respond_to do |r|
      r.json { render json: {errors: nil } }
      r.html { render }
    end
  end

  def safe_params
    params.require(@model.name.underscore.downcase).permit(*@params)
  end
end
