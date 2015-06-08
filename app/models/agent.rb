# encoding: UTF-8
class Agent < ActiveRecord::Base
  apply_simple_captcha

  DAYS = [ "الجمعة", "اﻷحد", "الإثنين", "الثلاثاء", "اﻷربعاء", "الخميس", "السبت" ]

 end
