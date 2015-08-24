# encoding: UTF-8
class Activity < ActiveRecord::Base
	validates :name , :presence => { message:"اسم النشاط يجب أن يكون موجوداً"}, 
					length:{maximum:15, message:"اسم النشاط لا يزيد عن 15 حروف"} ,
					 length:{minimum:5, message:"اسم النشاط لا يقل عن 5 حروف"}

end
