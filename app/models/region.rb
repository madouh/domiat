# encoding: UTF-8
class Region < ActiveRecord::Base
	validates :name , :presence => { message:"اسم المنطقة أو الحي يجب أن يكون موجوداً"}, 
					length:{maximum:15, message:"اسم المنطقة أو الحي لا يزيد عن 15 حروف"} ,
					 length:{minimum:5, message:"اسم المنطقة أو الحي لا يقل عن 5 حروف"}

end
