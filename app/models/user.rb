class User < ApplicationRecord
  validates :email, presence: true
  has_many :articles, dependent: :destroy
  belongs_to :role
  has_many :comments, dependent: :destroy

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:twitter]

  enum theme: [ :magazine, :newspaper ]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email || [auth.info.nickname, 'omni.com'].join('@')
      user.role = Role.find_by_name('Member')
      user.password_confirmation = user.password = Devise.friendly_token[0, 20]
    end
  end

  def member?
    role.name == 'Member'
  end

  def writer?
    role.name == 'Writer'
  end

  def admin?
    role.name == 'Admin'
  end
end
