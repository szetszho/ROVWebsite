class Course < ApplicationRecord

  has_many(:requirements, foreign_key: :require_course_id, inverse_of: :require_course, dependent: :destroy)
  has_many(:sessions, dependent: :destroy)
  # has_many(:precursor, through: :course_associations)
  has_many(:required_departments, through: :requirements)
  # has_many(:successor, through: :course_associations)
  validates(:name, presence: true)
  validates(:code, presence: true, uniqueness: true)

  attribute(:required, :boolean)
  attribute(:registered, :boolean)

  def to_s
    code << ' - ' << name
  end

end
