class MainController < ApplicationController
  layout "main"
  
  def index
    @letter = Letter.new
  end
end
