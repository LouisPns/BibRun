class BibsController < ApplicationController
  def new
    @bib = Bib.new
    @races_names_table = []
    Race.all.each { |r| @races_names_table << r.name }
  end

  def create
    @bib = current_user.bibs.new(bib_params)
    if @bib.save
      redirect_to me_path
    else
      render :new
    end
  end

  private

  def bib_params
    params[:bib].permit(:price, :sale_reason, :race_id, :user_id)
  end

end
