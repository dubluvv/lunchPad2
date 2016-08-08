class User < ActiveRecord::Base
	validates :phone, presence: true, length: {minimum:10}
  validates :first_name, presence: true, length: {minimum:3}
  validates :last_name, presence: true, length: {minimum:3}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password
	has_many :orders

	enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?

	def set_default_role
    self.role ||= :user
  end

  def is_admin? 
    self.role == 'admin' 
  end

  def set_admin_role
  	self.role ||= :admin
  end

end
