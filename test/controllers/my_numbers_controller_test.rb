require 'test_helper'

class MyNumbersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @my_number = my_numbers(:one)
  end

  test "should get index" do
    get my_numbers_url
    assert_response :success
  end

  test "should get new" do
    get new_my_number_url
    assert_response :success
  end

  test "should create my_number" do
    assert_difference('MyNumber.count') do
      post my_numbers_url, params: { my_number: { description: @my_number.description, name: @my_number.name, phone_number_id: @my_number.phone_number_id } }
    end

    assert_redirected_to my_number_url(MyNumber.last)
  end

  test "should show my_number" do
    get my_number_url(@my_number)
    assert_response :success
  end

  test "should get edit" do
    get edit_my_number_url(@my_number)
    assert_response :success
  end

  test "should update my_number" do
    patch my_number_url(@my_number), params: { my_number: { description: @my_number.description, name: @my_number.name, phone_number_id: @my_number.phone_number_id } }
    assert_redirected_to my_number_url(@my_number)
  end

  test "should destroy my_number" do
    assert_difference('MyNumber.count', -1) do
      delete my_number_url(@my_number)
    end

    assert_redirected_to my_numbers_url
  end
end
