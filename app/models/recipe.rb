class Recipe < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :recipe_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def get_image
    image
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.search(keyword)
    where(["name like? OR caption like?", "%#{keyword}%", "%#{keyword}%"])
  end
  
  

end
