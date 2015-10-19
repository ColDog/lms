class Field < ActiveRecord::Base
  belongs_to :group
  has_many :user_fields
end
