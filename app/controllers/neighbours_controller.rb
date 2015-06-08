class NeighboursController < ApplicationController
  before_filter :authenticate_user!
  before_action :i_am_admin

  before_action :set_neighbour, only: [:show, :edit, :update, :destroy]

  # GET /neighbours
  # GET /neighbours.json
  def index
    @neighbours = Neighbour.all
  end

  # GET /neighbours/1
  # GET /neighbours/1.json
  def show
  end

  # GET /neighbours/new
  def new
    @neighbour = Neighbour.new
  end

  # GET /neighbours/1/edit
  def edit
  end

  # POST /neighbours
  # POST /neighbours.json
  def create
    @neighbour = Neighbour.new(neighbour_params)

    respond_to do |format|
      if @neighbour.save
        format.html { redirect_to @neighbour, notice: 'Neighbour was successfully created.' }
        format.json { render :show, status: :created, location: @neighbour }
      else
        format.html { render :new }
        format.json { render json: @neighbour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /neighbours/1
  # PATCH/PUT /neighbours/1.json
  def update
    respond_to do |format|
      if @neighbour.update(neighbour_params)
        format.html { redirect_to @neighbour, notice: 'Neighbour was successfully updated.' }
        format.json { render :show, status: :ok, location: @neighbour }
      else
        format.html { render :edit }
        format.json { render json: @neighbour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /neighbours/1
  # DELETE /neighbours/1.json
  def destroy
    @neighbour.destroy
    respond_to do |format|
      format.html { redirect_to neighbours_url, notice: 'Neighbour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_neighbour
      @neighbour = Neighbour.find(params[:id])
    end
    # verify if the current user is admin , if not, redirect_to the root path
    def i_am_admin
      unless current_user.is_admin?
        redirect_to :root    
        flash[:error] = "You haven't the rights to access the required page."
       end
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def neighbour_params
      params.require(:neighbour).permit(:name)
    end
end
