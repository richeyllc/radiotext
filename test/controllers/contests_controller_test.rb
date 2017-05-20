require 'test_helper'

class ContestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contest = contests(:one)
  end

  test "should get index" do
    get contests_url
    assert_response :success
  end

  test "should get new" do
    get new_contest_url
    assert_response :success
  end

  test "should create contest" do
    assert_difference('Contest.count') do
      post contests_url, params: { contest: { caller_x: @contest.caller_x, caller_y: @contest.caller_y, contest_type_id: @contest.contest_type_id, description: @contest.description, keyword: @contest.keyword, name: @contest.name, scehdule_id: @contest.scehdule_id, survey_id: @contest.survey_id, texter_x: @contest.texter_x, texter_y: @contest.texter_y, winner: @contest.winner } }
    end

    assert_redirected_to contest_url(Contest.last)
  end

  test "should show contest" do
    get contest_url(@contest)
    assert_response :success
  end

  test "should get edit" do
    get edit_contest_url(@contest)
    assert_response :success
  end

  test "should update contest" do
    patch contest_url(@contest), params: { contest: { caller_x: @contest.caller_x, caller_y: @contest.caller_y, contest_type_id: @contest.contest_type_id, description: @contest.description, keyword: @contest.keyword, name: @contest.name, scehdule_id: @contest.scehdule_id, survey_id: @contest.survey_id, texter_x: @contest.texter_x, texter_y: @contest.texter_y, winner: @contest.winner } }
    assert_redirected_to contest_url(@contest)
  end

  test "should destroy contest" do
    assert_difference('Contest.count', -1) do
      delete contest_url(@contest)
    end

    assert_redirected_to contests_url
  end
end
