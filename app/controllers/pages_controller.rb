class PagesController < ApplicationController
  def home
  end

  def me
    @bibs = current_user.bibs
  end
end
