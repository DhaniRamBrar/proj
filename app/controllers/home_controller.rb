class HomeController < ApplicationController
  def index
    search_options = {
      keyword: params[:keyword],
      category_id: params[:category_id]
    }

    @products = Product.search_and_filter(search_options).page(params[:page]).per(6)
    @new_products = Product.where('created_at >= ?', 3.days.ago)
  end

  def new
    @new_products = Product.where('created_at >= ?', 3.days.ago)
  end
  def show
    @product = Product.find(params[:id])
  end

  def sale
    @products_on_sale = Product.where(sale: true).page(params[:page]).per(6)
  end

end
