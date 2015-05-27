require 'test_helper'

class CandidatesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should add row" do
    assert_difference("Candidate.count") do
      post :create, {name: "Ross Perot", hometown: "Somewhere", district: "D13", party: "Green"}
    end
    assert_equal "Ross Perot", Candidate.last.name
  end

end
