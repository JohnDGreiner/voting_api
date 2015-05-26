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

end
