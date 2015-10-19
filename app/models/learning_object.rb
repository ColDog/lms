class LearningObject < ActiveRecord::Base
  belongs_to :course_step
  has_many :user_learning_objects

  def get_field(field)
    if self.fields.is_a? Hash
      self.fields[field]
    else
      ''
    end
  end
end
