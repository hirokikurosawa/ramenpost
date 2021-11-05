class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  attachment :post_image
  
  def self.search(keyword)
    where(["introduction like?",  "%#{keyword}%"])
  end
end
