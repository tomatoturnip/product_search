require "semantics3_api"

class Semantics3Api
  attr_reader :sem3, :products

  API_KEY        ||= ENV["SEMANTICS3_API_KEY"]
  API_SECRET     ||= ENV["SEMANTICS3_SECRET_KEY"]
  SEARCH         ||= "search"
  OFFSET         ||= "offset"
  EXPIRATION_POLICY ||= 1.minute

  def initialize
    @sem3 = Semantics3::Products.new(API_KEY, API_SECRET)
  end

  def build_request(params)
    sem3.products_field(SEARCH, params[:query])
    sem3.products_field(OFFSET, calculate_offset(params))
  end

  def run_request
    @products = sem3.get_products
  end

  private

  def calculate_offset(params)
    offset = PaginationService.new(params).get_offset
    offset
  end
end