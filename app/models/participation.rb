class Participation < ApplicationRecord

  belongs_to(:participant, class_name: 'Member', counter_cache: :registered_sessions_count)
  belongs_to(:registered_session, class_name: 'Session', counter_cache: :participants_count)
  validates_uniqueness_of(:registered_session, scope: :participant)

end
