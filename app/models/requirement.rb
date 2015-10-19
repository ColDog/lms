class Requirement < ActiveRecord::Base
  belongs_to :schedule
  belongs_to :assignment
  belongs_to :course

  def passed?(user)
    if schedule_id
      !schedule.attendances.find_by(user_id: user.id).nil?
    elsif assignment_id
      assignment.grade_for(user) > score
    end
  end

  def completion(user)
    comps = []
    if assignment_id
      comps << score / assignment.grade_for(user)
    end
    comps.sum / comps.length.to_f
  end

  def type
    if schedule_id
      'Attendance'
    elsif assignment_id
      'Assignment'
    end
  end

  def owner
    if schedule_id
      schedule.course_step.name
    elsif assignment_id
      assignment.name
    end
  end

end
