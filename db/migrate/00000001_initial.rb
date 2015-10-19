class Initial < ActiveRecord::Migration
  def change

    create_table :setups do |t|
      t.string :name
      t.string :logo
      t.string :brand
      t.boolean :public_create

      t.timestamps null: false
    end

    create_table :pictures do |t|
      t.string :src
      t.string :name
      t.references :imageable, polymorphic: true, index: true, null: false

      t.timestamps null: false
    end


    create_table :roles do |t|
      t.string :name, null: false
      t.boolean :super_user, default: false
      t.boolean :can_edit_employees, default: false
      t.boolean :can_edit_own, default: false
      t.boolean :can_create_content, default: false

      t.timestamps null: false
    end

    create_table :groups do |t|
      t.string :name, null: false
      t.string :location
      t.string :category
      t.references :role, index: true, foreign_key: true
      t.text :description

      t.timestamps null: false
    end

    create_table(:users) do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: '', index: true
      t.string :encrypted_password, null: false, default: ''
      t.string :name, null: false
      t.json :dashboard
      t.json :tabs
      t.json :data
      t.references :role, index: true, foreign_key: true, null: false

      ## Recoverable
      t.string   :reset_password_token, index: true
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      t.timestamps null: false
    end

    create_table :user_groups do |t|
      t.references :group, index: true, foreign_key: true, null: false
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end

    create_table :courses do |t|
      t.string :name, null: false
      t.text :description

      t.timestamps null: false
    end

    create_table :course_steps do |t|
      t.references :course, index: true, foreign_key: true, null: false
      t.string :name, null: false
      t.integer :order
      t.text :description

      t.timestamps null: false
    end

    create_table :assignments do |t|
      t.references :course, index: true, foreign_key: true
      t.string :name
      t.string :category
      t.decimal :is_worth
      t.decimal :required_score
      t.boolean :required, default: false

      t.timestamps null: false
    end

    create_table :questions do |t|
      t.references :assignment, index: true, foreign_key: true, null: false
      t.string :category
      t.text :question
      t.text :options
      t.text :correct
      t.integer :order
      t.boolean :computer_marked, default: false
      t.boolean :user_marked, default: false
      t.boolean :upload_required, default: false

      t.timestamps null: false
    end

    create_table :answers do |t|
      t.references :question, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :file
      t.text :answer
      t.boolean :correct, default: nil
      t.decimal :score

      t.timestamps null: false
    end

    # LEARNING OBJECTS
    create_table :videos do |t|
      t.string :source
      t.integer :order
      t.references :course_step, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end

    create_table :slide_shows do |t|
      t.string :source
      t.integer :order
      t.references :course_step, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end

    create_table :articles do |t|
      t.string :name
      t.text :content
      t.references :course_step, index: true, foreign_key: true, null: false
      t.integer :order

      t.timestamps null: false
    end



    create_table :certifications do |t|
      t.references :course, index: true, foreign_key: true, null: false
      t.references :user, index: true, foreign_key: true, null: false
      t.string :key

      t.timestamps null: false
    end

    create_table :fields do |t|
      t.references :group, index: true, foreign_key: true, null: false
      t.string :name
      t.string :validation
      t.text :options
      t.boolean :required

      t.timestamps null: false
    end

    create_table :user_fields do |t|
      t.references :field, index: true, foreign_key: true, null: false
      t.references :user, index: true, foreign_key: true, null: false
      t.string :answer

      t.timestamps null: false
    end

    create_table :enrollments do |t|
      t.references :course, index: true, foreign_key: true, null: false
      t.references :user, index: true, foreign_key: true, null: false
      t.boolean :passed
      t.decimal :grade

      t.timestamps null: false
    end

    create_table :participants do |t|
      t.references :course_step, index: true, foreign_key: true, null: false
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end

    create_table :schedules do |t|
      t.references :course_step, index: true, foreign_key: true, null: false
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps null: false
    end

    create_table :attendances do |t|
      t.references :schedule, index: true, foreign_key: true, null: false
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end

    create_table :requirements do |t|
      t.references :course, index: true, foreign_key: true, null: false
      t.references :schedule, index: true, foreign_key: true
      t.references :assignment, index: true, foreign_key: true
      t.decimal :score
      t.decimal :weight

      t.timestamps null: false
    end

  end
end
