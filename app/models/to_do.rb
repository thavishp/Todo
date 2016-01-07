class ToDo < ActiveRecord::Base
	belongs_to :user

	scope :sorted, lambda {order(title: :asc)}

end
