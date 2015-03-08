class Opinion < ActiveRecord::Base
  has_many :briefs, as: :briefable
  belongs_to :user

  validates :x, presence: true
  validates :y, presence: true

  before_save :generate_display

  def generate_display
    self.display = 'I think ' + self.x + ' is ' + self.y
  end
end