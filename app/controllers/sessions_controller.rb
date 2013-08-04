# coding : utf-8
class SessionsController < ApplicationController
  def new
    begin
      if logged_in?
        redirect_to after_sign_in_path
      end
    rescue ActiveRecord::RecordNotFound
      session[:user_id] = nil
    end
  end
  
  def create
    user = login(params[:email], params[:password])
    if user
      redirect_to after_sign_in_path, :notice => "로그인 되었습니다."
    else
      redirect_to login_path, :notice => "계정 정보가 잘못 입력되었습니다."
    end
  end
  
  def destroy
	  logout
	  redirect_to after_logout_path, :notice => "로그아웃 되었습니다."
	end  
  
  private
    def set_user
      @user = login(params[:email], params[:password])
    end

    def session_params
      params.require(:user).permit(:email, :password)
    end
  
end