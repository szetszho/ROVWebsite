class Member < ApplicationRecord

  belongs_to(:department, optional: true, counter_cache: true)
  has_many(:participations, foreign_key: :participant_id, inverse_of: :participant, dependent: :destroy)
  has_many(:registered_sessions, through: :participations)
  validates(:name, presence: true)
  validates(:student_id, presence: true, uniqueness: true)

  def registering_courses_details
    Course
        .select('"courses".*')
        .select('"required"')
        .select('"registered"')
        .joins('LEFT OUTER JOIN (' <<
                   Requirement
                       .select('"require_course_id"')
                       .select('1 AS "required"')
                       .where(required_department: department)
                       .to_sql <<
                   ') ON "courses"."id" = "require_course_id"')
        .joins('LEFT OUTER JOIN (' <<
                   Session
                       .select('"course_id"')
                       .select('1 AS "registered"')
                       .joins(:participations)
                       .where(participations: {participant: self})
                       .to_sql <<
                   ') ON "courses"."id" = "course_id"')
        .order('"registered DESC"', '"required" DESC', code: :asc)
  end

  def to_s
    student_id << ' - ' << name
  end

end
