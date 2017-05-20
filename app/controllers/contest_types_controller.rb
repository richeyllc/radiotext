class ContestTypesController < ApplicationController
  before_action :set_contest_type, only: [:show, :edit, :update, :destroy]

  # GET /contest_types
  # GET /contest_types.json
  def index
    @contest_types = ContestType.all
  end

  # GET /contest_types/1
  # GET /contest_types/1.json
  def show
  end

  # GET /contest_types/new
  def new
    @contest_type = ContestType.new
  end

  # GET /contest_types/1/edit
  def edit
  end

  # POST /contest_types
  # POST /contest_types.json
  def create
    @contest_type = ContestType.new(contest_type_params)

    respond_to do |format|
      if @contest_type.save
        format.html { redirect_to @contest_type, notice: 'Contest type was successfully created.' }
        format.json { render :show, status: :created, location: @contest_type }
      else
        format.html { render :new }
        format.json { render json: @contest_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contest_types/1
  # PATCH/PUT /contest_types/1.json
  def update
    respond_to do |format|
      if @contest_type.update(contest_type_params)
        format.html { redirect_to @contest_type, notice: 'Contest type was successfully updated.' }
        format.json { render :show, status: :ok, location: @contest_type }
      else
        format.html { render :edit }
        format.json { render json: @contest_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contest_types/1
  # DELETE /contest_types/1.json
  def destroy
    @contest_type.destroy
    respond_to do |format|
      format.html { redirect_to contest_types_url, notice: 'Contest type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contest_type
      @contest_type = ContestType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contest_type_params
      params.require(:contest_type).permit(:name, :description)
    end
end
