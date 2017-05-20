class BlastTypesController < ApplicationController
  before_action :set_blast_type, only: [:show, :edit, :update, :destroy]

  # GET /blast_types
  # GET /blast_types.json
  def index
    @blast_types = BlastType.all
  end

  # GET /blast_types/1
  # GET /blast_types/1.json
  def show
  end

  # GET /blast_types/new
  def new
    @blast_type = BlastType.new
  end

  # GET /blast_types/1/edit
  def edit
  end

  # POST /blast_types
  # POST /blast_types.json
  def create
    @blast_type = BlastType.new(blast_type_params)

    respond_to do |format|
      if @blast_type.save
        format.html { redirect_to @blast_type, notice: 'Blast type was successfully created.' }
        format.json { render :show, status: :created, location: @blast_type }
      else
        format.html { render :new }
        format.json { render json: @blast_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blast_types/1
  # PATCH/PUT /blast_types/1.json
  def update
    respond_to do |format|
      if @blast_type.update(blast_type_params)
        format.html { redirect_to @blast_type, notice: 'Blast type was successfully updated.' }
        format.json { render :show, status: :ok, location: @blast_type }
      else
        format.html { render :edit }
        format.json { render json: @blast_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blast_types/1
  # DELETE /blast_types/1.json
  def destroy
    @blast_type.destroy
    respond_to do |format|
      format.html { redirect_to blast_types_url, notice: 'Blast type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blast_type
      @blast_type = BlastType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blast_type_params
      params.require(:blast_type).permit(:name, :description)
    end
end
