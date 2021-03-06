class Item < ApplicationRecord
    attachment :image
    validates :image, presence: true
    validates :name, presence: true
    validates :introduction, presence: true
    validates :genre_id, presence: true
    validates :price, presence: true
    validates :is_active, presence: true

    belongs_to :genre
    has_many :cart_items
    has_many :order_details
end
