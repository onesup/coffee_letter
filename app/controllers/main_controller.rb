class MainController < ApplicationController
  def index
    @letter = Letter.new
  end
end
