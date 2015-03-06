class Concept < ActiveRecord::Base
  has_many :briefs, as: :briefable
  belongs_to :user

  validates :concept, presence: true
  validates :context, presence: true
end