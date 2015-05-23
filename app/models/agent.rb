class Agent < ActiveRecord::Base
  apply_simple_captcha

  belongs_to :region
  belongs_to :neighbour
  belongs_to :activity
end
