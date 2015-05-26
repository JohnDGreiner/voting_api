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

end
