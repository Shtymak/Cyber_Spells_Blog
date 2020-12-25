class Comment < ApplicationRecord
    belongs_to :post, optional: true
    belongs_to :comment, optional: true
    belongs_to :user
    has_many :comments
end
