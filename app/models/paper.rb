class Paper < ApplicationRecord
  validates :title, :venue, :year, presence: true
  validates :year, numericality: true

  def ==(o)
    o.class == self.class &&
    o.title == self.title &&
    o.venue == self.venue &&
    o.year == self.year
  end
end
