class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  has_many :subs, :foreign_key => 'moderator_id', :primary_key => 'id', class_name: 'Sub'
end
