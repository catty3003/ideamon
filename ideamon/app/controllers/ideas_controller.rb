class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]
  before_action :set_idea_identification, only: [ :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /ideas
  # GET /ideas.json
  def start
    if params[:sorting]
      @done = Project.where("done = ? OR deadline < ?", true, Date.today).order(params[:sorting] => :asc)
      @todo = Project.where("done = ? AND deadline > ?", false, Date.today).order(params[:sorting] => :asc)
    else 
      @done = Project.where("done = ? OR deadline < ?", true, Date.today).order(deadline: :desc)     
      @todo = Project.where("done = ? AND deadline > ?", false, Date.today).order(deadline: :asc)
    end
  end

  def index
    @ideas = Idea.all

    if current_user.admin != true
      redirect_to :root, alert: 'Only for Admins!'
    end

    respond_to do |format|
      format.html
      format.csv { send_data @ideas.to_csv }
      format.xls
    end
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
  end

  # GET /ideas/new
  def new
    @idea = Idea.new
    @useridea = current_user.ideas.all
  end

  # GET /ideas/1/edit
  def edit
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = current_user.ideas.new(idea_params)

    respond_to do |format|
      if @idea.save
        format.html { redirect_to :back, notice: 'Idea was successfully created.' }
        format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :new }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url, notice: 'Idea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    def set_idea_identification
      @idea = Idea.find(params[:id])
      if @idea.user_id != current_user.id
        redirect_to idea_path, alert: 'You can edit oder delete only your own Ideas.'
      end
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:post, :project_id, :user_id)
    end
end
