class UserCertification < ActiveRecord::Base
  belongs_to :certification_item
  belongs_to :user
end
