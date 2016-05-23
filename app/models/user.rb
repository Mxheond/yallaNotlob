class User < ActiveRecord::Base
  has_many :memberships
  has_many :groups, :through => :memberships
  has_many :friends, :through => :friend
  has_many :friends
  has_many :notifications, foreign_key: :recipient_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :items

  def full_name
  	first_name + " " + last_name
  end
end
