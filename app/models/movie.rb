class Movie < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  def director
  end
end
