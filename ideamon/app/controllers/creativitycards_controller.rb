class CreativitycardsController < ApplicationController
  before_action :set_creativitycard, only: [:show, :edit, :update, :destroy]
  before_action :set_ccard_admin_edit_destroy, only: [:show, :edit, :update, :destroy]
  before_action :set_ccard_admin_create, only: [:new, :create]
  before_action :authenticate_user!, except: [:home, :about, :help, :impressum]

  # GET /creativitycards
  # GET /creativitycards.json
  def index
    @creativitycards = Creativitycard.all.order(:title)
  end

  # GET /creativitycards/1
  # GET /creativitycards/1.json
  def show
  end

  # GET /creativitycards/new
  def new
    @creativitycard = Creativitycard.new
  end

  # GET /creativitycards/1/edit
  def edit
  end

  # POST /creativitycards
  # POST /creativitycards.json
  def create
    @creativitycard = Creativitycard.new(creativitycard_params)

    respond_to do |format|
      if @creativitycard.save
        format.html { redirect_to @creativitycard, notice: 'Creativitycard was successfully created.' }
        format.json { render :show, status: :created, location: @creativitycard }
      else
        format.html { render :new }
        format.json { render json: @creativitycard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /creativitycards/1
  # PATCH/PUT /creativitycards/1.json
  def update
    respond_to do |format|
      if @creativitycard.update(creativitycard_params)
        format.html { redirect_to @creativitycard, notice: 'Creativitycard was successfully updated.' }
        format.json { render :show, status: :ok, location: @creativitycard }
      else
        format.html { render :edit }
        format.json { render json: @creativitycard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creativitycards/1
  # DELETE /creativitycards/1.json
  def destroy
    @creativitycard.destroy
    respond_to do |format|
      format.html { redirect_to creativitycards_url, notice: 'Creativitycard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creativitycard
      @creativitycard = Creativitycard.find(params[:id])
    end

    def set_ccard_admin_edit_destroy
      @creativitycard = Creativitycard.find(params[:id])
      if @creativitycard.user_id != current_user.id || current_user.admin != true
        redirect_to :back, alert: 'Only Admin are alowd to edit or delete Creativitycards.'
      end
    end

    def set_ccard_admin_create
      @creativitycard = Creativitycard.new
      
      if current_user.admin != true
        redirect_to :back, alert: 'Only Admin are alowd to create Creativitycards.'
      end
    end    

    # Never trust parameters from the scary internet, only allow the white list through.
    def creativitycard_params
      params.require(:creativitycard).permit(:title, :suggestion, :example, :shortdescription, :image, :remote_image_url, :idea_id, :project_id, :user_id)
    end
end
