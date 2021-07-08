class ProductsController < ApplicationController
  def index
    render :index, locals: { products: Product.all.ordered }
  end

  def show
    render :show, locals: { product: product }
  end

  def new
    render :new, locals: { product: Product.new }
  end

  def create
    if params[:file].nil?
      render :new, locals: { product: Product.new }
    else
      Product.import_csv(params[:file])

      redirect_to root_path, notice: 'Productos agregados'
    end
  end

  private

  def product
    Product.find(params[:id])
  end
end
