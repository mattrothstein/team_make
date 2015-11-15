class SeasonsController < ApplicationController
  before_action :set_club

  def index
    @season = Season.new
    @seasons = @club.seasons.all

  end

  def new
    @season = Season.new
  end

  def create
    @season = Season.new(season_params)
    if @season.save
      redirect_to club_season_path(current_club, @season)
    else
      render :new
    end
  end

  def destroy
  end

  # def active
  #   current_year = Time.now.year
  #   @seasons.find_by(:year[ :year >= current_year])
  # end

  def show
    @season = Season.find(params[:id])
    @team = Team.new
    @teams = @season.teams.all
  end

  private

  def set_club
    @club = current_club
  end

  def season_params
    params.require(:season).permit(:year, :club_id)
  end

end
