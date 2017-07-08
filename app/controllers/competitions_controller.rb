class CompetitionsController < ApplicationController
  before_action :set_competition, only: [:show]
  
  def index
    @competitions = Competition.all
  end
  
  def show
  end
  
  private
  
    def set_competition
      @competition = Competition.find(params[:id])
    end
end
