class VotesController < ApplicationController

  def index
    render json: Vote.all
  end
  
end
