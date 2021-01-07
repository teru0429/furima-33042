class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  has_many :items 

  validates_presence_of :nickname, :birth

  with_options presence: true, format: { with: /\A[a-zA-Z0-9]+\z/, message: '半角英数字を使用してください' } do
    validates :password
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角文字を使用してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end

end