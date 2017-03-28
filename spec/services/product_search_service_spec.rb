require "rails_helper"

describe ProductSearchService do
  let!(:api) { Semantics3Api.new }
  let(:product_service) { ProductSearchService.new(api) }

  before do
    stub_request(:get, /api.semantics3.com/)
    .to_return(status: 200, body: File.read(File.join("spec", "fixtures", "example_api_data.json")))
  end

  it "returns products from third-party API based on a search term" do
    query = double
    products = product_service.get_products(query)

    expect(products["results"].count).to eq(10)
  end
end