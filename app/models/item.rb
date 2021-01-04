class Item < ApplicationRecord
    belongs_to :genre
    has_many :order_details
    attachment :image, destroy: false
    validates :is_unsaled, inclusion: { in: [true, false] }
    validates :genre_id, presence: true
    validates :description, presence: true
    validates :tax_excluded_price, presence: true
    validates :name, presence: true
    has_many :cart_items
   
end
