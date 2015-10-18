class User < ActiveRecord::Base
  has_many    :user_certifications
  has_many    :certifications, through: :user_certifications
  has_many    :user_groups
  has_many    :groups, through: :user_groups
  has_many    :user_learning_objects
  has_many    :fields, through: :groups
  has_many    :user_fields
  belongs_to  :role
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  accepts_nested_attributes_for :user_fields, reject_if: :all_blank, allow_destroy: true

  after_create :add_to_all

  private
  def add_to_all
    self.user_groups.create(group_id: 1)
  end
end
