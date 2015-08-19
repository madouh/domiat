# encoding: UTF-8
class FindController < ApplicationController
    before_action :set_verified_agent, only: [:show_map, :show_route]
    before_action :set_verified_agent #, :corrupt 
    before_action :test_if_more_than_one  , only: [ :advanced ]
 
  def search
  	@clean_params=(params[:search]).gsub(/\s+/, ' ')
  	query="%" + @clean_params + "%"
  	@auto=[]
  	@auto.concat(@verified_agent.where('name LIKE ?', query).limit(5).pluck(:name))
  	@auto.concat(@verified_agent.where('activity LIKE ?', query).limit(5).pluck(:activity))
  	@auto.concat(@verified_agent.where('word1 LIKE ?', query).limit(5).pluck(:word1))
  	@auto.concat(@verified_agent.where('word2 LIKE ?', query).limit(5).pluck(:word2))
  	@auto.concat(@verified_agent.where('word3 LIKE ?', query).limit(5).pluck(:word3))
  	@auto.concat(@verified_agent.where('word4 LIKE ?', query).limit(5).pluck(:word4))
  	@auto.concat(@verified_agent.where('word5 LIKE ?', query).limit(5).pluck(:word5))
  	@auto.uniq!
    puts "from search 00000000000000000000000000000000000"
    puts @auto.inspect
    puts "from search 00000000000000000000000000000000000"

  end

  def corrupt
    puts "from corrupt 00000000000000000000000000000000000"
    puts params.inspect
    puts "from corrupt 00000000000000000000000000000000000"

    if params[:search] and (((params[:search]).gsub(/\s+/, '')).length>0)
    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base)
    @encrypted_data = crypt.encrypt_and_sign(params[:search])
    puts params[:search]
    else
            redirect_to :root

    end
  end

  def show
    
    if params[:search] and (((params[:search]).gsub(/\s+/, '')).length>0)
    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base)
    @clean_params = crypt.decrypt_and_verify(params[:search])
puts "////////////*////*/*/*/*/*//////////////////////*******************"
      #decrypted_back = crypt.decrypt_and_verify(encrypted_data)
      puts @clean_params
      	# @clean_params=@clean_params.gsub(/\s+/, ' ')
      	@result=@verified_agent.where('name=? OR activity=? OR word1=? OR word2=? OR word3=? OR word4=? OR word5=?',@clean_params,@clean_params,@clean_params,@clean_params,@clean_params,@clean_params,@clean_params).page params[:page]
        respond_to do |format|
            format.html 
            format.js 
        end
      else
        redirect_to :root
    end
puts " 777777777777777777777777777777777777777777777777"
puts @result.inspect
  end

   def detail
    @result=@verified_agent.select(:id,:name,:activity,:brief_of_activity).limit(5).order("RANDOM()")
   #   redirect_to :controller=>'find', :action=>'show', :search => params[:search]
    end

  def advanced
    @result=[]
    where_first_clause=""
    where_second_clause=""
    has_previous=false
      params.each do |key,value|
        if key.in?(['name','region','neighbour','street','activity'])
          if  !value.blank?
              if has_previous
                where_first_clause << "AND #{key} LIKE ? "
                where_second_clause << ","+"%" + value + "%"
              else
                where_first_clause << " #{key} LIKE ? "
                where_second_clause << "%" + value + "%"
                has_previous=true
              end #for if
          end # for if
        end #for if
        end #for do
        puts where_first_clause
        puts where_second_clause
        
        key='twenty_four'
        if params[:twenty_four]
              if has_previous
                where_first_clause << "AND #{key}= ? "
                where_second_clause << "," + "true" 
              else
                where_first_clause << " #{key} = ? "
                where_second_clause <<  "true" 
                has_previous=true
              end
        # else
        #       if has_previous
        #         where_first_clause << "AND #{key}= ? "
        #         where_second_clause << "," + "false" 
        #       else
        #         where_first_clause << " #{key} = ? "
        #         where_second_clause <<  "false" 
        #         has_previous=true
        #       end
        end # if params
            values= where_second_clause.split(',')
            length_of_array=values.length
            case length_of_array
            when 1
              @result= @verified_agent.where(where_first_clause,values[0]).page params[:page]
            when 2
              @result= @verified_agent.where(where_first_clause,values[0],values[1]).page params[:page]
            when 3
              @result= @verified_agent.where(where_first_clause,values[0],values[1],values[2]).page params[:page]
            when 4
              @result= @verified_agent.where(where_first_clause,values[0],values[1],values[2],values[3]).page params[:page]
            when 5
              @result= @verified_agent.where(where_first_clause,values[0],values[1],values[2],values[3],values[4]).page params[:page]
            when 6
              @result= @verified_agent.where(where_first_clause,values[0],values[1],values[2],values[3],values[4],values[5]).page params[:page]
            when 7
              @result= @verified_agent.where(where_first_clause,values[0],values[1],values[2],values[3],values[4],values[5],values[6]).page params[:page]
            end # of case 
          
    if !params[:word].blank?
    @result=@result.where('word1=? OR word2=? OR word3=? OR word4=? OR word5=?',params[:word],params[:word],params[:word],params[:word],params[:word]).page params[:page]
    end

    @result.uniq!
  end # end of advanced

  def ads

      sent_activity=params[:activity]
      @result=@verified_agent.select(:id, :name,:activity,:brief_of_activity).where('activity=? ',sent_activity).limit(5).order("RANDOM()")
      puts @result.inspect

  end

  
  private
  
  def set_verified_agent
  	  	@verified_agent=Agent.where('ok=?',true)

  end

  def test_if_more_than_one
     n=0
    params.each do |key,value|
        if key.in?(['name','region','neighbour','street','activity','word'])
            if !value.blank?
              puts key
              puts value
              n=n+1
            end
        end
    end

    if params.length==11
      n=n+1
    end

    if n<2
       flash[:error] = "يجب إختيار اثنين أو أكثر من تفاصيل البحث."
        redirect_to :find_detail
    end

  end # of test_if_more_than_one
  
end
