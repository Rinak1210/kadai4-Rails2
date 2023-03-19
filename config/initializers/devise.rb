
Devise.setup do |config|
  
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  require 'devise/orm/active_record'
  
  # 大文字と小文字を区別しないキーを設定。デフォルトはemail。
  config.case_insensitive_keys = [:email]

  # ユーザー認証時にどのカラムでユーザー認証するかを指定するもの。デフォルトはemail。
  config.authentication_keys = [:email]
  
  # 空白を除外するキーを設定。デフォルトはemail。
  config.strip_whitespace_keys = [:email]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 12

  config.reconfirmable = true

  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 6..128

  # email登録時の正規表現パターン。
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete

  config.responder.error_status = :unprocessable_entity

  config.responder.redirect_status = :see_other

end
