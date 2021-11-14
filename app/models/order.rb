class Order < ApplicationRecord
  has_many :order_details
  belongs_to :customer
  enum status: {
    入金待ち:0,入金確認:1,製作中:2,発送準備中:3,発送済み:4
  }
  enum payment_method: {
	  credit_card: 0 ,
	  bank_transfer: 1
	}

end
