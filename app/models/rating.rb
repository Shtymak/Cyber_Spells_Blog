class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates_presence_of :post
  validates_inclusion_of :value, :in => 1..5
end
