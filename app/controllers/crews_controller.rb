class CrewsController < ApplicationController
  before_action :set_crew, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :destroy_book 
    


  # GET /crews
  # GET /crews.json
  def index
    @crews = Crew.all
  end
  
  def mypage
    @posts = Post.all
    
  end
  
  def mysign
    @pre_member= Crew.find(params[:id]).rolls
    @crew_id = params[:id]
  end

  # GET /crews/1
  # GET /crews/1.json
  def show
    @posts=Post.find_by(user_id: current_user.id)
  end

  # GET /crews/new
  def new
    @crew = Crew.new
  end

  # GET /crews/1/edit
  def edit
  end

  # POST /crews
  # POST /crews.json
  def create
    @crew = current_user.crews.new(crew_params)
    
    respond_to do |format|
      if @crew.save
        @crew.users.push(current_user)
        current_user.rolls.find_by(crew_id: @crew.id).update(is_signed?: "admin")
        
        format.html { redirect_to @crew, notice: 'Crew was successfully created.' }
        format.json { render :show, status: :created, location: @crew }
      else
        format.html { render :new }
        format.json { render json: @crew.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PATCH/PUT /crews/1
  # PATCH/PUT /crews/1.json
  def update
    respond_to do |format|
      if @crew.update(crew_params)
        format.html { redirect_to @crew, notice: 'Crew was successfully updated.' }
        format.json { render :show, status: :ok, location: @crew }
      else
        format.html { render :edit }
        format.json { render json: @crew.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crews/1
  # DELETE /crews/1.json
  def destroy
    @crew.users.delete(current_user)
    @crew.destroy
    
    respond_to do |format|
      format.html { redirect_to crews_url, notice: 'Crew was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crew
      @crew = Crew.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crew_params
      params.require(:crew).permit(:title, :desc, :image, :user_id)
    end
    
    def destroy_book
      Searching.destroy_all
    end
end
