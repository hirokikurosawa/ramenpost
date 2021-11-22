class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  validates :nickname, presence: true, length: {maximum: 15}

  has_many :posts, dependent: :destroy
  has_many :relationships, dependent: :destroy, foreign_key: :following_id
  has_many :likes, dependent: :destroy

  #フォロー機能のためのアソシエーション
  has_many :followings, through: :relationships, source: :follower
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: :follower_id
  has_many :followers, through: :reverse_of_relationships, source: :following

  #フォロー機能のメソッド
  def is_followed_by?(user)
    reverse_of_relationships.find_by(following_id: user.id).present?
  end

  #いいね機能のメソッド
  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
end
