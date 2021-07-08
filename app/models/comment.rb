class Comment < ApplicationRecord
  belongs_to :product
  belongs_to :user

  has_many :sub_comments

  scope :ordered, -> { order(id: :asc) }
end
