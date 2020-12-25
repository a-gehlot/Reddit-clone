class Post < ApplicationRecord
    validates :title, presence: true
    validates :author_id, presence: true
    validates :title, uniqueness: { scope: :author_id, message: "Duplicate post" }
    belongs_to :author, foreign_key: "author_id", class_name: "User"

    has_many :post_subs, dependent: :destroy, inverse_of: :post
    has_many :subs, through: :post_subs, source: :sub
end
