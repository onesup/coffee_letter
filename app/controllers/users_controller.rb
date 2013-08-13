#encoding: utf-8
class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to login_path, :notice => @user.email+ "님 가입 감사드립니다!"
    else
      render :new
    end
  end
  def new
    @user = User.new
  end
  
  private  
  
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
