class GenreMap < ApplicationRecord
  belongs_to :recipe
  belongs_to :genre
  validates :recipe_id, presence: true
  validates :genre_id, presence: true
end
