require "rails_helper"

describe PaginationService do
  let(:params) do
    { page: "2" }
  end

  let(:service) { PaginationService.new(params) }

  it "calculates the offset based on page number 2" do
    expect(service.get_offset).to eq(10)
  end

  it "calculates the offset based on page number 1" do
    params[:page] = "1"
    expect(service.get_offset).to eq(0)

    params[:page] = nil
    expect(service.get_offset).to eq(0)
  end

  it "calculates the offset based on page number 3" do
    params[:page] = 3
    expect(service.get_offset).to eq(20)
  end
end