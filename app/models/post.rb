class Post < ApplicationRecord
has_one_attached :image
has_many_attached :images
has_many :comments
belongs_to :user
belongs_to :category
has_many :likes, dependent: :destroy
has_many :ratings, dependent: :destroy

has_one_attached :audio


def photo
    if image.attached?
        image
    else
        "/nfd.jpg"
    end
end


def set_image=(src)
  file = File.open(Rails.root.join("public/#{src}.jpeg"))
  image.attach(io: file, filename: title)
rescue OpenURI::HTTPError => e
  pp e
end

def set_audio=(src)
  file = File.open(Rails.root.join("public/#{src}.mp3"))
  audio.attach(io: file, filename: audio)
rescue OpenURI::HTTPError => e
  pp e
end

end
