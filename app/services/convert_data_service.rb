require "ostruct"

class ConvertDataService
  attr_reader :data

  def initialize(raw_data)
    @data = raw_data
  end

  def convert
    products = []

    results_count = data["results_count"]
    for i in 0..(results_count - 1)
      record = data["results"][i]
      product = OpenStruct.new(
          price: record["price"],
          manufacturer: record["manufacturer"],
          color: record["color"],
          brand: record["brand"]
      )

      products << product
    end
    products
  end
end