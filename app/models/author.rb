class Author < ApplicationRecord
  validates :last_name, presence: true, length: { minimum: 2 }
  
  def name
    "#{first_name} #{last_name}"
  end


  def ==(o)
    o.class == self.class &&
    o.first_name == self.first_name &&
    o.last_name == self.last_name &&
    o.homepage == self.homepage
  end
end