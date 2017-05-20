class SurveyQuestionTypesController < ApplicationController
  before_action :set_survey_question_type, only: [:show, :edit, :update, :destroy]

  # GET /survey_question_types
  # GET /survey_question_types.json
  def index
    @survey_question_types = SurveyQuestionType.all
  end

  # GET /survey_question_types/1
  # GET /survey_question_types/1.json
  def show
  end

  # GET /survey_question_types/new
  def new
    @survey_question_type = SurveyQuestionType.new
  end

  # GET /survey_question_types/1/edit
  def edit
  end

  # POST /survey_question_types
  # POST /survey_question_types.json
  def create
    @survey_question_type = SurveyQuestionType.new(survey_question_type_params)

    respond_to do |format|
      if @survey_question_type.save
        format.html { redirect_to @survey_question_type, notice: 'Survey question type was successfully created.' }
        format.json { render :show, status: :created, location: @survey_question_type }
      else
        format.html { render :new }
        format.json { render json: @survey_question_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /survey_question_types/1
  # PATCH/PUT /survey_question_types/1.json
  def update
    respond_to do |format|
      if @survey_question_type.update(survey_question_type_params)
        format.html { redirect_to @survey_question_type, notice: 'Survey question type was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey_question_type }
      else
        format.html { render :edit }
        format.json { render json: @survey_question_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survey_question_types/1
  # DELETE /survey_question_types/1.json
  def destroy
    @survey_question_type.destroy
    respond_to do |format|
      format.html { redirect_to survey_question_types_url, notice: 'Survey question type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_question_type
      @survey_question_type = SurveyQuestionType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_question_type_params
      params.require(:survey_question_type).permit(:name, :description)
    end
end
