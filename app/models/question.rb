class Question < ActiveRecord::Base
  belongs_to  :assignment
  has_many    :answers
end
