# encoding: UTF-8
class AgentsController < ApplicationController
      include AgentsHelper
      include SimpleCaptcha::ControllerHelpers
  before_filter :authenticate_user!, except: [ :show ]
  before_action :i_am_admin , only: [:toggle, :edit, :update, :destroy]
  before_action :set_agent, only: [:toggle, :show, :edit, :update, :destroy]

  # GET /agents
  # GET /agents.json
  def index
    if current_user.is_admin?
    @agents = Agent.all
    else
      redirect_to :root 
    end
  end

  # GET /agents/1
  # GET /agents/1.json
  def show
  end

  # GET /agents/new
  def new
    @agent = Agent.new
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
      if @agent.save_with_captcha
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
      if @agent.update(agent_params)
        format.html { redirect_to @agent, notice: 'Agent was successfully updated.' }
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
    if @agent.ok 
     @agent.update(:ok => false)
    flash[:notice] = "The agent is waited"
  else
    @agent.update(:ok => true)
    flash[:notice] = "The agent is verified, ThanX  "
  end
    redirect_to agents_path
  end

  #search action is to search through the verified agents aboute certain query
  def search

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agent
      @agent = Agent.find(params[:id])
    end
# verify if the current user is admin , if not, redirect_to the root path
    def i_am_admin
      unless current_user.is_admin?
        redirect_to :root    
        flash[:error] = "You haven't the rights to access the required page."
     
       end
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def agent_params
      params[:agent][:day_off] ||= []

      params.require(:agent).permit(:name, :region, :neighbour, :street, :address, :activity, :brief_of_activity, :twenty_four, :word1, :word2, :word3, :word4, :word5, :tel1, :tel2, :tel3, :email, :start, :end, :website1, :website2, :can_announce, :captcha, :captcha_key, day_off: [])
    end
end
