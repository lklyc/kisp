class Vote < ActiveRecord::Base
  belongs_to :brief
  belongs_to :user
end