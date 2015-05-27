class VotersController < ApplicationController

  def show
    render json: Voter.find_by_id(params[:id])
  end

  def create
    voter = Voter.new(name: params[:name], party: params[:party])
    if voter.save
      render json: voter
    else
      render json: voter.errors
    end
  end

end
