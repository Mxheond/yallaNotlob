class Notification < ActiveRecord::Base
  belongs_to :from
  belongs_to :to
  belongs_to :order_id
end
