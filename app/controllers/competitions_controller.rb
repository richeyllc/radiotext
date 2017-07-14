class CompetitionsController < ApplicationController
  before_action :set_competition, only: [:show, :edit, :update, :pick_winner]
  skip_before_action :verify_authenticity_token, only: [:incoming_sms]
  
  def index
    @competitions = Competition.all
  end
  
  def show
  end
  
  def new
    @competition = Competition.new
  end
  
  def create
    @competition = Competition.new(competition_params)
    
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
      params.require(:competition).permit(:title, :keyword)
    end
end
