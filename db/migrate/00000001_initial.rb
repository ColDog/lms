class Initial < ActiveRecord::Migration
  def change

    create_table :setups do |t|
      t.string :name
      t.string :logo
      t.string :brand
      t.boolean :public_create

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

    create_table :groups do |t|
      t.string :name, null: false
      t.string :location
      t.string :category
      t.references :role, index: true, foreign_key: true
      t.text :description

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
      t.text :description

      t.timestamps null: false
    end

    create_table :learning_objects do |t|
      t.string :name, null: false
      t.text :description
      t.json :fields

      t.timestamps null: false
    end

    create_table :user_learning_objects do |t|
      t.json :answers
      t.boolean :passed
      t.decimal :score
      t.references :user, index: true, foreign_key: true, null: false
      t.references :learning_object, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end

    create_table :certifications do |t|
      t.string :name, null: false
      t.text :description

      t.timestamps null: false
    end

    create_table :certification_items do |t|
      t.references :certification, index: true, foreign_key: true, null: false
      t.string  :verification_key, null: false
      t.references :learning_object, index: true, foreign_key: true, null: false
      t.references :course, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end

    create_table :user_certifications do |t|
      t.references :certification_item, index: true, foreign_key: true, null: false
      t.references :user, index: true, foreign_key: true, null: false

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

  end
end
