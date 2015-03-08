class Concept < ActiveRecord::Base
  has_many :briefs, as: :briefable
  belongs_to :user

  validates :concept, presence: true
  validates :context, presence: true

  before_save :generate_display

  def generate_display
    self.display = self.concept + ' (' + self.context + ')'
  end
end