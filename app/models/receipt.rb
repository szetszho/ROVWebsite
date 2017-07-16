class Receipt < ApplicationRecord

  belongs_to(:member)
  belongs_to(:payment_method)
  belongs_to(:currency)

  has_many(:items)

end
