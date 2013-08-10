#encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  
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
