class User::LettersController < ApplicationController
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
    @letter = Letter.new(params[:letter])    
    respond_to do |format|
      if @letter.save
        billing = Billing.create()
        billing.letters << @letter
        billing.save
        if @letter.controller_name == 'main'
          format.html { redirect_to user_edit_letter_path(current_user, @letter) }
        else
          format.html { redirect_to @letter, notice: 'Letter was successfully created.' }
          format.json { render json: @letter, status: :created, location: @letter }
        end
      else
        format.html { render action: "new" }
        format.json { render json: @letter.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end
  
  def update
    
  end
end
