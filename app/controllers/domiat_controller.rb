# encoding: UTF-8
class DomiatController < ApplicationController
 before_action :verify, except: [:welcome, :about]

  def welcome
  end

  def about
  end
  def show
  	@one=ErrorMessage.find(params[:id])
  end
  def exception
  	
		  	@errors=ErrorMessage.all
		 
  end
  def clean
  	
		  	ErrorMessage.first.delete
		  	redirect_to :domiat_show
		
  end
  def cleanall
  	ErrorMessage.delete_all
  	redirect_to :domiat_show
  end
  def user
  	@user=User.find(params[:id])
  end

  def users
  	@users=User.all
  end


  private

  def verify
  	if current_user
	  	if current_user.is_admin?
		  	return
		else
			  raise ActionController::RoutingError.new('ليس من حقك الوصول لمثل هذة الصفحة')			
			  #render file: "#{Rails.root}/public/404k.html", layout: false, status: 404

	    end
	 else
			  raise ActionController::RoutingError.new('ليس من حقك الوصول لمثل هذة الصفحة')
			  #render file: "#{Rails.root}/public/404k.html", layout: false, status: 404

	end

  end
end
