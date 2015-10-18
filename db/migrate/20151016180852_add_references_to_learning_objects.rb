class AddReferencesToLearningObjects < ActiveRecord::Migration
  def change
    add_reference :learning_objects, :course_step, index: true, foreign_key: true
  end
end
