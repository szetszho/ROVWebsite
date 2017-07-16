class CreateSessions < ActiveRecord::Migration[5.0]
  def change
    create_table(:sessions) do |x|
      x.references(:course, index: false, null: false)
      x.datetime(:start_time, null: false)
      x.datetime(:end_time, null: false)
      x.integer(:participants_count, default: 0)
      x.timestamps
      x.index([:course_id, :start_time, :end_time], name: :index_sessions)
    end
  end
end
