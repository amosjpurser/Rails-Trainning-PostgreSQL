class PortfoliosController < ApplicationController
  def index
	@portfolios_items = Portfolio.all
	end

  def new
	@portfolios_item = Portfolio.new
	end

	def create 
	@portfolios_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

		respond_to do |format|
			if @portfolios_item.save
				format.html { redirect_to portfolios_path, notice: 'Your portfolio is now live.' }
			else 
				format.html { render :new }
			end
		end
	end
end
