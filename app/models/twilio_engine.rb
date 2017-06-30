class TwilioEngine
  include Rails.application.routes.url_helpers
  # This class will handle all of the outgoing commerce to twilio.
  def send_message(message)
    require 'rubygems' # not necessary with ruby 1.9 but included for completeness
    require 'twilio-ruby'

    # put your own credentials here
    account_sid = 'ACcf44816e028745afb7164f3075ffea9f'
    auth_token = '9a52562786f3eeee632b909cf6409a42'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
      :from => message.from,
      :to => message.to,
      :body => message.body,
      :status_callback => "http://57db29d5.ngrok.io#{api_v1_message_update_message_path(message)}",
    })
  end

end
