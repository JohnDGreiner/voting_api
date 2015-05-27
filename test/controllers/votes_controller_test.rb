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

end
