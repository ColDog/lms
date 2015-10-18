class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.references :course_step, index: true, foreign_key: true, null: false
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps null: false
    end
  end
end
