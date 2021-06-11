class Shortlink < ApplicationRecord
  belongs_to :user
  validates :original, presence: true
  validates_uniqueness_of  :original, scope: :user_id

  before_save { self.url = SecureRandom.urlsafe_base64(6) }

end