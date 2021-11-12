class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  attachment :post_image

  validates :post_image, presence: true

  #検索機能のメソッド
  def self.search(keyword)
    where(["introduction like?",  "%#{keyword}%"])
  end
end
