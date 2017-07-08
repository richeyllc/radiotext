class CompetitionsController < ApplicationController
  before_action :set_competition, only: [:show, :edit, :update]
  
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
  
  private
  
    def set_competition
      @competition = Competition.find(params[:id])
    end
    
    def competition_params
      params.require(:competition).permit(:title, :keyword)
    end
end
