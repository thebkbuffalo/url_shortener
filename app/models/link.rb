class Link < ApplicationRecord
  belongs_to :user
  validates :slug, uniqueness: true
  validates :url, presence: true

  before_save :generate_short_url

  def generate_short_url
    unless self.slug.present?
      shorty = rand(36**10).to_s(36)
      self.slug = shorty
    end
  end
end
