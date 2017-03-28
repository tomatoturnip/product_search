class ProductSearchService
  attr_reader :product_service

  def initialize(product_service)
    @product_service = product_service
  end

  def get_products(search_term)
    product_service.build_request(search_term)
    product_service.run_request
    product_service.print_results
  end
end