class TextMessagesController < ApplicationController
  include ApplicationHelper
  
  skip_before_action :verify_authenticity_token, :only => [:create]
  
  # If webhooks are set up as GET requests
  def index
    create_message(params)
  end
  
  # If webhooks are set up as POST requests
  def create
    
    if Listener.exists?(phone_number: params[:From])
      @listener = Listener.where(phone_number: params[:From]).first
      if Conversation.exists?(sender_id: @listener.id)
        # Find conversation
        @conversation = Conversation.where(sender_id: @listener.id).first
        
        # Create message with conversation
        @message = @conversation.messages.create!(
          number: @listener.phone_number,
          text: params[:Body],
          inbound: true
        )
        
        # Render message with action cable
        send_cable(@message)
        
        # Check competitio -- to be updated later
        @competition = Competition.where("keyword like ?", "%#{params[:Body]}%").first
        @competition.competitors.create(phone_number: @listener.phone_number)
        
        # Send SMS
        boot_twilio
        @client.messages.create(
          from: ENV["TWILIO_NUMBER"],
          to: @listener.phone_number,
          body: "Hey! Thanks for being our listener. You're now registered as a competitor in the - #{@competition.title} - competition!"
        )
        
        @message = @conversation.messages.create!(
          number: @listener.phone_number,
          text: "Hey! Thanks for being our listener. You're now registered as a competitor in the - #{@competition.title} - competition!",
          inbound: false
        )
               
        # Render JSON 200
        render json: { state: 200 }
      else
        # Create conversation
        @conversation = @listener.conversations.build(sender_id: @listener.id)
        @conversation.save 
        
        # Create message with conversation
        @message = @conversation.messages.create!(
          number: @listener.phone_number,
          text: params[:Body],
          inbound: true
        )
        
        # Render message with action cable
        send_cable(@message)
        
        # Check competitio -- to be updated later
        @competition = Competition.where("keyword like ?", "%#{params[:Body]}%").first
        @competition.competitors.create(phone_number: @listener.phone_number)
        
        # Send SMS
        boot_twilio
        @client.messages.create(
          from: ENV["TWILIO_NUMBER"],
          to: @listener.phone_number,
          body: "Hey! Thanks for messaging us for the first time. You're now registered as a competitor in the - #{@competition.title} - competition!"
        )
        
        @message = @conversation.messages.create!(
          number: @listener.phone_number,
          text: "Hey! Thanks for messaging us for the first time. You're now registered as a competitor in the - #{@competition.title} - competition!",
          inbound: false
        )
        
        # Render JSON 200
        render json: { state: 200 }
      end
    else
      @listener = Listener.create!(phone_number: params[:From])
      
      # Create conversation
      @conversation = @listener.conversations.build(sender_id: @listener.id)
      
      # Create message with conversation
      @message = @conversation.messages.create!(
        number: @listener.phone_number,
        text: params[:Body],
        inbound: true
      )
      
      # Render message with action cable
      send_cable(@message)
      
      # Check competitio -- to be updated later
      @competition = Competition.where("keyword like ?", "%#{params[:Body]}%").first
      @competition.competitors.create(phone_number: @listener.phone_number)
      
      # Send SMS
      boot_twilio
      @client.messages.create(
        from: ENV["TWILIO_NUMBER"],
        to: @listener.phone_number,
        body: "Hey! Thanks for messaging us for the first time. You're now registered as a competitor in the - #{@competition.title} - competition!"
      )
      
      @message = @conversation.messages.create!(
        number: @listener.phone_number,
        text: "Hey! Thanks for messaging us for the first time. You're now registered as a competitor in the - #{@competition.title} - competition!",
        inbound: false
      )
      
      # Render JSON 200
      render json: { state: 200 }
    end
  end
  
  private
  
    def create_message(params)
      message = Message.create!(
        number: params[:From],
        text: params[:Body],
        inbound: true
      )
      
      send_cable(message)
      
      render json: { state: 200 }
    end
    
    def boot_twilio
      account_sid = ENV["TWILIO_ACCOUNT_SID"]
      auth_token = ENV["TWILIO_AUTH_TOKEN"]
      @client = Twilio::REST::Client.new account_sid, auth_token
    end
end