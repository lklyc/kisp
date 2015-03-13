class Vote < ActiveRecord::Base
  belongs_to :brief
  belongs_to :user

  #validates_uniqueness_of :user, scope: :brief
end