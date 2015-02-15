class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  belongs_to :brief
end