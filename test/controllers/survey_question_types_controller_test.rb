require 'test_helper'

class SurveyQuestionTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @survey_question_type = survey_question_types(:one)
  end

  test "should get index" do
    get survey_question_types_url
    assert_response :success
  end

  test "should get new" do
    get new_survey_question_type_url
    assert_response :success
  end

  test "should create survey_question_type" do
    assert_difference('SurveyQuestionType.count') do
      post survey_question_types_url, params: { survey_question_type: { description: @survey_question_type.description, name: @survey_question_type.name } }
    end

    assert_redirected_to survey_question_type_url(SurveyQuestionType.last)
  end

  test "should show survey_question_type" do
    get survey_question_type_url(@survey_question_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_survey_question_type_url(@survey_question_type)
    assert_response :success
  end

  test "should update survey_question_type" do
    patch survey_question_type_url(@survey_question_type), params: { survey_question_type: { description: @survey_question_type.description, name: @survey_question_type.name } }
    assert_redirected_to survey_question_type_url(@survey_question_type)
  end

  test "should destroy survey_question_type" do
    assert_difference('SurveyQuestionType.count', -1) do
      delete survey_question_type_url(@survey_question_type)
    end

    assert_redirected_to survey_question_types_url
  end
end
