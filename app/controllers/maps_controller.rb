class MapsController < ApplicationController
  def showmap
  	@location=Agent.last
  end

  def showroute
  	  	@location=Agent.last

  end
end
