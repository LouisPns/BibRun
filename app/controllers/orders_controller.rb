class OrdersController < ApplicationController
  def new
  end

  def index
  end

  def show
  end

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

  def edit
  end

  def update
  end

end
