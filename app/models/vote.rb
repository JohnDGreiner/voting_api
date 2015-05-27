class Vote < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :voter

  validates :candidate_id, presence: true, uniqueness: {scope: :candidate_id}
  validates :voter_id, presence: true

end
