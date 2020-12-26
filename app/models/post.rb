class Post < ApplicationRecord
has_one_attached :image
has_many_attached :images
has_many :comments
belongs_to :user
belongs_to :category
has_many :likes, dependent: :destroy

def photo
    if image.attached?
        image
    else
        "/nfd.jpg"
    end
end

end
