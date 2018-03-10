class User < ActiveRecord::Base
  # Include default devise modules. Others available are:「rails g devise User」3行目にある利用可能なデフォルトのモジュールを組み込みます
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # モデルの設定
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable
  mount_uploader :avatar, AvatarUploader #carrierwave用の設定、deviseの設定配下に追記
  has_many :photos # has_many :hogesにより子モデル(hoge)が複数ひもづくアソシエーションを定義する

  def self.find_for_twitter_oauth(auth, signed_in_resource = nil)
    user = User.find_by(provider: auth.provider, uid: auth.uid)
    unless user
      user = User.new(
        name:     auth.info.nickname,
        image_url: auth.info.image,
        provider: auth.provider,
        uid:      auth.uid,
        email:    auth.info.email ||= "#{auth.uid}-#{auth.provider}@example.com",
        password: Devise.friendly_token[0, 20]
      )
      user.skip_confirmation!
      user.save
    end
    user
  end
  #（アカウント新規登録）ランダムなuidを作成するcreate_unique_stringメソッド
  def self.create_unique_string
    SecureRandom.uuid
  end
  #omniauthでサインアップしたアカウントのユーザ情報の変更出来るようにする
  def update_with_password(params, *options) # pdate_with_passwordをオーバーライド(メソッドを定義しなおしている)
    if provider.blank?
      super
    else
      params.delete :current_password
      update_without_password(params, *options)
    end
  end
end
