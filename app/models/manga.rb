class Manga < ApplicationRecord
  belongs_to :user

  validates :title, :user_id, presence: true
  include Shrine::Attachment(:image)
end
