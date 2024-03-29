require "ostruct"

class ConvertDataService
  attr_reader :data

  def initialize(raw_data)
    @data = raw_data
  end

  def convert
    products = []

    results_count = data["results_count"]
    return products if results_count == 0

    total_results_count = data["total_results_count"] || "0"
    for i in 0..(results_count - 1)
      record = data["results"][i]
      product = OpenStruct.new(
          id: record["sem3_id"],
          price: record["price"],
          manufacturer: record["manufacturer"],
          color: record["color"],
          brand: record["brand"],
          images: record["images"],
          description: record["description"],
          total_results_count: total_results_count
      )

      products << product
    end
    products
  end
end