class Facer < ActiveRecord::Base
	def self.from_omniauth(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_create do |facer|
			facer.provider=auth.provider
			facer.uid=auth.uid
			facer.name=auth.info.name
			facer.oauth_token=auth.credentials.token
			facer.image=auth.info.image
			facer.oauth_expires_at=Time.at(auth.credentials.expires_at)
			facer.save!
		end

	end
end
