class Comment < ApplicationRecord
    validates :body, presence: true    
    validates :post_id, presence: true    
    validates :author_id, presence: true

    has_many :comments, foreign_key: "parent_comment_id", class_name: "Comment"
    has_many :votes, as: :votable
    
    belongs_to :author, foreign_key: "author_id", class_name: "User"
    belongs_to :post
end