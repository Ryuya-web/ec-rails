class OrderDetail < ApplicationRecord
    belongs_to :order
    belongs_to :item
    validates :quantity, presence: true
    validates :include_price, presence: true
    enum make_status: { '着手負荷': 0, '製作待ち': 1, '製作中': 2,'製作完了': 3}
end
