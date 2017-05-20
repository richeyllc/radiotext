class ScheduleTypesController < ApplicationController
  before_action :set_schedule_type, only: [:show, :edit, :update, :destroy]

  # GET /schedule_types
  # GET /schedule_types.json
  def index
    @schedule_types = ScheduleType.all
  end

  # GET /schedule_types/1
  # GET /schedule_types/1.json
  def show
  end

  # GET /schedule_types/new
  def new
    @schedule_type = ScheduleType.new
  end

  # GET /schedule_types/1/edit
  def edit
  end

  # POST /schedule_types
  # POST /schedule_types.json
  def create
    @schedule_type = ScheduleType.new(schedule_type_params)

    respond_to do |format|
      if @schedule_type.save
        format.html { redirect_to @schedule_type, notice: 'Schedule type was successfully created.' }
        format.json { render :show, status: :created, location: @schedule_type }
      else
        format.html { render :new }
        format.json { render json: @schedule_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedule_types/1
  # PATCH/PUT /schedule_types/1.json
  def update
    respond_to do |format|
      if @schedule_type.update(schedule_type_params)
        format.html { redirect_to @schedule_type, notice: 'Schedule type was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule_type }
      else
        format.html { render :edit }
        format.json { render json: @schedule_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedule_types/1
  # DELETE /schedule_types/1.json
  def destroy
    @schedule_type.destroy
    respond_to do |format|
      format.html { redirect_to schedule_types_url, notice: 'Schedule type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule_type
      @schedule_type = ScheduleType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_type_params
      params.require(:schedule_type).permit(:name, :description)
    end
end
