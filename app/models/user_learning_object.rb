class UserLearningObject < ActiveRecord::Base
  belongs_to :user
  belongs_to :learning_object
end
