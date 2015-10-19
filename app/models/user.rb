class User < ActiveRecord::Base
  has_many    :user_certifications
  has_many    :certifications, through: :user_certifications
  has_many    :user_groups
  has_many    :groups, through: :user_groups
  has_many    :fields, through: :groups
  has_many    :user_fields
  has_many    :enrollments
  has_many    :answers
  belongs_to  :role
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  accepts_nested_attributes_for :user_fields, reject_if: :all_blank, allow_destroy: true

  after_create :add_to_all

  def answer(question)
    Question.find(question.id).answers.find_by(user_id: self.id)
  end

  private
  def add_to_all
    self.user_groups.create(group_id: 1)
  end
end
