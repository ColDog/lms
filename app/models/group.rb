class Group < ActiveRecord::Base
  belongs_to :role
  has_many :fields
end
