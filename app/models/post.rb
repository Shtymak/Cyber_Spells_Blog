class Post < ApplicationRecord
has_one_attached :image
has_many_attached :images

def photo
    if image.attached?
        image
    else
        "/nfd.jpg"
    end
end

end
