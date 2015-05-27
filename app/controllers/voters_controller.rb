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

  def update
    voter = Voter.find_by_id(params[:id])
    voter.update({:name => params[:name]}) if params[:name]
    voter.update({:party => params[:party]}) if params[:party]
    voter.save
    render json: voter
  end

end
