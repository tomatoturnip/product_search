class SearchController < ApplicationController
  def index
    @products = [] if product_params.nil?

    if product_params[:query]
      fetch_products
    end
  end

  private

  def fetch_products
    api = Semantics3Api.new
    service = ProductSearchService.new(api)
    raw_data = service.get_products(params[:query])
    @products = ConvertDataService.new(raw_data).convert
  end

  def product_params
    params.permit(:query)
  end
end