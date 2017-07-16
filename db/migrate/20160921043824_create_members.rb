class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table(:members) do |x|
      x.string(:name, null: false)
      x.string(:student_id, index: true, null: false)
      x.references(:department, index: false)
      x.string(:phone)
      x.integer(:registered_sessions_count, default: 0)
      x.timestamps
    end
  end
end
