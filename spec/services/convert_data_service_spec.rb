require "rails_helper"

describe ConvertDataService do
  let(:data) { JSON.parse(File.read(File.join("spec", "fixtures", "example_api_data.json"))) }
  let(:service) { ConvertDataService.new(data) }

  it "converts raw data into product objects" do
    converted_data = service.convert

    expect(converted_data.first.price).to eq("679.99")
    expect(converted_data.first.manufacturer).to eq("Apple")
    expect(converted_data.first.color).to eq("Gold")
    expect(converted_data.first.brand).to eq("Iphone")
    expect(converted_data.first.total_results_count).to eq(100000)
  end
end