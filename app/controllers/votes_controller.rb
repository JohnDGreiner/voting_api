class VotesController < ApplicationController

  def index
    render json: Vote.all
  end

  def create
    vote = Vote.new(candidate_id: params[:candidate_id], voter_id: params[:voter_id])
    if vote.save
      render json: vote
    else
      render json: vote.errors
    end
  end

end
