class Contact < ApplicationRecord

  # バリデーションの設定
  validates :contact_content, presence: true

  # ImageUploaderの紐付け
  mount_uploader :contact_img, ImageUploader

end
