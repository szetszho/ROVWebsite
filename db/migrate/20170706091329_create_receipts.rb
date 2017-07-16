# noinspection RubyResolve
class CreateReceipts < ActiveRecord::Migration[5.0]
  def change
    create_table(:receipts) do |x|
      x.references(:creator)
      x.references(:payer)
      x.references(:payment_method)
      x.references(:currency)

      x.string(:reference_number)
      x.string(:supplier)

      x.numeric(:exchange_rate)

      x.timestamps(:purchase_date)
      x.timestamps(:payment_date)
      x.timestamps
    end
  end
end
