class Bookmark < ApplicationRecord

  # アソシエーション設定：一対多の多側
  belongs_to :user
  belongs_to :post

end
