class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_photo.subject
  # 引数としてphotoを追加します。
  def sendmail_photo(photo)
    @photo = photo

    mail to: "okada@itpm-gk.com",
         subject: '【自撮りの鬼】写真が投稿されました!'
  end
end
