class Post < ApplicationRecord
has_one_attached :image
has_many_attached :images
has_many :comments

def photo
    if image.attached?
        image
    else
        "/nfd.jpg"
    end
end

end
