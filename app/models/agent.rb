# encoding: UTF-8
class Agent < ActiveRecord::Base
	#VALID_EMAIL_REGEX="/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i"
	#before_save {self.email=email.downcase}
	validates :name , :presence => { message:"اسم النشاط يجب أن يكون موجوداً"}, 
					length:{maximum:25, message:"الاسم لا يزيد عن 25 حروف"} ,
					 length:{minimum:10, message:"الاسم لا يقل عن 10 حروف"}

validates :activity , :presence => { message:"اسم النشاط يجب أن يكون موجوداً"}, 
					length:{maximum:25, message:"الاسم لا يزيد عن 25 حروف"} ,
					 length:{minimum:10, message:"الاسم لا يقل عن 10 حروف"}
validates :brief_of_activity , :presence => { message:"اسم النشاط يجب أن يكون موجوداً"}, 
					length:{maximum:25, message:"الاسم لا يزيد عن 25 حروف"} ,
					 length:{minimum:10, message:"الاسم لا يقل عن 10 حروف"}
validates :street , :presence => { message:"اسم النشاط يجب أن يكون موجوداً"}, 
					length:{maximum:25, message:"الاسم لا يزيد عن 25 حروف"} ,
					 length:{minimum:5, message:"الاسم لا يقل عن 10 حروف"}
validates :address , :presence => { message:"اسم النشاط يجب أن يكون موجوداً"}, 
					length:{maximum:25, message:"الاسم لا يزيد عن 25 حروف"} ,
					 length:{minimum:10, message:"الاسم لا يقل عن 10 حروف"}
validates :region , :presence => { message:"اسم النشاط يجب أن يكون موجوداً"}, 
					length:{maximum:25, message:"الاسم لا يزيد عن 25 حروف"} ,
					 length:{minimum:10, message:"الاسم لا يقل عن 10 حروف"}
validates :neighbour , :presence => { message:"اسم النشاط يجب أن يكون موجوداً"}, 
					length:{maximum:25, message:"الاسم لا يزيد عن 25 حروف"} ,
					 length:{minimum:10, message:"الاسم لا يقل عن 10 حروف"}
validates :tel1 , :presence => { message:"اسم النشاط يجب أن يكون موجوداً"}, 
					length:{maximum:13, message:"الاسم لا يزيد عن 25 حروف"} ,
					 length:{minimum:11, message:"الاسم لا يقل عن 10 حروف"},
					 :uniqueness => { message:"البريد الإلكتروني الذي أدخلته موجود مسبقاً"}

validates :latitude , :presence => { message:"اسم النشاط يجب أن يكون موجوداً"}, 
					length:{maximum:25, message:"الاسم لا يزيد عن 25 حروف"} ,
					 length:{minimum:10, message:"الاسم لا يقل عن 10 حروف"}
validates :langitude , :presence => { message:"اسم النشاط يجب أن يكون موجوداً"}, 
					length:{maximum:25, message:"الاسم لا يزيد عن 25 حروف"} ,
					 length:{minimum:10, message:"الاسم لا يقل عن 10 حروف"}


	#validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
    #validates :email, :uniqueness => { message:"البريد الإلكتروني الذي أدخلته موجود مسبقاً"}

	belongs_to :user
  apply_simple_captcha

  DAYS = [ "الجمعة", "اﻷحد", "الإثنين", "الثلاثاء", "اﻷربعاء", "الخميس", "السبت" ]

 end
