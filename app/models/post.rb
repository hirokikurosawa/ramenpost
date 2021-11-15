class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  attachment :post_image

  validates :post_image, presence: true
  
  #投稿の並びがデフォルトで降順になるように設定
  default_scope -> { order(created_at: :desc) }

  #検索機能のメソッド
  def self.search(keyword)
    where(["introduction like?",  "%#{keyword}%"])
  end
end
