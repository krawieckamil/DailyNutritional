class ProductsController < ApplicationController
  before_filter :authenticate_user!

def index
  @products = Product.all
end

def new
  @product = Products.new
end

def create
  @product = Product.create(products_params)
  redirect_to products_path
end

def edit
  @product = Product.find(params[:id])
end

def update
  @product = Product.find(params[:id])
  if @product.update_attributes(products_params)
    # Handle a successful update.
  else
    render 'edit'
  end
  redirect_to products_path
end

def destroy
  @product = Product.find(params[:id])
  @product.destroy
  redirect_to products_path
end
def products_params
  params.require(:product).permit(:name, :kcal)
end
end
