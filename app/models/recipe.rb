class Recipe < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :recipe_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :genre_maps, dependent: :destroy
  has_many :genres, through: :genre_maps, dependent: :destroy

  validates :name,presence:true, length:{maximum:50}
  validates :caption,presence:true,length:{maximum:200}

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.search(keyword)
    where(["name like? OR caption like?", "%#{keyword}%", "%#{keyword}%"])
  end

  def save_genre(sent_genres)
    current_genres = self.genres.pluck(:genre_name) unless self.genres.nil?
    old_genres = current_genres - sent_genres
    new_genres = sent_genres - current_genres

    old_genres.each do |old|
      self.genres.delete Genre.find_by(genre_name: old)
    end

    new_genres.each do |new|
      new_recipe_genre = Genre.find_or_create_by(genre_name: new)
      self.genres << new_recipe_genre
    end
  end



end
