class Link < ApplicationRecord
  belongs_to :user
  validates :slug, uniqueness: true
end
