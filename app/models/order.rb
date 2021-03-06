class Order < ApplicationRecord
    belongs_to :end_user
    has_many :items, dependent: :destroy
    has_many :order_details, dependent: :destroy
    validates :shipping_number, presence: true
    validates :shipping_price, presence: true
    validates :shipping_name, presence: true
    validates :shipping_address, presence: true
    validates :payment_method, presence: true
    enum order_status: { '入金待ち': 0, '入金確認': 1, '製作中': 2,'発送準備中': 3, '発送済み':4}
    enum payment_method: { 'クレジットカード': 0, '銀行振込': 1}
end
