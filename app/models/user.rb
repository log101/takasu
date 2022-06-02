class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         #:confirmable, :lockable

  has_many :mangas, dependent: :destroy

  has_many :sent_trades, class_name: 'Trade', foreign_key: :sender_id
  has_many :recieved_trades, class_name: 'Trade', foreign_key: :recipient_id

end
