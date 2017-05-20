require 'test_helper'

class BlastsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blast = blasts(:one)
  end

  test "should get index" do
    get blasts_url
    assert_response :success
  end

  test "should get new" do
    get new_blast_url
    assert_response :success
  end

  test "should create blast" do
    assert_difference('Blast.count') do
      post blasts_url, params: { blast: { blast_type_id: @blast.blast_type_id, description: @blast.description, name: @blast.name, schedule_id: @blast.schedule_id, status: @blast.status } }
    end

    assert_redirected_to blast_url(Blast.last)
  end

  test "should show blast" do
    get blast_url(@blast)
    assert_response :success
  end

  test "should get edit" do
    get edit_blast_url(@blast)
    assert_response :success
  end

  test "should update blast" do
    patch blast_url(@blast), params: { blast: { blast_type_id: @blast.blast_type_id, description: @blast.description, name: @blast.name, schedule_id: @blast.schedule_id, status: @blast.status } }
    assert_redirected_to blast_url(@blast)
  end

  test "should destroy blast" do
    assert_difference('Blast.count', -1) do
      delete blast_url(@blast)
    end

    assert_redirected_to blasts_url
  end
end
