class Contact < ApplicationRecord

  # ImageUploaderの紐付け
  mount_uploader :contact_img, ImageUploader

end
