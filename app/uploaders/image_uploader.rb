class ImageUploader < Shrine
  plugin :validation_helpers

  Attacher.validate do
    validate_mime_type %w[ image/jpeg image/png image/jpg ]
  end
end