class User < ApplicationRecord
  has_secure_password #この一行だけでパスワードを暗号化させてくれる

  #データ検証
  validates :name,presence: true
  validates :email,presence: true,uniqueness: true

  has_many :tasks #たくさんのtaskモデルと紐づいてるよってこと
                  #user.tasks的な書き方ができるようになる

end
