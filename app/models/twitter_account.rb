class TwitterAccount < ApplicationRecord
  belongs_to :user
  has_many :tweets

  # Would probably want to make sure these are unique
  # But I will only be attaching to my one twitter account so relaxing this constraint
  # validates :username, uniqueness: true
end