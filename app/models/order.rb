class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :menu
  validates :user_id, presence: true
  validates :menu_id, presence: true
end
