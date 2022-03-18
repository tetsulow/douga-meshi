class Genre < ApplicationRecord
  has_many :genre_maps, dependent: :destroy, foreign_key: 'genre_id'
  has_many :recipes, through: :genre_maps

  validates :genre_name, presence: true, uniqueness: true

end
