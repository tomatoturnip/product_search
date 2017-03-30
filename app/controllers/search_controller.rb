class SearchController < ApplicationController
  def index
    @products = [] if product_params.nil?

    if product_params[:query]
      product_params[:query].squish!
      products = CacheApiResponseService.cache_response(product_params, Semantics3Api::EXPIRATION_POLICY) do
        fetch_products
      end

      return show_error_message_if_no_products if products.count < 1
      @products = Kaminari.paginate_array(products, total_count: products.first.total_results_count).page(product_params[:page]).per(10)
    end
  end

  private

  def show_error_message_if_no_products
    flash[:error] = "No products found"
  end

  def fetch_products
    api = Semantics3Api.new
    service = ProductSearchService.new(api)
    raw_data = service.get_products(product_params)
    ConvertDataService.new(raw_data).convert
  end

  def product_params
    params.permit(:query, :page)
  end
end