class User < ApplicationRecord


  # バリデーションの設定
  validates :user_name,
    presence: true, length:  { maximum: 255 }
  validates :user_address,
    length:  { maximum: 255 }
  validates :facebook,
    length:  { maximum: 255 }
  validates :twitter,
    length:  { maximum: 255 }
  validates :instagram,
    length:  { maximum: 255 }
  validates :professional,
    length:  { maximum: 255 }
  validates :user_fb_msg,
    length:  { maximum: 255 }

  ### パスワードのバリデーション設定
  validates :password_digest,
    presence: true, length:  { minimum: 6 }, on: :create
  validates :password_digest,
    presence: true, length:  { minimum: 6 }, on: :update, allow_blank: true

  # パスワードをハッシュ化
  has_secure_password

  ### emailのバリデーション設定
  validates :user_email,
    presence: true, length:  { maximum: 255 },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  # 保存する前にメールアドレスを小文字化
  before_save {user_email.downcase!}

  # アソシエーション設定：一対多の一側（vs posts）
  has_many :posts, dependent: :destroy

  # アソシエーション設定：一対多の一側（vs bookmarks）
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_posts, through: :bookmarks, source: :post

  # ImageUploaderの紐付け
  mount_uploader :user_icon, ImageUploader

end
