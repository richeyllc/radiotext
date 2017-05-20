class SurveyQuestionResponsesController < ApplicationController
  before_action :set_survey_question_response, only: [:show, :edit, :update, :destroy]

  # GET /survey_question_responses
  # GET /survey_question_responses.json
  def index
    @survey_question_responses = SurveyQuestionResponse.all
  end

  # GET /survey_question_responses/1
  # GET /survey_question_responses/1.json
  def show
  end

  # GET /survey_question_responses/new
  def new
    @survey_question_response = SurveyQuestionResponse.new
  end

  # GET /survey_question_responses/1/edit
  def edit
  end

  # POST /survey_question_responses
  # POST /survey_question_responses.json
  def create
    @survey_question_response = SurveyQuestionResponse.new(survey_question_response_params)

    respond_to do |format|
      if @survey_question_response.save
        format.html { redirect_to @survey_question_response, notice: 'Survey question response was successfully created.' }
        format.json { render :show, status: :created, location: @survey_question_response }
      else
        format.html { render :new }
        format.json { render json: @survey_question_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /survey_question_responses/1
  # PATCH/PUT /survey_question_responses/1.json
  def update
    respond_to do |format|
      if @survey_question_response.update(survey_question_response_params)
        format.html { redirect_to @survey_question_response, notice: 'Survey question response was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey_question_response }
      else
        format.html { render :edit }
        format.json { render json: @survey_question_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survey_question_responses/1
  # DELETE /survey_question_responses/1.json
  def destroy
    @survey_question_response.destroy
    respond_to do |format|
      format.html { redirect_to survey_question_responses_url, notice: 'Survey question response was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_question_response
      @survey_question_response = SurveyQuestionResponse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_question_response_params
      params.require(:survey_question_response).permit(:contact_id, :survey_id, :survey_question_id, :boolean_response, :rate_response, :written_response)
    end
end
