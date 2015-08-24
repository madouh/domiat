# encoding: UTF-8
class Neighbour < ActiveRecord::Base
	validates :name , :presence => { message:"اسم المجاورة أو الناحية يجب أن يكون موجوداً"}, 
					length:{maximum:15, message:"اسم المجاورة أو الناحية لا يزيد عن 15 حروف"} ,
					 length:{minimum:5, message:"اسم المجاورة أو الناحية لا يقل عن 5 حروف"}

end
