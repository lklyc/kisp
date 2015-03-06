class Event < ActiveRecord::Base
  has_many :briefs, as: :briefable
  belongs_to :user

  validates :who, presence: true
  validates :what, presence: true
  validates :when, presence: true
  validates :where, presence: true
  validates :why, presence: true
  validates :source, presence: true
end