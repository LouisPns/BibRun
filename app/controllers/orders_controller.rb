class OrdersController < ApplicationController


  def create
    @order = current_user.orders.new(date: Date.today)
    @bib = Bib.find(params[:bib_id])
    @order.bib = @bib
    if @order.save
      redirect_to me_path
    else
      render :create
    end
  end

end
