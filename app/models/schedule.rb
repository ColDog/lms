class Schedule < ActiveRecord::Base
  belongs_to  :course_step
  has_many    :attendances
  has_one     :course, through: :course_step
end
