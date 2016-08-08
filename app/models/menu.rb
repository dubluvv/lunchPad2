class Menu < ActiveRecord::Base
	has_many :orders
	has_many :users
	validates :title, presence: true,
                    length: { minimum: 5 }
end
