class CreateRequirements < ActiveRecord::Migration[5.0]
  def change
    create_table(:requirements) do |x|
      x.references(:required_department, index: false, null: false)
      x.references(:require_course, index: false, null: false)
      x.timestamps
      x.index([:required_department_id, :require_course_id], name: :index_requirements)
    end
  end
end
