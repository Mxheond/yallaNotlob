class Order < ActiveRecord::Base
	has_many :items
	enum order_for: [ :breakfast , :lunch , :dinner   ]
	
end
