class Session < ApplicationRecord

  belongs_to(:course, counter_cache: true)
  has_many(:participations, foreign_key: :registered_session_id, inverse_of: :registered_session, dependent: :destroy)
  has_many(:participants, through: :participations)
  validates(:start_time, presence: true)
  validates(:end_time, presence: true)
  validates_uniqueness_of(:course, scope: [:start_time, :end_time])

end
