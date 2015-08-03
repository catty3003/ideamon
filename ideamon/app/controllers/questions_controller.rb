class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_user_identification, only: [ :edit, :update, :destroy]
  before_action :set_admin, only: [:index]
  before_action :authenticate_user!


  # GET /questions
  # GET /questions.json

  def index
    @questions = Question.all

    respond_to do |format|
      format.html
      format.csv { send_data @questions.to_csv }
      format.xls
    end
    
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
    @userquestion = Question.all.where("user_id = current_user.id")

  end

  # GET /questions/1/edit
  def edit
    @userquestion = Question.all.where("user_id = current_user.id")
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = current_user.questions.new(question_params)
    respond_to do |format|
      if @question.save
        format.html { redirect_to edit_question_path(@question), notice: 'Questionnaire was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update

    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to :back, notice: 'Questionnaire was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Questionnaire was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    def set_admin
      if current_user == nil || current_user.admin != true
        redirect_to :back, alert: 'Only Admin are alowd to see results.'
      end
    end

    def set_user_identification
      @question = Question.find(params[:id])
      if @question.user_id != current_user.id
        redirect_to question_path, alert: 'You can edit oder delete only your own Ideas.'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, :f11, :f12, :f13, :f14, :f15, :f16, :f17, :f18, :user_id)
    end
end
