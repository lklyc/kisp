class Event < ActiveRecord::Base
  has_many :briefs, as: :briefable
  belongs_to :user

  validates :who, presence: true
  validates :what, presence: true
  validates :when, presence: true
  validates :where, presence: true
  validates :why, presence: true
  validates :source, presence: true

  before_save :generate_display

  def generate_display
    self.display = self.who + '-' + self.what + '-' + self.when + '-' + self.where + '-' + self.why
  end
end