require 'test_helper'

class ContestTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contest_type = contest_types(:one)
  end

  test "should get index" do
    get contest_types_url
    assert_response :success
  end

  test "should get new" do
    get new_contest_type_url
    assert_response :success
  end

  test "should create contest_type" do
    assert_difference('ContestType.count') do
      post contest_types_url, params: { contest_type: { description: @contest_type.description, name: @contest_type.name } }
    end

    assert_redirected_to contest_type_url(ContestType.last)
  end

  test "should show contest_type" do
    get contest_type_url(@contest_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_contest_type_url(@contest_type)
    assert_response :success
  end

  test "should update contest_type" do
    patch contest_type_url(@contest_type), params: { contest_type: { description: @contest_type.description, name: @contest_type.name } }
    assert_redirected_to contest_type_url(@contest_type)
  end

  test "should destroy contest_type" do
    assert_difference('ContestType.count', -1) do
      delete contest_type_url(@contest_type)
    end

    assert_redirected_to contest_types_url
  end
end
