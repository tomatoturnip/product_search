require "semantics3_api"

class Semantics3Api
  attr_reader :sem3, :products

  API_KEY        = ENV["SEMANTICS3_API_KEY"]
  API_SECRET     = ENV["SEMANTICS3_SECRET_KEY"]
  SEARCH = "search"

  def initialize
    @sem3 = Semantics3::Products.new(API_KEY, API_SECRET)
  end

  def build_request(search_term)
    sem3.products_field(SEARCH, search_term)
  end

  def run_request
    @products = sem3.get_products
  end

  def print_results
    products
  end
end