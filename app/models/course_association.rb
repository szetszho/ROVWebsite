class CourseAssociation < ApplicationRecord

  belongs_to(:precursor, class_name: 'Course')
  belongs_to(:successor, class_name: 'Course')
  validates_uniqueness_of(:successor, scope: :precursor)

end
