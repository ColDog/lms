class Schedule < ActiveRecord::Base
  belongs_to :course_step
  has_many :attendances
end
