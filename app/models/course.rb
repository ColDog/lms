class Course < ActiveRecord::Base
  has_many :course_steps
  has_many :learning_objects, through: :course_steps
  has_many :enrollments
  has_many :participants, through: :course_steps
end
