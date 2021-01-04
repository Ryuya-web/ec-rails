class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :street_address, presence: true
  has_many :cart_items
  has_many :orders
  has_many :addresses
  enum is_unsubscribed: { '退会済': true, '有効': false }
  def active_for_authentication?
    super && (self.is_unsubscribed == '有効')
  end

 
end
 