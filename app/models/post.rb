class Post < ApplicationRecord
  belongs_to :user

  ## VALIDATIONS ##
  validates :content, presence: true
  validates :content, length: { maximum: 300 }
end
