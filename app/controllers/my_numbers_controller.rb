class MyNumbersController < ApplicationController
  before_action :set_my_number, only: [:show, :edit, :update, :destroy]

  # GET /my_numbers
  # GET /my_numbers.json
  def index
    @my_numbers = MyNumber.all
  end

  # GET /my_numbers/1
  # GET /my_numbers/1.json
  def show
  end

  # GET /my_numbers/new
  def new
    @my_number = MyNumber.new
  end

  # GET /my_numbers/1/edit
  def edit
  end

  # POST /my_numbers
  # POST /my_numbers.json
  def create
    @my_number = MyNumber.new(my_number_params)

    respond_to do |format|
      if @my_number.save
        format.html { redirect_to @my_number, notice: 'My number was successfully created.' }
        format.json { render :show, status: :created, location: @my_number }
      else
        format.html { render :new }
        format.json { render json: @my_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_numbers/1
  # PATCH/PUT /my_numbers/1.json
  def update
    respond_to do |format|
      if @my_number.update(my_number_params)
        format.html { redirect_to @my_number, notice: 'My number was successfully updated.' }
        format.json { render :show, status: :ok, location: @my_number }
      else
        format.html { render :edit }
        format.json { render json: @my_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_numbers/1
  # DELETE /my_numbers/1.json
  def destroy
    @my_number.destroy
    respond_to do |format|
      format.html { redirect_to my_numbers_url, notice: 'My number was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_number
      @my_number = MyNumber.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def my_number_params
      params.require(:my_number).permit(:name, :phone_number_id, :description)
    end
end
