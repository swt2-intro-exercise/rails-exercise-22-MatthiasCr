class Paper < ApplicationRecord
  validates :title, :venue, :year, presence: true
  validates :year, numericality: true

  has_and_belongs_to_many :authors

  scope :published_in, ->(year) { where("year = ?", year)}

  def ==(o)
    o.class == self.class &&
    o.title == self.title &&
    o.venue == self.venue &&
    o.year == self.year
  end
end
