class CMSMailer < ApplicationMailer
  def send_email(user_email)
    @user_email = user_email

    mail to: "kurosirobeagle@yahoo.co.jp", subject: "【CMS】新規メッセージを受信しました"
  end
end
