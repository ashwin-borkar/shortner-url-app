class Shortlink < ApplicationRecord
  belongs_to :user
  validates :url, presence: true
  validates :original, presence: true
  validates :original, uniqueness: true
end
