class Shortlink < ApplicationRecord
  belongs_to :user
  validates :url, presence: true
  validates :original, presence: true
  validates_uniqueness_of  :original, scope: :user_id
end
