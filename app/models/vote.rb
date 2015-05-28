class Vote < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :voter

  validates :candidate_id, presence: true
  validates :voter_id, presence: true, uniqueness: {scope: :voter_id}

end
