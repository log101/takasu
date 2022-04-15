json.extract! manga, :id, :title, :volumes, :description, :image_url, :user_id, :created_at, :updated_at
json.url manga_url(manga, format: :json)
