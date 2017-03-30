class ProductSearchService
  attr_reader :product_service

  def initialize(product_service)
    @product_service = product_service
  end

  def get_products(params)
    product_service.build_request(params)
    product_service.run_request
  end
end