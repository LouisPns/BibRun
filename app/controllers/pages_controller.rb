class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def me
    @bibs = current_user.bibs
  end
end
