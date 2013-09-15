#encoding: utf-8
class LettersController < ApplicationController
  before_filter :store_location
  # GET /letters
  # GET /letters.json
  def index
    @letters = Letter.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @letters }
    end
  end

  # GET /letters/1
  # GET /letters/1.json
  def show
    @letter = Letter.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @letter }
    end
  end

  # GET /letters/new
  # GET /letters/new.json
  def new
    @letter = Letter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @letter }
    end
  end

  # GET /letters/1/edit
  def edit
    @letter = Letter.find(params[:id])
  end

  # POST /letters
  # POST /letters.json
  def create
    
    
    @letter = Letter.new(letter_params)    
    respond_to do |format|
      if @letter.save
        if @letter.controller_name == 'main'
          # format.html { redirect_to edit_user_letter_path(current_user, @letter) }
          format.html { redirect_to edit_letter_path(@letter) }
        else
          format.html { redirect_to @letter, notice: '편지가 작성되었습니다.' }
          format.json { render json: @letter, status: :created, location: @letter }
        end
      else
        format.html { render action: "new" }
        format.json { render json: @letter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /letters/1
  # PUT /letters/1.json
  def update
    @letter = Letter.find(params[:id])

    respond_to do |format|
      if @letter.update_attributes(letter_params)
        # format.html { redirect_to @letter, notice: '편지가 작성되었습니다.' }
        format.html { redirect_to user_letter_path(current_user, @letter), notice: '편지가 작성되었습니다.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @letter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /letters/1
  # DELETE /letters/1.json
  def destroy
    @letter = Letter.find(params[:id])
    @letter.destroy

    respond_to do |format|
      format.html { redirect_to letters_url }
      format.json { head :no_content }
    end
  end
  
  private  
  
    def letter_params
      params.require(:letter).permit(:content, :receiver_name, :receiver_address, :receiver_phone, :sender_address, :sender_name, :sender_phone, :controller_name)
      
    end
  
end
