require 'test_helper'

class ScheduleTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @schedule_type = schedule_types(:one)
  end

  test "should get index" do
    get schedule_types_url
    assert_response :success
  end

  test "should get new" do
    get new_schedule_type_url
    assert_response :success
  end

  test "should create schedule_type" do
    assert_difference('ScheduleType.count') do
      post schedule_types_url, params: { schedule_type: { description: @schedule_type.description, name: @schedule_type.name } }
    end

    assert_redirected_to schedule_type_url(ScheduleType.last)
  end

  test "should show schedule_type" do
    get schedule_type_url(@schedule_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_schedule_type_url(@schedule_type)
    assert_response :success
  end

  test "should update schedule_type" do
    patch schedule_type_url(@schedule_type), params: { schedule_type: { description: @schedule_type.description, name: @schedule_type.name } }
    assert_redirected_to schedule_type_url(@schedule_type)
  end

  test "should destroy schedule_type" do
    assert_difference('ScheduleType.count', -1) do
      delete schedule_type_url(@schedule_type)
    end

    assert_redirected_to schedule_types_url
  end
end
