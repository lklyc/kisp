class User < ActiveRecord::Base
has_secure_password

has_many :articles
has_many :briefs
has_many :comments

validates :first_name, presence: true
validates :last_name, presence: true
validates :email, presence: true, uniqueness: true
validates :password, presence: true
validates_confirmation_of :password, :email
end