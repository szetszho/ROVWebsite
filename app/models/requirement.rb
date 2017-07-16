class Requirement < ApplicationRecord

  belongs_to(:require_course, class_name: 'Course', counter_cache: :required_departments_count)
  belongs_to(:required_department, class_name: 'Department', counter_cache: :require_courses_count)
  validates_uniqueness_of(:require_course, scope: :required_department)

end
