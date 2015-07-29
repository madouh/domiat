class FindController < ApplicationController
	  before_action :set_verified_agent 
  def search
  	@res=["Mamdouh","Ahmad","Sohair","Omar"]
  	@clean_params=(params[:search]).gsub(/\s+/, ' ')
  	puts "from search ============================"
  	puts @clean_params.inspect
  	puts "============================"
  	query="%" + @clean_params + "%"
  	@result=@verified_agent.where('name=?',@clean_params)
  	puts @result.inspect
  	@auto=[]
  	@auto.concat(@verified_agent.where('name LIKE ?', query).limit(5).pluck(:name))
  	@auto.concat(@verified_agent.where('activity LIKE ?', query).limit(5).pluck(:activity))
  	@auto.concat(@verified_agent.where('word1 LIKE ?', query).limit(5).pluck(:word1))
  	@auto.concat(@verified_agent.where('word2 LIKE ?', query).limit(5).pluck(:word2))
  	@auto.concat(@verified_agent.where('word3 LIKE ?', query).limit(5).pluck(:word3))
  	@auto.concat(@verified_agent.where('word4 LIKE ?', query).limit(5).pluck(:word4))
  	@auto.concat(@verified_agent.where('word5 LIKE ?', query).limit(5).pluck(:word5))
  	@auto.uniq!
  	puts @auto.inspect
  end
  def show
    if params[:search]
        #@para=params
      	@clean_params=(params[:search]).gsub(/\s+/, ' ')
      	puts "from show ============================"
      	puts @clean_params.inspect
      	puts "============================"
      	@result=@verified_agent.where('name=? OR activity=? OR word1=? OR word2=? OR word3=? OR word4=? OR word5=?',@clean_params,@clean_params,@clean_params,@clean_params,@clean_params,@clean_params,@clean_params).page params[:page]
      	puts @result.inspect
        respond_to do |format|
            format.html 
            #format.json { render json: @result }
            format.js 
        end

    end

  end

  # def redirect
  #   #if params[:search]
  #     puts "from redirect ============================"
  #       puts params.inspect
  #       puts "============================"
  #    redirect_to :controller=>'find', :action=>'show', :search => params[:search]
  #  #  end
  # end

  private
  def set_verified_agent
  	  	@verified_agent=Agent.where('ok=?',true)
  end


end
