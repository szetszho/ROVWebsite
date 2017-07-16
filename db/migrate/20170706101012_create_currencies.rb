class CreateCurrencies < ActiveRecord::Migration[5.0]
  def change
    create_table :currencies do |t|
      t.string(:code)
      t.string(:description)
      t.timestamps
    end
  end
end
