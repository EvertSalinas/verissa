class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
  end

  def index
    if params[:query].present?
      @products = Product.search(params[:query], page: params[:page])
    else
      @products = Product.all
    end
  end

  def autocomplete
    render json: Product.search(params[:query], {
      fields: ["name"],
      match: :word_start,
      limit: 10,
      load: false,
      misspellings: {below: 5}
    }).map(&:title)
  end

end
