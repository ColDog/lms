class LearningObject < ActiveRecord::Base

  def get_field(field)
    if self.fields.is_a? Hash
      self.fields[field]
    else
      ''
    end
  end
end
