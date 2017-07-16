class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table(:courses) do |x|
      x.string(:name, null: false)
      x.string(:code, index: true, null: false)
      x.text(:description)
      x.integer(:required_departments_count, default: 0)
      x.integer(:sessions_count, default: 0)
      x.timestamps
    end
  end
end
