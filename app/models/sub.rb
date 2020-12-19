class Sub < ApplicationRecord
    belongs_to :moderator, :foreign_key => 'moderator_id', :primary_key => 'id', class_name: 'User'
end
