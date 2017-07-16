class PaymentMethod < ApplicationRecord
  has_many(:receipts)
end
