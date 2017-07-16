# noinspection RubyResolve
class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |x|
      x.references(:receipt)

      x.string(:reference_number)
      x.string(:name)
      x.text(:description, null: true)

      x.numeric(:unit_price)
      x.numeric(:quantities)
      x.numeric(:discount)
      x.numeric(:total_price)

      x.timestamps
    end
  end
end
