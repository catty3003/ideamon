class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :set_project_admin_edit_destroy, only: [:edit, :update, :destroy]
  before_action :set_project_admin_create, only: [:new, :create]
  before_action :set_user, only: [:help]
  before_action :authenticate_user!, except: [:home, :about, :help, :impressum]

  # GET /projects
  # GET /projects.json
  def home
  end

  def about
  end

  def help
  end

  def impressum
    
  end
  
  def index
    @projects =Project.all
    
    if params[:sorting]
      @done = Project.where("done = ? OR deadline < ?", true, Date.today).order(params[:sorting] => :asc)
      @todo = Project.where("done = ? AND deadline >= ?", false, Date.today).order(params[:sorting] => :asc)
    else 
      @done = Project.where("done = ? OR deadline < ?", true, Date.today).order(deadline: :desc)     
      @todo = Project.where("done = ? AND deadline >= ?", false, Date.today).order(deadline: :asc)
    end

    if current_user.admin != true
      redirect_to :root, alert: 'Only for Admins!'
    end

    respond_to do |format|
      format.html
      format.csv { send_data @projects.to_csv }
      format.xls
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @ideas = Idea.all
    @userprojects = current_user.projects.all
    @userideas = Project.find(params[:id]).ideas
    @idea = Idea.new
    @creativitycards = Creativitycard.all
    @projectccard = Project.find(params[:id]).creativitycards
  end

  # GET /projects/new
  def new
    @project = Project.new
    @project.ideas.build
    @project.creativitycards.build
  end

  # GET /projects/1/edit
  def edit   
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_user.projects.new(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    def set_project_admin_edit_destroy
      @project = Project.find(params[:id])
      if @project.user_id != current_user.id || current_user.admin != true
        redirect_to :back, alert: 'Only Admin are alowd to edit or delete Projects/ You can only change your own Project.'
      end
    end

    def set_project_admin_create
      @project = Project.new
      
      if current_user.admin != true
        redirect_to :back, alert: 'Only Admin are alowd to create Projects.'
      end
    end

    def set_user
       @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :deadline, :done, :question, :comment, :user_id, creativitycards_attributes: [:id, :title, :suggestion, :example, :shortdescription,  :image, :remote_image_url, :idea_id, :project_id, :user_id,  :_destroy])
    end
end
