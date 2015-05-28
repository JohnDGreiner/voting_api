class VotesController < ApplicationController
  before_filter :restrict_access
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

  def remove
    Vote.find_by_id(params[:id]).destroy
    render json: "Vote Deleted"
  end

  private

    def restrict_access
      api_token = Voter.find_by_api_token(params[:api_token])
      head :unauthorized unless api_token
    end


  end
