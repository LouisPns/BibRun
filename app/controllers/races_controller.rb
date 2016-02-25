class RacesController < ApplicationController
  before_action :find_race, only: [:show ]

  def index
    @races = Race.all
    @check_in = params[:search][:check_in].to_date
    @check_out = params[:search][:check_out].to_date
    @search = params[:search][:address]
    @radius = params[:search][:radius]

    if @search.present?
      @races = @races.near(@search, @radius)
      @races = @races.select { |r| r.date.between?(@check_in, @check_out) } if @check_in.present? && @check_out.present?
    end

    # Let's DYNAMICALLY build the markers for the view.
    @markers = Gmaps4rails.build_markers(@races) do |race, marker|
      marker.lat race.latitude
      marker.lng race.longitude
    end
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