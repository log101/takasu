class Manga < ApplicationRecord
  belongs_to :user

  validates :title, :user_id, presence: true
  include ImageUploader::Attachment(:image)

  include AlgoliaSearch

  algoliasearch do

  end
end
