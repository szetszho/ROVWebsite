class CreateDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table(:departments) do |x|
      x.string(:short_name, index: true, null: false)
      x.string(:full_name, index: true, null: false)
      x.integer(:members_count, default: 0)
      x.integer(:require_courses_count, default: 0)
      x.timestamps
    end
  end
end
