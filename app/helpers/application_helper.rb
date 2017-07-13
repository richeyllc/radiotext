module ApplicationHelper
  def send_sms message
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new account_sid, auth_token
    
    @client.messages.create(
      from: ENV["TWILIO_NUMBER"],
      to: message.number,
      body: message.text
    )
  end
  
  
  def send_cable message
    html = render_message(message)
    ActionCable.server.broadcast 'messages',
      number: message.number,
      html: html
  end

  def render_message message
    ApplicationController.render({
      partial: 'messages/message',
      locals: { message: message }
    })
end
end
