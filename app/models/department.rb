class Department < ApplicationRecord

  has_many(:members, dependent: :nullify)
  has_many(:requirements, foreign_key: :required_department_id, inverse_of: :required_department, dependent: :destroy)
  has_many(:require_courses, through: :requirements)
  validates(:short_name, presence: true, uniqueness: true)
  validates(:full_name, presence: true, uniqueness: true)

  def to_s
    short_name << ' - ' << full_name
  end

end
