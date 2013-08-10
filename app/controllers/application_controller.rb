#encoding: utf-8
class ApplicationController < ActionController::Base
  include TheRoleController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  
  def access_denied
    redirect_to login_path, notice: "권한이 필요합니다."
  end
  
  # Define method aliases for the correct TheRole's controller work
  alias_method :login_required,     :require_login
  alias_method :role_access_denied, :access_denied
  
  
  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    # if (request.fullpath != "/login" && \
    #     request.fullpath != "/users/sign_up" && \
    #     !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath 
    # end
  end
  
  def after_sign_in_path
    session[:previous_url] || user_main_index_path(current_user)
  end

  def after_logout_path
    session[:previous_url] || login_path
  end
  
  private
  def not_authenticated
    redirect_to login_url, :notice => "로그인이 필요합니다."
  end
end
