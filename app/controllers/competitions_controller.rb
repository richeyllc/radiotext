class CompetitionsController < ApplicationController
  before_action :set_competition, only: [:show, :edit, :update, :pick_winner]
  skip_before_action :verify_authenticity_token, only: [:incoming_sms]
  
  def index
    @competitions = Competition.not_expired
  end
  
  def show
  end
  
  def new
    @competition = Competition.new
  end
  
  def create
    @competition = Competition.new(competition_params)
    @competition.keyword.downcase!
    
    if @competition.save
      redirect_to competition_path(@competition), notice: 'Your competition was successfully created!'
    else
      render :edit, notice: 'There was an error processing your request!'
    end
  end
  
  def edit
  end
  
  def update
    if @competition.update(competition_params)
      redirect_to @competition, notice: 'Your competition was successfully updated!'
    else
      render :edit, notice: 'There was an error processing your request!'
    end
  end
  
  # It might need a refactor
  def pick_winner
    if @competition.winner
      redirect_to competition_path(@competition)
    else
      if not @competition.competitors.count == 0
        
        if @competition.category == 'one_random'
          picked_winner = @competition.competitors.order("RANDOM()").first.phone_number
          @competition.winner = picked_winner
          @competition.save
          
          # Send SMS to winner
          boot_twilio
          sms = @client.messages.create(
            from: ENV["TWILIO_NUMBER"],
            to: picked_winner,
            body: "Hello! You've won our competition - #{@competition.title} - we will contact you soon for your prize!"
          )
          
          message = Message.create!(
            number: picked_winner,
            text: "Hello! You've won our competition - #{@competition.title} - we will contact you soon for your prize!",
            inbound: false
          )
          
          redirect_to competition_path(@competition), notice: 'Successfully Picked a Winner! -- please check the messages tab in order to get in contact with the winner'
        
        elsif @competition.category == 'first_listener'
          picked_winner = @competition.competitors.first.phone_number
          @competition.winner = picked_winner
          @competition.save
          
          # Send SMS to winner
          boot_twilio
          sms = @client.messages.create(
            from: ENV["TWILIO_NUMBER"],
            to: picked_winner,
            body: "Hello! You've won our competition - #{@competition.title} - we will contact you soon for your prize!"
          )
          
          message = Message.create!(
            number: picked_winner,
            text: "Hello! You've won our competition - #{@competition.title} - we will contact you soon for your prize!",
            inbound: false
          )
          
          redirect_to competition_path(@competition), notice: 'Successfully Picked a Winner! -- please check the messages tab in order to get in contact with the winner'
        
        elsif @competition.category == 'last_listener'
          picked_winner = @competition.competitors.last.phone_number
          @competition.winner = picked_winner
          @competition.save
          
          # Send SMS to winner
          boot_twilio
          sms = @client.messages.create(
            from: ENV["TWILIO_NUMBER"],
            to: picked_winner,
            body: "Hello! You've won our competition - #{@competition.title} - we will contact you soon for your prize!"
          )
          
          message = Message.create!(
            number: picked_winner,
            text: "Hello! You've won our competition - #{@competition.title} - we will contact you soon for your prize!",
            inbound: false
          )
          
          redirect_to competition_path(@competition), notice: 'Successfully Picked a Winner! -- please check the messages tab in order to get in contact with the winner'
        
        elsif @competition.category == 'two_random'
          first_winner = @competition.competitors.order("RANDOM()").first.phone_number
          second_winner = @competition.competitors.order("RANDOM()").first.phone_number
          @competition.winner = first_winner
          @competition.second_winner = second_winner
          @competition.save
          
          # Send SMS to winners
          boot_twilio
          
          @client.messages.create(
            from: ENV["TWILIO_NUMBER"],
            to: first_winner,
            body: "Hello! You are the first winner of our competition - #{@competition.title} - we will contact you soon for your prize!"
          )
          
           
          @client.messages.create(
            from: ENV["TWILIO_NUMBER"],
            to: second_winner,
            body: "Hello! You are the second winner of our competition - #{@competition.title} - we will contact you soon for your prize!"
          )
          
          Message.create!(
            number: first_winner,
            text: "Hello! You are the first winner of our competition - #{@competition.title} - we will contact you soon for your prize!",
            inbound: false
          )    
          
          Message.create!(
            number: second_winner,
            text: "Hello! You are the second winner of our competition - #{@competition.title} - we will contact you soon for your prize!",
            inbound: false
          )
          
          redirect_to competition_path(@competition), notice: 'Successfully Picked Winners! -- please check the messages tab in order to get in contact with the winner'
                
        elsif @competition.category == 'three_random'
          first_winner = @competition.competitors.order("RANDOM()").first.phone_number
          second_winner = @competition.competitors.order("RANDOM()").first.phone_number
          third_winner = @competition.competitors.order("RANDOM()").first.phone_number
          @competition.winner = first_winner
          @competition.second_winner = second_winner
          @competition.third_winner = third_winner
          @competition.save
          
          # Send SMS to winners
          boot_twilio
          
          @client.messages.create(
            from: ENV["TWILIO_NUMBER"],
            to: first_winner,
            body: "Hello! You are the first winner of our competition - #{@competition.title} - we will contact you soon for your prize!"
          )
          
           
          @client.messages.create(
            from: ENV["TWILIO_NUMBER"],
            to: second_winner,
            body: "Hello! You are the second winner of our competition - #{@competition.title} - we will contact you soon for your prize!"
          )          
          
          @client.messages.create(
            from: ENV["TWILIO_NUMBER"],
            to: third_winner,
            body: "Hello! You are the third winner of our competition - #{@competition.title} - we will contact you soon for your prize!"
          )
          
          Message.create!(
            number: first_winner,
            text: "Hello! You are the first winner of our competition - #{@competition.title} - we will contact you soon for your prize!",
            inbound: false
          )    
          
          Message.create!(
            number: second_winner,
            text: "Hello! You are the second winner of our competition - #{@competition.title} - we will contact you soon for your prize!",
            inbound: false
          )      
          
          Message.create!(
            number: third_winner,
            text: "Hello! You are the third winner of our competition - #{@competition.title} - we will contact you soon for your prize!",
            inbound: false
          )
          
          redirect_to competition_path(@competition), notice: 'Successfully Picked Winners! -- please check the messages tab in order to get in contact with the winner'
                        
        elsif @competition.category == 'four_random'
          first_winner = @competition.competitors.order("RANDOM()").first.phone_number
          second_winner = @competition.competitors.order("RANDOM()").first.phone_number
          third_winner = @competition.competitors.order("RANDOM()").first.phone_number
          fourth_winner = @competition.competitors.order("RANDOM()").first.phone_number
          @competition.winner = first_winner
          @competition.second_winner = second_winner
          @competition.third_winner = third_winner
          @competition.fourth_winner = fourth_winner
          @competition.save
          
          # Send SMS to winners
          boot_twilio
          
          @client.messages.create(
            from: ENV["TWILIO_NUMBER"],
            to: first_winner,
            body: "Hello! You are the first winner of our competition - #{@competition.title} - we will contact you soon for your prize!"
          )
          
           
          @client.messages.create(
            from: ENV["TWILIO_NUMBER"],
            to: second_winner,
            body: "Hello! You are the second winner of our competition - #{@competition.title} - we will contact you soon for your prize!"
          )          
          
          @client.messages.create(
            from: ENV["TWILIO_NUMBER"],
            to: third_winner,
            body: "Hello! You are the third winner of our competition - #{@competition.title} - we will contact you soon for your prize!"
          )     
          
          @client.messages.create(
            from: ENV["TWILIO_NUMBER"],
            to: fourth_winner,
            body: "Hello! You are the fourth winner of our competition - #{@competition.title} - we will contact you soon for your prize!"
          )
          
          Message.create!(
            number: first_winner,
            text: "Hello! You are the first winner of our competition - #{@competition.title} - we will contact you soon for your prize!",
            inbound: false
          )    
          
          Message.create!(
            number: second_winner,
            text: "Hello! You are the second winner of our competition - #{@competition.title} - we will contact you soon for your prize!",
            inbound: false
          )      
          
          Message.create!(
            number: third_winner,
            text: "Hello! You are the third winner of our competition - #{@competition.title} - we will contact you soon for your prize!",
            inbound: false
          )    
          
          Message.create!(
            number: fourth_winner,
            text: "Hello! You are the fourth winner of our competition - #{@competition.title} - we will contact you soon for your prize!",
            inbound: false
          )
          
          redirect_to competition_path(@competition), notice: 'Successfully Picked Winners! -- please check the messages tab in order to get in contact with the winner'
                                
        elsif @competition.category == 'five_random'
          first_winner = @competition.competitors.order("RANDOM()").first.phone_number
          second_winner = @competition.competitors.order("RANDOM()").first.phone_number
          third_winner = @competition.competitors.order("RANDOM()").first.phone_number
          fourth_winner = @competition.competitors.order("RANDOM()").first.phone_number
          fifth_winner = @competition.competitors.order("RANDOM()").first.phone_number
          @competition.winner = first_winner
          @competition.second_winner = second_winner
          @competition.third_winner = third_winner
          @competition.fourth_winner = fourth_winner
          @competition.fifth_winner = fifth_winner
          @competition.save
          
          # Send SMS to winners
          boot_twilio
          
          @client.messages.create(
            from: ENV["TWILIO_NUMBER"],
            to: first_winner,
            body: "Hello! You are the first winner of our competition - #{@competition.title} - we will contact you soon for your prize!"
          )
          
           
          @client.messages.create(
            from: ENV["TWILIO_NUMBER"],
            to: second_winner,
            body: "Hello! You are the second winner of our competition - #{@competition.title} - we will contact you soon for your prize!"
          )          
          
          @client.messages.create(
            from: ENV["TWILIO_NUMBER"],
            to: third_winner,
            body: "Hello! You are the third winner of our competition - #{@competition.title} - we will contact you soon for your prize!"
          )     
          
          @client.messages.create(
            from: ENV["TWILIO_NUMBER"],
            to: fourth_winner,
            body: "Hello! You are the fourth winner of our competition - #{@competition.title} - we will contact you soon for your prize!"
          )         
          
          @client.messages.create(
            from: ENV["TWILIO_NUMBER"],
            to: fifth_winner,
            body: "Hello! You are the fifth winner of our competition - #{@competition.title} - we will contact you soon for your prize!"
          )
          
          Message.create!(
            number: first_winner,
            text: "Hello! You are the first winner of our competition - #{@competition.title} - we will contact you soon for your prize!",
            inbound: false
          )    
          
          Message.create!(
            number: second_winner,
            text: "Hello! You are the second winner of our competition - #{@competition.title} - we will contact you soon for your prize!",
            inbound: false
          )      
          
          Message.create!(
            number: third_winner,
            text: "Hello! You are the third winner of our competition - #{@competition.title} - we will contact you soon for your prize!",
            inbound: false
          )    
          
          Message.create!(
            number: fourth_winner,
            text: "Hello! You are the fourth winner of our competition - #{@competition.title} - we will contact you soon for your prize!",
            inbound: false
          )         
          
          Message.create!(
            number: fifth_winner,
            text: "Hello! You are the fifth winner of our competition - #{@competition.title} - we will contact you soon for your prize!",
            inbound: false
          )
          
          redirect_to competition_path(@competition), notice: 'Successfully Picked Winners! -- please check the messages tab in order to get in contact with the winner'
        
        elsif @competition.nth_listener.present?
          picked_winner = @competition.competitors[@competition.nth_listener].phone_number
          @competition.winner = picked_winner
          @competition.save
          
          # Send SMS to winner
          # boot_twilio
          # sms = @client.messages.create(
          #   from: ENV["TWILIO_NUMBER"],
          #   to: picked_winner,
          #   body: "Hello! You've won our competition - #{@competition.title} - we will contact you soon for your prize!"
          # )
          
          # message = Message.create!(
          #   number: picked_winner,
          #   text: "Hello! You've won our competition - #{@competition.title} - we will contact you soon for your prize!",
          #   inbound: false
          # )
          
          redirect_to competition_path(@competition), notice: 'Successfully Picked a Winner! -- please check the messages tab in order to get in contact with the winner'
        
        else
          picked_winner = @competition.competitors.order("RANDOM()").first.phone_number
          @competition.winner = picked_winner
          @competition.save
          
          # Send SMS to winner
          boot_twilio
          sms = @client.messages.create(
            from: ENV["TWILIO_NUMBER"],
            to: picked_winner,
            body: "Hello! You've won our competition - #{@competition.title} - we will contact you soon for your prize!"
          )
          
          message = Message.create!(
            number: picked_winner,
            text: "Hello! You've won our competition - #{@competition.title} - we will contact you soon for your prize!",
            inbound: false
          )
          
          redirect_to competition_path(@competition), notice: 'Successfully Picked a Winner! -- please check the messages tab in order to get in contact with the winner'
          
        end
          
      else
        redirect_to competition_path(@competition), notice: 'There are no competitors yet!' 
      end
    end
  end
  
  private
  
    def boot_twilio
      account_sid = ENV["TWILIO_ACCOUNT_SID"]
      auth_token = ENV["TWILIO_AUTH_TOKEN"]
      @client = Twilio::REST::Client.new account_sid, auth_token
    end
  
    def set_competition
      @competition = Competition.find(params[:id])
    end
    
    def competition_params
      params.require(:competition).permit(:title, :keyword, :category, :start_date, :end_date)
    end
end
