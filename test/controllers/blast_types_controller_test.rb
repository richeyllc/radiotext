require 'test_helper'

class BlastTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blast_type = blast_types(:one)
  end

  test "should get index" do
    get blast_types_url
    assert_response :success
  end

  test "should get new" do
    get new_blast_type_url
    assert_response :success
  end

  test "should create blast_type" do
    assert_difference('BlastType.count') do
      post blast_types_url, params: { blast_type: { description: @blast_type.description, name: @blast_type.name } }
    end

    assert_redirected_to blast_type_url(BlastType.last)
  end

  test "should show blast_type" do
    get blast_type_url(@blast_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_blast_type_url(@blast_type)
    assert_response :success
  end

  test "should update blast_type" do
    patch blast_type_url(@blast_type), params: { blast_type: { description: @blast_type.description, name: @blast_type.name } }
    assert_redirected_to blast_type_url(@blast_type)
  end

  test "should destroy blast_type" do
    assert_difference('BlastType.count', -1) do
      delete blast_type_url(@blast_type)
    end

    assert_redirected_to blast_types_url
  end
end
