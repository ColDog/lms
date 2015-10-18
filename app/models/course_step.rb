class CourseStep < ActiveRecord::Base
  belongs_to :course
  has_many :participants
  has_many :schedules
  has_many :attendances, through: :schedules
  has_many :learning_objects
end
