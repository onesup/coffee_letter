class User::LettersController < ApplicationController
  before_filter :store_location
  before_filter :require_login
  def index
    @user = current_user
    @letters = @user.letters
  end

  def new
    @letter = Letter.new
    @user = current_user

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @letter }
    end
  end
  
  def create
    @letter = Letter.new(letter_params)   
    @user = current_user 
    respond_to do |format|
      if @letter.save
        billing = @user.billings.create()
        billing.letters << @letter
        billing.save
        # if @letter.controller_name == 'main'
        #   format.html { redirect_to user_edit_letter_path(current_user, @letter), notice: '편지가 작성되었습니다.' }
        # else
          format.html { redirect_to edit_user_letter_path(current_user, @letter), notice: '편지가 작성되었습니다.' }
          format.json { render json: @letter, status: :created, location: @letter }
        # end
      else
        format.html { render action: "new" }
        format.json { render json: @letter.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @user = current_user
    @letter = Letter.find(params[:id])
  end
  
  def update
    @letter = Letter.find(params[:id])
    @user = User.find(params[:user_id])
    @user.letters << @letter
    respond_to do |format|
      if @letter.update_attributes(letter_params)
        format.html { redirect_to user_letter_path(current_user, @letter), notice: '편지가 작성되었습니다.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @letter.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    @user = current_user
    @letter = Letter.find(params[:id])
    if @letter.user.nil?
      @letter.user = @user
      @letter.save
    end
    if @letter.billing.user.nil?
      billing = @letter.billing
      billing.user = @user
      billing.save
    end
  end
  
  private  
  
    def letter_params
      params.require(:letter).permit(:sender_name, :receiver_name, :sender_address, :receiver_address, :content)
    end
  
end
