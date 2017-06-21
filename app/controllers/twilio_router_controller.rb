require 'twilio-ruby'
class TwilioRouterController < ApplicationController
  include Webhookable

  after_action :set_header

  skip_before_action :verify_authenticity_token
  def incoming_message
    # Sample Parameters: {
    # "ToCountry"=>"US",
    # "ToState"=>"UT",
    # "SmsMessageSid"=>"SM8e129b645e920b4f7a88fec6aeb3de38",
    # "NumMedia"=>"0",
    # "ToCity"=>"HURRICANE",
    # "FromZip"=>"84770",
    # "SmsSid"=>"SM8e129b645e920b4f7a88fec6aeb3de38",
    # "FromState"=>"UT",
    # "SmsStatus"=>"received",
    # "FromCity"=>"ST GEORGE",
    # "Body"=>"Testing this message receipt.",
    # "FromCountry"=>"US",
    # "To"=>"+14352161902",
    # "ToZip"=>"84737",
    # "NumSegments"=>"1",
    # "MessageSid"=>"SM8e129b645e920b4f7a88fec6aeb3de38",
    # "AccountSid"=>"ACcf44816e028745afb7164f3075ffea9f",
    # "From"=>"+14353134714",
    # "ApiVersion"=>"2010-04-01",
    # "controller"=>"twilio_router", "action"=>"incoming_message"
    # }

    # Message(contact_id: integer, phone_number_id: integer)

    # Now put that received message into the database:
    # Find or create the PhoneNumber
    this_phone = PhoneNumber.find_or_create_by(number: params["To"])
    # Find or create the contact
    this_contact = Contact.find_or_create_by(phone_number: this_phone)
    # I can't get an automated process to work. Let's do this very wet (not DRY)
    Message.create(account_sid: params["AccountSid"], to: params["To"], from: params["From"], body: params["Body"],
      status: "received", flag: nil, api_version: params["ApiVersion"], price: nil, uri: nil,
      twilio_data: params.inspect, date_seen: nil, to_country: params["ToCountry"], to_state: params["ToState"],
      sms_message_sid: params["SmsMessageSid"], num_media: params["NumMedia"], to_city: params["ToCity"],
      from_zip: params["FromZip"], from_state: params["FromState"], sms_status: params["SmsStatus"], from_city: params["FromCity"],
      from_country: params["FromCountry"], to_zip: params["ToZip"], num_segments: params["NumSegments"],
      message_sid: params["MessageSid"], sms_sid: params["SmsSid"], contact: this_contact, phone_number: this_phone)

    head :ok
  end

end
