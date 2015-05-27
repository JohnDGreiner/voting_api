require 'test_helper'

class VoteTest < ActiveSupport::TestCase

  test "must have candidate_id" do
    assert Vote.create!(candidate_id: 1, voter_id: 1)
    assert_raise ActiveRecord::RecordInvalid do
      Vote.create!(candidate_id: nil, voter_id: 1)
    end
  end

  test "must have voter_id" do
    assert Vote.create!(candidate_id: 1, voter_id: 1)
    assert_raise ActiveRecord::RecordInvalid do
      Vote.create!(candidate_id: 1, voter_id: nil)
    end
  end

  test "row is created in table" do
    test_candidate = Candidate.create!(name: "first tester", hometown: "home", district: "13", party: "indep")
    test_voter = Voter.create!(name: "first test", party: "indep")
    assert test_vote = Vote.create!(candidate_id: test_candidate.id, voter_id: test_voter.id)
    assert_equal test_vote, Vote.last
  end

end
