# encoding: UTF-8
class Agent < ActiveRecord::Base
	belongs_to :user
  apply_simple_captcha

  DAYS = [ "الجمعة", "اﻷحد", "الإثنين", "الثلاثاء", "اﻷربعاء", "الخميس", "السبت" ]

 end
