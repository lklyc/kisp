class User < ActiveRecord::Base
has_secure_password

has_many :articles
has_many :briefs
has_many :comments
has_many :concepts
has_many :events
has_many :opinions
has_many :votes

validates :first_name, presence: true
validates :last_name, presence: true
validates :email, presence: true, uniqueness: true
validates :password, presence: true
validates_confirmation_of :password, :email
end