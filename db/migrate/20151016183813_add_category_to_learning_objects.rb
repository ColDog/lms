class AddCategoryToLearningObjects < ActiveRecord::Migration
  def change
    add_column :learning_objects, :category, :string
  end
end
