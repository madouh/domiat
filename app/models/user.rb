# encoding: UTF-8
class User < ActiveRecord::Base
	before_save {self.email=email.downcase}
	validates :username , :presence => { message:"الاسم يجب أن يكون موجوداً"}
	validates :username , length:{maximum:25, message:"الاسم لا يزيد عن 25 حروف"}
	validates :username , length:{minimum:10, message:"الاسم لا يقل عن 10 حروف"}

	has_many :agents
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable #, :confirmable
   def is_admin?
   	self.admin
   end
end
