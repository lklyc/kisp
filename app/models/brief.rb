class Brief < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  has_many :comments
end