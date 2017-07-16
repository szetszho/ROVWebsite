class CreateCourseAssociations < ActiveRecord::Migration[5.0]
  def change
    create_table(:course_associations) do |x|
      x.references(:successor, index: false, null: false)
      x.references(:precursor, index: false, null: false)
      x.timestamps
      x.index([:successor_id, :precursor_id], name: :index_course_associations)
    end
  end
end
