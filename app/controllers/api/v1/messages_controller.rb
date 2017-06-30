class Api::V1::MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  # skip_before_action :verify_authenticity_token
  protect_from_forgery unless: -> { request.format.json? }

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
    render json: {status: 'SUCCESS', message: 'Loaded all messages', data: @messages}, status: :ok
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    render json: {status: 'SUCCESS', message: 'Loaded all messages', data: @message}, status: :ok
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.json { render :show, status: :ok, location: @message }
      else
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @essage.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def dashboard
    # Change the following to reflect the count of unread messages
    unread_messages = Message.count
  end

  def update_message
    # Parameters
    # {"SmsSid"=>"SM2ac6f06941ab47d19c6a608344666b0a",
    # "SmsStatus"=>"sent",
    # "MessageStatus"=>"sent",
    # "To"=>"+14353134714",
    # "MessageSid"=>"SM2ac6f06941ab47d19c6a608344666b0a",
    # "AccountSid"=>"ACcf44816e028745afb7164f3075ffea9f",
    # "From"=>"+14352161902", "ApiVersion"=>"2010-04-01",
    # "controller"=>"api/v1/messages",
    # "action"=>"update_message",
    # "message_id"=>"25"} permitted: false>):
    message = Message.find(params["message_id"])
    # TODO: Update the PhoneNumber models
    to_number = PhoneNumber.find_by(number: params["To"])
    from_number = PhoneNumber.find_by(number: params["From"])
    # Determine which of these numbers is the true "MyNumber"
    my_number_candidate_1 = MyNumber.find_by(phone_number: to_number)
    my_number_candidate_2 = MyNumber.find_by(phone_number: from_number)
    real_my_number = nil
    incoming_message = nil
    contact = nil
    if my_number_candidate_1.nil?
      # This is not the real MyNumber
      if my_number_candidate_2.nil?
        # This should never hapen
        raise "This should never happen!"
      else
        # candidate 2 is the real my_number
        real_my_number = my_number_candidate_2
        incoming_message = false
      end
    else
      # candidate 1 is the real my_number
      real_my_number = my_number_candidate_1
      incoming_message = true
    end
    message.conversation = Conversation.find_by(my_number: real_my_number)
    # Update the contact
    incoming_message = true ? contact = Contact.find_or_create_by(phone_number: from_number) : contact = Contact.find_or_create_by(PhoneNumber: to_number)
    # TODO: Get rid of the phone_number_id field in the Message table.
    # Update the message status
    message.sms_status = params["SmsStatus"]
    message.status = params["Status"]
    message.api_version = params["ApiVersion"]
    message.sms_sid = params["SmsSid"]
    message.message_sid = params["MessageSid"]
    message.account_sid = params["AccountSid"]
    # save the message
    message.save

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:contact_id, :phone_number_id, :twilio_date_created, :twilio_date_updated, :date_sent, :account_sid, :to, :from, :body, :status, :flag, :api_version, :price, :uri, :twilio_data)
    end
end
