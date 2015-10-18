class CertificationItem < ActiveRecord::Base
  belongs_to :certification
  belongs_to :course
  belongs_to :learning_object
end
