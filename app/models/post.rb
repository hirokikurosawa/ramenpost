class Post < ApplicationRecord
  belogns_to :user
  has_many :likes, dependent: :destroy
  attachment :post_image
end
