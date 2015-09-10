class SessionsController < ApplicationController
	def create
		facer=Facer.from_omniauth(env["omniauth.auth"])
		session[:user_id]=facer.id
		redirect_to :root
	end
	def destroy
		session[:user_id]=nil
		redirect_to :root
	end

	private

  def user_params
    params.require(:facer).permit(:provider, :uid, :name, :oauth_token, :oauth_expires_at)
  end
end