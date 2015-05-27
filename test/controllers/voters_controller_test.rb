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

  test "should be able to update party" do
    voter = Voter.create!(name: "Larry Voter", party: "Green")
    patch :update, {id: voter.id, party: "Red"}
    assert_equal "Red", Voter.find_by_id(voter.id).party
  end

  test "should be able to update name" do
    voter = Voter.create!(name: "Larry Voter", party: "Green")
    patch :update, {id: voter.id, name: "Joe"}
    assert_equal "Joe", Voter.find_by_id(voter.id).name
  end

  test "should be able to update party and name" do
    voter = Voter.create!(name: "Larry Voter", party: "Green")
    patch :update, {id: voter.id, name: "Joe Voter",  party: "Red"}
    assert_equal "Red", Voter.find_by_id(voter.id).party
    assert_equal "Joe Voter", Voter.find_by_id(voter.id).name
  end

end
