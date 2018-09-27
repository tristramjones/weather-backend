class City < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :state, presence: true
end
