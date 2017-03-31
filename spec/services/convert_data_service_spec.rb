require "rails_helper"

describe ConvertDataService do
  let(:data) { JSON.parse(File.read(File.join("spec", "fixtures", "example_api_data.json"))) }
  let(:service) { ConvertDataService.new(data) }

  it "converts raw data into product objects" do
    converted_data = service.convert

    expect(converted_data.first.id).to eq("42tf6maIeuWw0q00McIcQO")
    expect(converted_data.first.price).to eq("679.99")
    expect(converted_data.first.manufacturer).to eq("Apple")
    expect(converted_data.first.color).to eq("Gold")
    expect(converted_data.first.brand).to eq("Iphone")
    expect(converted_data.first.images).to eq(["http://sem3-idn.s3-website-us-east-1.amazonaws.com/04a29350c86afe88b40fd34dc440e0d9,0.jpg", "http://sem3-idn.s3-website-us-east-1.amazonaws.com/79f663b839dc2e884a7815e5abf4dd3d,0.jpg"])
    expect(converted_data.first.description).to eq("Built on 64-bit desktop-class architecture, the ne... (visit site URLs for full description)")
    expect(converted_data.first.total_results_count).to eq(100000)
  end
end