class Field < ActiveRecord::Base
  belongs_to :group
  has_one :user_field
end
