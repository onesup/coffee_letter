class Admin::DashboardController < ApplicationController
  layout 'admin'
  before_action :login_required
  before_action :role_required
  def index
  end
end
