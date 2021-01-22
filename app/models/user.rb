class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  has_many :subs, foreign_key: "moderator_id", primary_key: "id", class_name: 'Sub'
  has_many :posts, foreign_key: "author_id", class_name: "Post"

  has_many :comments, foreign_key: "author_id", class_name: "Comment"
end
