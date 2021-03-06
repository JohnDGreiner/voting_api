require 'test_helper'

class CandidateTest < ActiveSupport::TestCase

  test "must have name" do
    assert Candidate.create!(name: "first tester", hometown: "home", district: "13", party: "indep")
    assert_raises ActiveRecord::RecordInvalid do
      Candidate.create!(name: "", hometown: "home", district: "13", party: "indep")
    end
  end

  test "must have hometown" do
    assert Candidate.create!(name: "first tester", hometown: "home", district: "13", party: "indep")
    assert_raises ActiveRecord::RecordInvalid do
      Candidate.create!(name: "first tester", hometown: "", district: "13", party: "indep")
    end
  end

  test "must have district" do
    assert Candidate.create!(name: "first tester", hometown: "home", district: "13", party: "indep")
    assert_raises ActiveRecord::RecordInvalid do
      Candidate.create!(name: "first tester", hometown: "home", district: "", party: "indep")
    end
  end

  test "must have party" do
    assert Candidate.create!(name: "first tester", hometown: "home", district: "13", party: "indep")
    assert_raises ActiveRecord::RecordInvalid do
      Candidate.create!(name: "first tester", hometown: "home", district: "13", party: "")
    end
  end

  test "created row in table" do
    assert president = Candidate.create!(name: "first tester", hometown: "home", district: "13", party: "indep")
    assert_equal president, Candidate.last
  end

  test "cannot create duplicate names" do
    Candidate.create!(name: "first tester", hometown: "home", district: "13", party: "indep")
    duplicate = Candidate.new(name: "first tester", hometown: "home", district: "13", party: "indep")
    refute duplicate.save
  end

end
