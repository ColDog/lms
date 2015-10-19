class Course < ActiveRecord::Base
  has_many :course_steps
  has_many :schedules, through: :course_steps
  has_many :learning_objects, through: :course_steps
  has_many :enrollments
  has_many :participants, through: :course_steps
  has_many :requirements
  has_many :assignments

  def passed?(user)
    requirements.all? { |req| req.passed?(user) }
  end

  # def avg_completion_for(user)
  #   requirements.inject { |sum, req| sum + req.completion(user) } / requirements.count.to_f
  # end

  def finish_course(user)
    if passed?(user)
      Certification.create(user_id: user.id, course_id: id)
    end
  end

  def completion
    nil
  end


end
