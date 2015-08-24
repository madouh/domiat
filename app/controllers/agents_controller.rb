# encoding: UTF-8
class AgentsController < ApplicationController
      include AgentsHelper
      include SimpleCaptcha::ControllerHelpers
  before_filter :authenticate_user!, except: [:show, :mapandroute ]
     #the arrange or the dependency of i_am_admin_or_owner on set_agent is important.
  before_action :set_agent, only: [ :i_am_admin_or_owner, :toggle, :show, :edit, :update, :destroy]
  before_action :set_verified_agent, only: [:mapandroute]
  before_action :i_am_admin_or_owner , only: [ :edit, :update, :destroy]

  # GET /agents
  # GET /agents.json
  def index
    if current_user.is_admin? 
    @agents = Agent.all.order(:name)
    else
      redirect_to :root 
    end
  end

  # GET /agents/1
  # GET /agents/1.json
  def show
      # AWS.config(access_key_id:     ENV['S3_ACCESS_KEY_ID'],
      #            secret_access_key: ENV['S3_SECRET_ACCESS_KEY'] )

      # S3_BUCKET = AWS::S3.new.buckets[ENV'S3_BUCKET']
  end

  # GET /agents/new
  def new
    @agent = Agent.new
  end

  def waited
    
    if current_user.is_admin? 
    @agents = Agent.where(:ok => false).order(:created_at)
    else
      redirect_to :root 
    end
  end
  # GET /agents/1/edit
  def edit
  end

  # POST /agents
  # POST /agents.json
  def create
    #render :text => params.inspect
    @agent = Agent.new(agent_params)

    respond_to do |format|
      if  (@agent.save_with_captcha and @agent.update(:user_id => current_user.id))
        # AgentMailer.welcome_email(@agent).deliver_now
        #sending SMS with saved agent's data
        # send_sms(@agent)
        # AgentMailer.inform_admin(@agent).deliver_now

        format.html { redirect_to @agent, notice: 'Agent was successfully created.' }
        format.json { render :show, status: :created, location: @agent }
      else
        format.html { render :new }
        format.json { render json: @agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agents/1
  # PATCH/PUT /agents/1.json
  def update
    respond_to do |format|
      if (@agent.update(agent_params) and @agent.update(:ok => false))
        format.html { redirect_to @agent, notice: 'تم التعديل بنجاح و ستم انتظار المراجة في أقرب وقت ممكن.' }
        format.json { render :show, status: :ok, location: @agent }
      else
        format.html { render :edit }
        format.json { render json: @agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agents/1
  # DELETE /agents/1.json
  def destroy
    @agent.destroy
    respond_to do |format|
      format.html { redirect_to agents_url, notice: 'Agent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  #verify action is to mark the "ok" field in the agents table to true to be showon in searching.
  # verify is a member of agents route- get agents/:id/verify.
  def toggle

    if current_user.is_admin? 
          if @agent.ok 
               @agent.update_attribute(:ok,false)
               flash[:notice] = "The agent is waited"
          else
              @agent.update_attribute(:ok,true)
              flash[:notice] = "The agent is verified, ThanX  "
          end
        redirect_to :agents_waited
    end
  end

  def mapandroute
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agent
      @agent = Agent.find(params[:id])
    end

    def set_verified_agent

      if current_user.is_admin?

        @agent = Agent.find(params[:id])
      else
      @agent= Agent.where(:ok => true).find(params[:id])
      end
    end
# verify if the current user is admin , if not, redirect_to the root path
    def i_am_admin_or_owner
      unless ((current_user.is_admin?) or (@agent.email==current_user.email))
        redirect_to :root    
        flash[:error] = "ليس لديك الحق في رؤية هذة الصفحة."
     
       end
    end
    def i_am_admin
      current_user.is_admin?

    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def agent_params
      params[:agent][:day_off] ||= []
      params.require(:agent).permit(:name, :region, :neighbour, :street, :address, :activity, :brief_of_activity, :twenty_four, :word1, :word2, :word3, :word4, :word5, :tel1, :tel2, :tel3, :email, :start, :end, :website1, :website2, :can_announce, :captcha, :captcha_key, :latitude, :langitude, day_off: [])
    end
end
