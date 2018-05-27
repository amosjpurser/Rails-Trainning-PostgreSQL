class PortfoliosController < ApplicationController
  def index
	@portfolios_items = Portfolio.all
	end

  def angular
	  @angular_portfolio_items = Portfolio.angular
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

  def edit
	@portfolios_item = Portfolio.find(params[:id])
	end

  def update
	@portfolios_item = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolios_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'The record was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog_test }
      else
        format.html { render :edit }
        format.json { render json: @blog_test.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
		@portfolios_item = Portfolio.find(params[:id])
	end

def destroy
		# Performs the lookup
		@portfolios_item = Portfolio.find(params[:id])

		# Destroys/delete the record
		@portfolios_item.destroy

		# Redirects
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolios record successfully destroyed.' }
    end
  end

end
