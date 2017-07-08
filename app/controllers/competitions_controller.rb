class CompetitionsController < ApplicationController
  before_action :set_competition, only: [:show]
  
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
  
  private
  
    def set_competition
      @competition = Competition.find(params[:id])
    end
end
