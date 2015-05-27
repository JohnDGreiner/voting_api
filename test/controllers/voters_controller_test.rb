require 'test_helper'

class VotersControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "should be able to create" do
    assert_difference("Voter.count") do
      post :create, {name: "Joe Test", party: "Green"}
    end
    assert_equal "Joe Test", Voter.last.name
  end

end
