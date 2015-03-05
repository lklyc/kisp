class Article < ActiveRecord::Base
  #has_many :briefs
  has_many :briefs, as: :briefable
  has_many :comments
  belongs_to :user

  validates :title, presence: true
  validates :url, presence: true, uniqueness: true
  validates :published_on, presence: true
  validates :author, presence: true
end