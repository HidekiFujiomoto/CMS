class Post < ApplicationRecord
  # バリデーション
  validates :post_title,
    presence: true,
    length:  { maximum: 255 }
  validates :post_content, presence: true


  # アソシエーション設定：一対多の多側
  belongs_to :user

  # アソシエーション設定一対多の一側
  has_many :users

  # アソシエーション設定：一対多の一側
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_users, through: :bookmarks, source: :user

  # ImageUploaderの紐付け
  mount_uploader :post_image_1, ImageUploader
  mount_uploader :post_image_2, ImageUploader
  mount_uploader :post_image_3, ImageUploader

end
