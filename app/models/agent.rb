# encoding: UTF-8
class Agent < ActiveRecord::Base
	#VALID_EMAIL_REGEX="/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i"
	#before_save {self.email=email.downcase}
	validates :name , :presence => { message:"اسم النشاط يجب أن يكون موجوداً"}, 
					length:{maximum:15, message:"الاسم لا يزيد عن 15 حروف"} ,
					 length:{minimum:6, message:"الاسم لا يقل عن 6 حروف"}

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
					length:{maximum:11, message:"رقم التليفون اﻷول لا يزيد عن 11 رقما و يجب ان يكون موبايل"} ,
					 length:{minimum:11, message:"رقم التليفون اﻷول لا يقل عن 11 رقما و يجب ان يكون موبايل"},
					 :uniqueness => { message:"رقم التليفون الذي أدخلته موجود مسبقاً"}

validates :latitude , :presence => { message:"الاحداثي يجب أن يكون موجوداً"}, 
					length:{maximum:18, message:"الاحداثي لا يزيد عن 18 رقم"} ,
					 length:{minimum:8, message:"الاحداثي لا يقل عن 8 أرقام"}

validates :langitude ,  :presence => { message:"الاحداثي يجب أن يكون موجوداً"}, 
					length:{maximum:18, message:"الاحداثي لا يزيد عن 18 رقم"} ,
					 length:{minimum:8, message:"الاحداثي لا يقل عن 8 أرقام"}
 validates_numericality_of :tel1
 
  validates_numericality_of :latitude, greater_than_or_equal_to:31.4010
  validates_numericality_of :latitude, less_than_or_equal_to: 31.4635

  validates_numericality_of :langitude, greater_than_or_equal_to: 31.6367
  validates_numericality_of :langitude, less_than_or_equal_to: 31.72

	#validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
    #validates :email, :uniqueness => { message:"البريد الإلكتروني الذي أدخلته موجود مسبقاً"}

	belongs_to :user
  apply_simple_captcha

  DAYS = [ "الجمعة", "اﻷحد", "الإثنين", "الثلاثاء", "اﻷربعاء", "الخميس", "السبت" ]

 end
