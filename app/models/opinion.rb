class Opinion < ActiveRecord::Base
  has_many :briefs, as: :briefable
  belongs_to :user

  validates :x, presence: true
  validates :y, presence: true
end