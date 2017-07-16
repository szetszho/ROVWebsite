class CreateParticipations < ActiveRecord::Migration[5.0]
  def change
    create_table(:participations) do |x|
      x.references(:participant, index: false, null: false)
      x.references(:registered_session, index: false, null: false)
      x.timestamps
      x.index([:participant_id, :registered_session_id], name: :index_participations)
    end
  end
end
