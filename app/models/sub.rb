class Sub < ApplicationRecord
    belongs_to :moderator, foreign_key: "moderator_id", primary_key: "id", class_name: 'User'

    has_many :post_subs, dependent: :destroy, inverse_of: :sub
    has_many :posts, through: :post_subs, source: :post

    def sorted_posts
        self.posts.sort_by(&:total).reverse
    end
end
