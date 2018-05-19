class Contact < ApplicationRecord

  # アソシエーション設定：一対多の多側（vs User）
  belongs_to :User

end
