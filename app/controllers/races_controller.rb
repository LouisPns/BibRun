class RacesController < ApplicationController
  before_action :find_race, only: [:show ]

  def index
    @races = Race.all
  end

  def create
    @race = Race.new(race_params)
    if @race.save
      redirect_to race_path(@race)
    else
      render :new
    end
  end

  def new
    @race = Race.new
  end

  def edit
  end

  def show
  end

  def update
  end

  private

  def race_params
    params[:race].permit(:name, :date, :address, :distance, :race_type, :label, :picture, :picture_cache)
  end

  def find_race
    @race = Race.find(params[:id])
  end
end
