class Brief < ActiveRecord::Base
  #belongs_to :article
  belongs_to :briefable, polymorphic: true
  belongs_to :user
  has_many :comments

  validates :body, presence: true
  validates :body, length: { maximum: 2000 }
end