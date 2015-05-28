require 'test_helper'

class VotesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should add a row" do
    test_candidate = Candidate.create!(name: "first tester", hometown: "home", district: "13", party: "indep")
    test_voter = Voter.create!(name: "first test", party: "indep")
    assert_difference("Vote.count") do
      post :create, {candidate_id: test_candidate.id, voter_id: test_voter.id}
    end
    assert_equal test_candidate.id, Vote.last.candidate_id
  end

  test "cannot destroy if voter exists" do
    candidate = Candidate.create!(name: "Next President", hometown: "Somewhere", district: "13", party: "independent")
    voter = Voter.create!(name: "Larry Voter", party: "Green")
    vote = Vote.create!(candidate_id: candidate.id, voter_id: voter.id)
    delete :remove, {id: vote.id}
    refute_equal vote.id, Vote.last.id
  end

end
