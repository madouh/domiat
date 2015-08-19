class User < ActiveRecord::Base
	has_many :agents
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable #, :confirmable
   def is_admin?
   	self.admin
   end
end
