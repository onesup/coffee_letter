#encoding: utf-8
class User::BillingsController < ApplicationController
  before_filter :require_login
  def index
    @user = User.find(params[:user_id])
    @billings = @user.billings
  end

  def new
    @user = User.find(params[:user_id])
    @billing = Billing.new
  end

  def edit
    @user = User.find(params[:user_id])
    @billing = Billing.find(params[:id])
  end
  
  def show
    @user = User.find(params[:user_id])
    @billing = Billing.find(params[:id])
    @letter = @billing.letter
  end
  
  def update
    @billing = Billing.find(params[:id])
    respond_to do |format|
      if @billing.update_attributes(billing_params)
        format.html { redirect_to user_billing_path(current_user, @billing), notice: '입금정보가 작성되었습니다.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @billing.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
  
    def billing_params
      params.require(:billing).permit(:sender_name, :sender_phone) 
    end
  
end
