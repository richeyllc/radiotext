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
    @competition = Competition.new(params.require(:competition).permit(:title, :keyword))
    
    if @competition.save
      redirect_to competition_path(@competition)
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    @competition.update(params.require(:competition).permit(:title, :keyword))
    redirect_to competition_path(@competition)
  end
  
  private
  
    def set_competition
      @competition = Competition.find(params[:id])
    end
end
