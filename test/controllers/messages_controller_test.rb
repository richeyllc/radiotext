require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message = messages(:one)
  end

  test "should get index" do
    get messages_url
    assert_response :success
  end

  test "should get new" do
    get new_message_url
    assert_response :success
  end

  test "should create message" do
    assert_difference('Message.count') do
      post messages_url, params: { message: { account_sid: @message.account_sid, api_version: @message.api_version, body: @message.body, contact_id: @message.contact_id, date_sent: @message.date_sent, flag: @message.flag, from: @message.from, phone_number_id: @message.phone_number_id, price: @message.price, status: @message.status, to: @message.to, twilio_data: @message.twilio_data, twilio_date_created: @message.twilio_date_created, twilio_date_updated: @message.twilio_date_updated, uri: @message.uri } }
    end

    assert_redirected_to message_url(Message.last)
  end

  test "should show message" do
    get message_url(@message)
    assert_response :success
  end

  test "should get edit" do
    get edit_message_url(@message)
    assert_response :success
  end

  test "should update message" do
    patch message_url(@message), params: { message: { account_sid: @message.account_sid, api_version: @message.api_version, body: @message.body, contact_id: @message.contact_id, date_sent: @message.date_sent, flag: @message.flag, from: @message.from, phone_number_id: @message.phone_number_id, price: @message.price, status: @message.status, to: @message.to, twilio_data: @message.twilio_data, twilio_date_created: @message.twilio_date_created, twilio_date_updated: @message.twilio_date_updated, uri: @message.uri } }
    assert_redirected_to message_url(@message)
  end

  test "should destroy message" do
    assert_difference('Message.count', -1) do
      delete message_url(@message)
    end

    assert_redirected_to messages_url
  end
end
