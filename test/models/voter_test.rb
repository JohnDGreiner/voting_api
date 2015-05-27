require 'test_helper'

class VoterTest < ActiveSupport::TestCase

  test "must have name" do
    assert Voter.create!(name: "first test", party: "indep")
    assert_raise ActiveRecord::RecordInvalid do
      Voter.create!(name: "", party: "indep")
    end
  end

  test "must have party" do
    assert Voter.create!(name: "first test", party: "indep")
    assert_raise ActiveRecord::RecordInvalid do
      Voter.create!(name: "first test", party: "")
    end
  end

  test "cannot enter duplicate names" do
    Voter.create!(name: "first test", party: "indep")
    duplicate = Voter.new(name: "first test", party: "indep")
    refute duplicate.save
  end

  test "row was added to table" do
    test_voter = Voter.create!(name: "first test", party: "indep")
    assert_equal test_voter, Voter.last
  end

end
