class Group < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  has_many :memberships
  has_many :users, through: :memberships, dependent: :destroy

end
