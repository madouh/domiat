# encoding: UTF-8
class Agent < ActiveRecord::Base
	#before_save {self.email=email.downcase}
validates :name , :presence => { message:"اسم النشاط يجب أن يكون موجوداً"}, 
					length:{maximum:25, message:"اسم النشاط لا يزيد عن 25 حروف"} ,
					 length:{minimum:6, message:"اسم النشاط لا يقل عن 6 حروف"}

validates :activity , :presence => { message:" النشاط يجب أن يكون موجوداً"}, 
					length:{maximum:15, message:"النشاط لا يزيد عن 15 حروف"} ,
					 length:{minimum:4, message:"النشاط لا يقل عن 4 حروف"}

validates :brief_of_activity , :presence => { message:"مختصر النشاط يجب أن يكون موجوداً"}, 
					length:{maximum:100, message:"مختصر النشاط لا يزيد عن 100 حروف"} ,
					 length:{minimum:20, message:"مختصر النشاط لا يقل عن 20 حروف"}

validates :street , :presence => { message:"اسم الشارع يجب أن يكون موجوداً"}, 
					length:{maximum:15, message:"اسم الشارع لا يزيد عن 15 حروف"} ,
					 length:{minimum:5, message:"اسم الشارع لا يقل عن 5 حروف"}

validates :address , :presence => { message:"العنوان يجب أن يكون موجوداً"}, 
					length:{maximum:25, message:"العنوان لا يزيد عن 25 حروف"} ,
					 length:{minimum:10, message:"العنوان لا يقل عن 10 حروف"}

validates :region , :presence => { message:"اسم المنطقة أو الحي يجب أن يكون موجوداً"}, 
					length:{maximum:15, message:"اسم المنطقة أو الحي لا يزيد عن 15 حروف"} ,
					 length:{minimum:5, message:"اسم المنطقة أو الحي لا يقل عن 5 حروف"}

validates :neighbour , :presence => { message:"اسم المجاورة أو الناحية يجب أن يكون موجوداً"}, 
					length:{maximum:15, message:"اسم المجاورة أو الناحية لا يزيد عن 15 حروف"} ,
					 length:{minimum:5, message:"اسم المجاورة أو الناحية لا يقل عن 5 حروف"}

validates :tel1 , :presence => { message:"رقم التليفون اﻷول يجب أن يكون موجوداً"}, 
					length:{is:11, message:"رقم التليفون اﻷول يجب أن يكون مكون من 11 رقما و يجب ان يكون موبايل"} ,
					 # length:{minimum:11, message:"رقم التليفون اﻷول لا يقل عن 11 رقما و يجب ان يكون موبايل"},
					 :uniqueness => { message:"رقم التليفون الذي أدخلته موجود مسبقاً"}

validates :latitude , :presence => { message:"الاحداثي يجب أن يكون موجوداً"}, 
					length:{maximum:18, message:"الاحداثي لا يزيد عن 18 رقم"} ,
					 length:{minimum:8, message:"الاحداثي لا يقل عن 8 أرقام"}

validates :langitude ,  :presence => { message:"الاحداثي يجب أن يكون موجوداً"}, 
					length:{maximum:18, message:"الاحداثي لا يزيد عن 18 رقم"} ,
					 length:{minimum:8, message:"الاحداثي لا يقل عن 8 أرقام"}

validates :tel1, numericality: { only_integer: true, message:"رقم التليفون يجب أن يكون أرقام فقط." }

  validates_numericality_of :latitude, greater_than_or_equal_to:31.4010, less_than_or_equal_to: 31.4635, message:"هذا اﻹحداثي خارج دمياط الجديدة و توابعها"

  validates_numericality_of :langitude, greater_than_or_equal_to: 31.6367, less_than_or_equal_to: 31.72, message:"هذا اﻹحداثي خارج دمياط الجديدة و توابعها"

  validates :tel2,:tel3, numericality: { only_integer: true, :allow_blank => true, :message =>"رقم التليفون يجب أن يكون أرقام فقط. أو فارغاً" } ,
  			:uniqueness => { message:"رقم التليفون الذي أدخلته موجود مسبقاً"}
 validate :start_equal_end_time

  	def start_equal_end_time
		if self.start == self.end
			errors.add(:end, 'لا يمكن أن يكون وقت بداية العمل يساوي وقت اﻹنتهاء طالما أنك لم تعمل 24 ساعة') unless self.twenty_four
		end
  	end

	belongs_to :user
  apply_simple_captcha

  DAYS = [ "الجمعة", "اﻷحد", "الإثنين", "الثلاثاء", "اﻷربعاء", "الخميس", "السبت" ]

 end
