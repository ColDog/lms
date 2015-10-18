class Admin::RolesController < ApplicationController
  before_action :authenticate_user!
end
