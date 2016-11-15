class ProductsController < ApplicationController
	before_action :find_product, only: [:edit, :update, :destroy]

  def index
  	@products = Product.includes(:categories)
  end

  def new
  	@product = Product.new

  end

  def create
  	@product = Product.new(product_params)
  	if @product.save
  		redirect_to products_path
  	else
  		render :new
  	end
  end

  def edit
    
  end

  def update
  	if @product.update(product_params)
  		redirect_to products_path
  	else
  		render :edit
  	end
  end

  def destroy
  	@product.destroy
  	redirect_to products_path
  end

  private

  def find_product
      @product = Product.find(params[:id])
    end
  #Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, category_ids: [])
    end

end
