class Voter < ActiveRecord::Base
  before_create :generate_api_token

  has_many :votes

  validates :name, presence: true, uniqueness: true
  validates :party, presence: true

private

  def generate_api_token
    begin
      self.api_token = SecureRandom.hex
    end while self.class.exists?(api_token: api_token)
  end
end
