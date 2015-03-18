class Article < ActiveRecord::Base
  #has_many :briefs
  has_many :briefs, as: :briefable
  has_many :comments
  belongs_to :user

  validates :title, presence: true
  validates :url, presence: true, uniqueness: true
  validates :author, presence: true

  before_save :generate_display

  def generate_display
    self.display = self.title
  end
end