class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'The record successfully update.'}
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    # Trovo l'oggetto di interesse
    @portfolio_item = Portfolio.find(params[:id])

    # Distruggo/Cancello il record
    @portfolio_item.destroy

    # Faccio il redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio eliminato.'}
    end
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio items is now live'}
      else
        format.html { render :new }
      end
    end
  end
end
