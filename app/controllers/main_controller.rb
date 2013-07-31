class MainController < ApplicationController
  layout false
  
  def index
    @letter = Letter.new
  end
end
